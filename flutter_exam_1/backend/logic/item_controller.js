import { getAllItems, getFavoritesByUser, getItemWithFavoritesByUser, syncFavorites } from './item_service.js';

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
export const getItemsWithFavoritesByUserC = async (req, res) => {
    try {
        const items = await getItemWithFavoritesByUser(req.user.id);
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
        const items = await getItemWithFavoritesByUser(req.user.id);
        if (!items) {
            return res.status(404).json({ success: false, message: 'Error obteniendo los items.' });
        }
        res.status(200).json(items);

    } catch (error) {
        console.error("Error getting all items: ", error);
        return res.status(404).json({ success: false, message: 'Error interno del servidor.' });
    }
};
export const updateFavoritesC = async (req, res) => {
    console.log(req.body);
    const {favorites} = req.body;
    const userId = req.user.id;

    console.log(favorites, userId);
    try {
        const syncRes = await syncFavorites(userId, favorites);
        return res.status(200).json({ success: true, message: 'Favoritos sincronizados correctamente.' });
    } catch (error) {
        console.error("Error syncing favorites: ", error);
        return res.status(500).json({ success: false, message: 'Error interno del servidor.' });
    }
}
