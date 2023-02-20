var mysql=require("mysql");

var con=mysql.createConnection({
    multipleStatements: true,
    host:"localhost",
    user:"root",
    password:"",
    database:"intothemind",
});

module.exports=con;