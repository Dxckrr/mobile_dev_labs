import connection from '../providers/database.js';
export async function getAllMessages() {
    try {
        const query = 'SELECT * FROM articles';
        const [rows] = await connection.query(query);

        if (rows.length > 0) {
            return rows;
        } else {
            return [];
        }
    } catch (error) {
        console.error("Error retrieving items:", error);
        return null;
    }
}
export async function getAllItems() {
    try {
        const query = 'SELECT * FROM articles';
        const [rows] = await connection.query(query);

        if (rows.length > 0) {
            return rows;
        } else {
            return [];
        }
    } catch (error) {
        console.error("Error retrieving items:", error);
        return null;
    }
}


