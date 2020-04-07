const express = require('express');
const sql = require('mssql/msnodesqlv8');
const os = require('os');

(async () => {
    // Connect to the SQL database
    await sql.connect({
        server: 'localhost\\SQLEXPRESS',
        database: 'TrainingRecords',
        options: {
            trustedConnection: true
        }
    });

    // Create the express app instance
    const app = express();
    const port = 3000;

    // Use a static router for serving our pages
    const static = express.static(`${__dirname}/static`);
    app.use(static);

    // Add handlers for our APIs
    app.get('/api/status', (req, res) => {
        // Get basic machine status
        res.statusCode = 200;
        res.send(`${os.hostname()} - ${os.platform()} - ${os.release()}`);
    });

    app.get('/api/users', async (req, res) => {
        // Deliver the list of users
        try {
            const result = await sql.query("EXEC DetailedUsers");
            res.statusCode = 200;
            res.send(result.recordset);
        } catch (error) {
            res.statusCode = 500;
            res.send(error.stack);
        }
    });

    // Start the Express app listening
    app.listen(port, () => {
        console.log(`Started Express app listening on port ${port}`);
    });
})();