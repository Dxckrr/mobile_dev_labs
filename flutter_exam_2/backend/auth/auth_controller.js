import jwt from 'jsonwebtoken';
import { getUserByEmail, getUser , createUser, getAllUsers } from './auth_service.js';

const TOKEN_SECRET = process.env.TOKEN_SECRET;


export const signup = async (req, res) => {
    //Get values from request
    const email = req.body.email;
    const photo = req.body.photo;
    const full_name = req.body.full_name;
    const phone_number = req.body.phone_number;
    const role = req.body.role;
    const password = req.body.password
    //token
    const token_FCM = req.body.token_FCM;

    const user = {
        email: email,
        photo: photo,
        full_name: full_name,
        phone_number: phone_number,
        role:role,
        password:password
    }

    try {
        const response = await createUser(user,token_FCM);
        if (response) {
            console.log("Response de singup", response);
            res.status(200).header('auth-token', response.token).json({ success: true, message: 'Usuario creado exitosamente.', userCreate: response.userCreate });
        } else {
            res.status(404).json({ success: false, message: 'Error creando usuario.' });
        }
    } catch (error) {
        console.error("Error creating user: ", error);
        res.status(404).json({ success: false, message: 'Error creando usuario.' });
    }
};

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
        const token_FCM = req.body.token_FCM
        const user = await getUser(email, password,token_FCM);

        console.log(user);
        if (!user) {
            return res.status(404).json({ success: false, message: 'Las credenciales son incorrectas.' });
        }
        const token = jwt.sign({ user: user }, TOKEN_SECRET || ' ', {
            expiresIn: "7d"  //7 dias
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
    console.log(req.user)
    const user = await getUserByEmail(req.user.email);
    if (!user) {
        console.log(user)
        return res.status(404).json({ message: 'Usuario no encontrado.' });
    }
    res.status(200).json(user);
};
export const getAllUsersC = async (req, res) => {
    const users = await getAllUsers(req.user.email);
    if (!users) {
        console.log(users)
        return res.status(404).json({ message: 'Usuarios no encontrados.' });
    }
    res.status(200).json(users);
};
