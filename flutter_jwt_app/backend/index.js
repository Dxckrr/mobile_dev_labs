import express from 'express';
import cors from 'cors';
import morgan from 'morgan';
import authRouter from './auth/auth_router.js';
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

app.listen(port, () => {
  console.log(`Server is listening on ${port}`);
});

app.on('error', (err) => {
  console.error('Error starting server:', err);
});