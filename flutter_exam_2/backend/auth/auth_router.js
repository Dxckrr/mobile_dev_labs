import { Router } from "express";
import { signin, profile, signup } from "./auth_controller.js";
import { TokenValidator } from "../middlewares/validateToken.js";
const router = Router();

router
    .post('/signin', signin)
    .post('/signup',signup)
    .get('/validate', TokenValidator, profile);


export default router;