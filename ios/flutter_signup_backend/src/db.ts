import mysql from 'mysql2/promise';

// Database connection pool
export const db = mysql.createPool({
  host: 'localhost',
  user: 'your_db_user',
  password: 'your_db_password',
  database: 'flutter_signup',
  waitForConnections: true,
  connectionLimit: 10,
});