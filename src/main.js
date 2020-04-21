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
            const result = await sql.query(
                `SELECT 
                    Id, FirstName, LastName, Department,
                    Location, TrainingsCompleted, TrainingsRequired
                 FROM DetailedUsers`
            );

            res.statusCode = 200;
            res.send(result.recordset);
        } catch (error) {
            res.statusCode = 500;
            res.send(error.stack);
        }
    });

    app.get('/api/user', async (req, res) => {
        // Deliver the list of users
        try {
            const { userId } = req.query;
            if (!userId) {
                throw new Error("No userId param was specified");
            }

            let result = await sql.query(
                `SELECT Id, FirstName, LastName, Department, Location FROM Users
                 WHERE Id = ${userId};

                 SELECT DocId, DocName, DocVer FROM UsersAndTrainings
                 WHERE Id = ${userId} AND TrainedVer >= DocVer;

                 SELECT DocId, DocName, DocVer, TrainedVer FROM UsersAndTrainings
                 WHERE Id = ${userId} AND (TrainedVer < DocVer OR TrainedVer IS NULL);`
            );

            // We only need the first rows data from the first select statement
            const output = result.recordsets[0][0];
            if (!output) {
                throw new Error("No result for the specified userId was found");
            }

            // Use the results of the next two select statements
            // as the array of done and needed trainings
            output.CompletedTrainings = result.recordsets[1];
            output.NeededTrainings = result.recordsets[2];

            res.statusCode = 200;
            res.send(output);
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