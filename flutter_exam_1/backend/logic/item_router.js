import { Router } from "express";
import { getAllItemsC, getFavoritesByUserC } from "./item_controller.js";
import { TokenValidator } from "../middlewares/validateToken.js";
const router = Router();

router
    .get('/all', TokenValidator, getAllItemsC)
    .get('/favorites',TokenValidator, getFavoritesByUserC);   


export default router;