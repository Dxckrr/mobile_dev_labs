import { Router } from "express";
import { signin, profile } from "./auth_controller.js";
import { TokenValidator } from "./validateToken.js";
const router = Router();

router
    .post('/signin', signin)
    .get('/validate', TokenValidator, profile);


export default router;