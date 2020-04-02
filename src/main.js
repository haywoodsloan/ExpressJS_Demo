const express = require('express');
const os = require('os');

// Create the express app instance
const app = express();
const port = 3000;

// Use a static router for serving our pages
const static = express.static(`${__dirname}/static`);
app.use(static);

// Add handlers for our APIs
app.get('/api/status', (req, res) => {
    res.statusCode = 200;
    res.end(`${os.hostname()} - ${os.platform()} - ${os.release()}`);
})

// Start the Express app listening
app.listen(port, () => {
    console.log(`Started Express app listening on port ${port}`);
});