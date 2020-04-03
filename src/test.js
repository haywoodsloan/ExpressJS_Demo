const sql = require('mssql/msnodesqlv8');

(async () => {
    try {
        await sql.connect({
            server: 'localhost\\SQLEXPRESS',
            database: 'TrainingRecords',
            options: {
                trustedConnection: true
            }
        });

        const result = await sql.query`select * from dbo.Users`;
        console.log(result.recordset);
    } catch (error) {
        console.error(error);
    } finally {
        sql.close();
    }
})();