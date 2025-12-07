import express from 'express';
import cors from 'cors';
import morgan from 'morgan';
import authRouter from './auth/auth_router.js';
import itemRouter from './messages/messages_router.js';
import dotenv from "dotenv";
dotenv.config();
const app = express();
const port = 3000;


app.use(cors({
  origin: '*',
  credentials: true,
}));

// MIDDLEWARES
app.use(morgan('dev'));
app.use(express.json());


// ROUTES
app.use('/api/auth', authRouter);
app.use('/api/messages', itemRouter);

app.listen(port, () => {
  console.log(`Server is listening on ${port}`);
});

app.on('error', (err) => {
  console.error('Error starting server:', err);
});