import { Router } from "express";
import { TokenValidator } from "../middlewares/validateToken.js";
import {  getReceivedMessagesC, sendMessageC } from "./messages_controller.js";
const router = Router();

router
    .post('/send', TokenValidator,sendMessageC)
    .get('/received/:email',TokenValidator,getReceivedMessagesC)

export default router;