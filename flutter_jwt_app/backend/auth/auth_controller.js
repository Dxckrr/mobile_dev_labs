import jwt from 'jsonwebtoken';
import { getUserByEmail, getUserFromDB } from './auth_service.js';

const TOKEN_SECRET = "1234"
/**
 * Authenticates a user by checking their email and password, and then logs them in.
 * 
 * @param req email && password
 * @param res
 * @returns if success , users data otherwise throws an error
 */
export const signin = async (req, res) => {
    try {
        const email = req.body.email;
        const password = req.body.password;
        const user = await getUserFromDB(email, password);

        console.log(user);
        if (!user) {
            return res.status(404).json({ success: false, message: 'Las credenciales son incorrectas.' });
        }
        const token = jwt.sign({ user: user }, TOKEN_SECRET || ' ', {
            expiresIn: 60 * 60 * 3  //una hora
        });
        res.json({token})
        // return res.status(200).header('auth-token', token).json(user);
    } catch (error) {
        console.error("Error during login: ", error);
        return res.status(404).json({ success: false, message: 'Error interno del servidor.' });
    }
};


/**
 * Gets the user profile from a token
 * @param req jwt id
 * @param res 
 * @returns the user session otherwise throws an error
 */
export const profile = async (req, res) => {
    const user = await getUserByEmail(req.user.email);
    if (!user) {
        console.log(user)
        return res.status(404).json({ message: 'Usuario no encontrado.' });
    }
    res.status(200).json(user);
};

