const sql = require('mssql/msnodesqlv8');

(async () => {
    await sql.connect({
        server: 'localhost\\SQLEXPRESS',
        database: 'TrainingRecords',
        options: {
            trustedConnection: true
        }
    });

    const result = await sql.query`select * from dbo.Users`;
    console.log(result.recordset);

    sql.close();
})();