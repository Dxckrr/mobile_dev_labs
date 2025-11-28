import connection from '../providers/database.js';
export async function getUser(email, password) {
  try {
    const query = 'SELECT * FROM users WHERE email = ? AND password = ?';
    const [rows] = await connection.query(query, [email, password]);
    if (rows.length > 0) {
      return rows[0];
    } else {
      return null;
    }
  } catch (error) {
    console.error("Error retrieving user:", error);
    return null;
  }
}
export async function getUserByEmail(email) {
  try {
    const query = 'SELECT * FROM users WHERE email = ?';
    const [rows] = await connection.query(query, [email]);
    if (rows.length > 0) {
      return rows[0];
    } else {
      return null;
    }
  } catch (error) {
    console.error("Error retrieving user:", error);
    return null;
  }
}

