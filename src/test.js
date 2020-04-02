const sql = require('mssql');

(async () => {
    try {
        await sql.connect({
            server: 'localhost',
            database: 'TrainingRecords'
        });

        const result = await sql.query`select * from TrainingRecords`;
        console.log(result);
    } catch (err) {
        console.error(err);
    }
})();