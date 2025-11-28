import { Router } from "express";
import { signin, profile } from "./auth_controller.js";
import { TokenValidator } from "../middlewares/validateToken.js";
const router = Router();

router
    .post('/signin', signin)
    .get('/validate', TokenValidator, profile);


export default router;