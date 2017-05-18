import pypyodbc
connStr = """
DSN=myDb_SQLEXPRESS;
"""
cnxn = pypyodbc.connect(connStr)
crsr = cnxn.cursor()
sql = """
BULK INSERT myDb.dbo.SpikeData123
FROM 'C:\\__tmp\\biTest.txt' WITH (
    FIELDTERMINATOR='\\t',
    ROWTERMINATOR='\\n'
    );
"""
crsr.execute(sql)
cnxn.commit()
crsr.close()
cnxn.close()