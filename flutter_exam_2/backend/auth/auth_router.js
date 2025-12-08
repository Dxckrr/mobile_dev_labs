import { Router } from "express";
import { signin, profile, signup, getAllUsersC } from "./auth_controller.js";
import { TokenValidator } from "../middlewares/validateToken.js";
const router = Router();

router
    .post('/signin', signin)
    .post('/signup',signup)
    .get('/users',TokenValidator,getAllUsersC)
    .get('/validate', TokenValidator, profile);


export default router;