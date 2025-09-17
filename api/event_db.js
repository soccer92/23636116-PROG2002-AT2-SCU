/*
	Name: Thomas Carpenter
    Student ID: 23636116
    Description: SQL Connection for the Charity Events Database.
*/
const mysql = require('mysql2');

// Initialise MySQL Connection
const Connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'config#1',
    database: 'charityevents_db'
});

// Open the MySQL Connection
Connection.connect((err) => {
    if (err) {
        console.error('Error connecting to the database:', err);
        return;
    }
    console.log('Connected to the MySQL database.');
});

module.exports = Connection;