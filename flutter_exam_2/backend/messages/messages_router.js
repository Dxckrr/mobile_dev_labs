import { Router } from "express";
import { TokenValidator } from "../middlewares/validateToken.js";
const router = Router();

router
    .post('/send', TokenValidator)
    .get('/received/:user',TokenValidator)

export default router;