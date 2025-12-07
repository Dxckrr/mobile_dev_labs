import { Router } from "express";
import { TokenValidator } from "../middlewares/validateToken.js";
const router = Router();

router
    .post('/send', TokenValidator, updateFavoritesC)
    .get('/received/:user',TokenValidator,getMessagesByUser)

export default router;