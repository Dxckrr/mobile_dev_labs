import jwt from "jsonwebtoken";
const TOKEN_SECRET = process.env.TOKEN_SECRET;
/**
 * Validtes a jwt
 * @param req
 * @param res
 * @param next
 * @returns access token to next function
 */
export const TokenValidator = (req, res, next) => {
  const token = req.header("auth-token");
  if (!token) return res.status(401).json("Acceso denegado.");
  //get datos del token
  const payload = jwt.verify(token, TOKEN_SECRET || " ");
  console.log("payload", payload);
  req.user = payload.user;
  console.log("req =>", req.user);
  next();
};
