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
export async function getItemWithFavoritesByUser(id) {
    try {
        const [rows] = await connection.query(`
      SELECT 
          a.id,
          a.name,
          a.seller,
          a.rating,
          a.img_url,
          IF(f.user_id IS NULL, 0, 1) AS is_favorite
        FROM articles a
        LEFT JOIN favorites f
            ON a.id = f.article_id AND f.user_id = ?
        ORDER BY a.id
        `, [id]);
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
        const [rows] = await connection.query(query, [id]);

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
export async function syncFavorites(userId, favorites) {
    try {
        const query = `DELETE FROM favorites 
        WHERE user_id = ?`;
        const [rows] = await connection.query(query, [userId]);
        for (const itemId of favorites) {
            await connection.query(
                "INSERT INTO favorites (user_id, article_id) VALUES (?, ?)",
                [userId, itemId]
            );
        }

        if (rows.length > 0) {
            return rows;
        } else {
            return [];
        }
    } catch (error) {
        console.error(error);
        return null;
    }
}


