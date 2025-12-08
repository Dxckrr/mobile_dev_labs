import connection from '../providers/database.js';
import admin from '../providers/firebase.js'
export async function sendMessage(message) {

    try {
        const query = `SELECT token FROM tokens_fcm 
        WHERE user_email = ?`;

        const [tokensRows] = await connection.query(query,
            [message.email_to]
        );

        const tokens = tokensRows.map(row => row.token);

        const payload = {
            notification: {
                title: `Mensaje de ${message.email_from}: ${message.tittle}`,
                body: message.body
            },
            data: {
                mensajeId: Math.random().toString(36).substring(7)
            }
        };

        let results = [];

        for (let token of tokens) {
            try {

                const response = await admin.messaging().send({ ...payload, token: token });


                if (response.failureCount > 0) {
                    const failedTokens = response.responses.filter(r => r.error)
                        .map((r, i) => tokens[i]);

                    console.error(`Errores al enviar a los siguientes tokens:`, failedTokens);
                }

                results.push({ token, response });
                await connection.query(
                    `INSERT INTO messages (tittle, body, email_from, email_to, token_device_sent, notification)
                     VALUES (?, ?, ?, ?, ?, ?)`,
                    [message.tittle, message.body, message.email_from, message.email_to, token, JSON.stringify(results)]
                );

            } catch (error) {
                console.error(`Error al enviar al token ${token}:`, error.message || error);
                results.push({ token, error });
            }
        }

        return true
    } catch (err) {
        console.error(err);
        return false;
    }
}
export async function getReceivedMessages(email) {
    try {
        const query = 'SELECT tittle,body,email_from,created_at FROM messages WHERE email_to = ?';
        const [rows] = await connection.query(query,[email]);

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


