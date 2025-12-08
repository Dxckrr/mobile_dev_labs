import { getReceivedMessages, sendMessage } from "./message_service.js";

export const sendMessageC = async (req, res) => {
    try {
        const message = {
            tittle: req.body.tittle,
            body: req.body.body,
            email_from: req.body.email_from,
            email_to: req.body.email_to,
        };

        const response = await sendMessage(message);
        if (!response) {
            return res.status(404).json({ success: false, message: 'Error al enviar el mensaje.' });
        }
        res.status(200).json(response);

    } catch (error) {
        console.error("Error getting all items: ", error);
        return res.status(404).json({ success: false, message: 'Error interno del servidor.' });
    }
};
export const getReceivedMessagesC = async (req, res) => {
    try {
        const {email} = req.params
        const messages = await getReceivedMessages(email);
            if (!messages) {
            return res.status(404).json({ success: false, message: 'Error al obtener los mensajes.' });
        }
        res.status(200).json(messages);

    } catch (error) {
        console.error("Error getting all items: ", error);
        return res.status(404).json({ success: false, message: 'Error interno del servidor.' });
    }
};