import connection from '../providers/database.js';
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
export async function getFavoritesByUser(id) {
    try {
        const query = `SELECT 
            a.id,
            a.name,
            a.seller,
            a.rating,
            a.img_url,
            f.added_at
            FROM favorites f
            INNER JOIN articles a ON f.article_id = a.id
            WHERE f.user_id = ?`;
        const [rows] = await connection.query(query,[id]);

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

