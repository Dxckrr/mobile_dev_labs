import { Router } from "express";
import { getAllItemsC, getFavoritesByUserC, getItemsWithFavoritesByUserC, updateFavoritesC } from "./item_controller.js";
import { TokenValidator } from "../middlewares/validateToken.js";
const router = Router();

router
    .post('/sync_favorites', TokenValidator, updateFavoritesC)
    .get('/all', getAllItemsC)
    .get('/user', TokenValidator, getItemsWithFavoritesByUserC)
    .get('/favorites', TokenValidator, getFavoritesByUserC);


export default router;