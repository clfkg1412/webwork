var mysql = require('mysql');

class DBConnention{
    constructor(host,port,user,password,database)
    {
        this.host = host;
        this.user = user;
        this.password = password;
        this.port = port;
        this.database = database;
        this.conn = null;
    }


    dbErrHandle(err)
    {
        if(err)
        {
            console.error(err.stack || err);
        }
    }

    getConn()
    {
        if(!this.conn)
        {
            var connection = mysql.createConnection({
                host     : this.host,
                user     : this.user,
                password :  this.password,
                port:  this.port,
                database: this.database,
              });
            connection.connect(this.dbErrHandle);
            this.conn = connection;
        }
        return this.conn;
    }


}


module.exports = DBConnention;