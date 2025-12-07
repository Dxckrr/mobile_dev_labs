import { getAllItems } from './message_service.js';

export const sendMessage = async (_req, res) => {
    try {
        const items = await getAllItems();
        if (!items) {
            return res.status(404).json({ success: false, message: 'Error obteniendo los items.' });
        }
        res.status(200).json(items);

    } catch (error) {
        console.error("Error getting all items: ", error);
        return res.status(404).json({ success: false, message: 'Error interno del servidor.' });
    }
};
export const getAllMessagesC = async (_req, res) => {
    try {
        const items = await getAllMessages();
        if (!items) {
            return res.status(404).json({ success: false, message: 'Error obteniendo los items.' });
        }
        res.status(200).json(items);

    } catch (error) {
        console.error("Error getting all items: ", error);
        return res.status(404).json({ success: false, message: 'Error interno del servidor.' });
    }
};