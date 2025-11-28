import { getAllItems, getFavoritesByUser } from './item_service.js';

export const getAllItemsC = async (_req, res) => {
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
export const getFavoritesByUserC = async (req, res) => {
    try {
        const items = await getFavoritesByUser(req.user.id);
        if (!items) {
            return res.status(404).json({ success: false, message: 'Error obteniendo los items.' });
        }
        res.status(200).json(items);

    } catch (error) {
        console.error("Error getting all items: ", error);
        return res.status(404).json({ success: false, message: 'Error interno del servidor.' });
    }
};
