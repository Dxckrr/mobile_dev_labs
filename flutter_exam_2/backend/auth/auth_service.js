import connection from "../providers/database.js";
export async function getUser(email, password,token_FCM) {
  try {
    const query = "SELECT * FROM users WHERE email = ? AND password = ?";
    const [rows] = await connection.query(query, [email, password]);
    const [existingToken] = await connection.query(
      `SELECT * FROM tokens_fcm WHERE user_email = ? AND token = ?`,
      [email, token_FCM]
    );

    if (existingToken.length === 0) {
      await connection.query(
        `INSERT INTO tokens_fcm (user_email, token) VALUES (?, ?)`,
        [email, token_FCM]
      );
    }
    if (rows.length > 0) {
      return rows[0];
    } else {
      return null;
    }
  } catch (error) {
    console.error("Error retrieving user:", error);
    return null;
  }
}

export async function createUser(user, token_FCM) {
  try {
    const query = `INSERT INTO usuarios (email, photo, full_name, phone_number,role)
             VALUES (?, ?, ?, ?, ?)`;
    const result = await connection.query(query, [
      user.email,
      user.photo,
      user.full_name,
      user.phone_number,
      user.role,
    ]);

    const query_token = `INSERT INTO tokens_fcm (user_email, token) VALUES (?, ?)`;
    const token_insert_result = await connection.query(query_token, [
      user.email,
      token_FCM,
    ]);

    const userId = result[0].insertId;
    console.log("userId", userId);
    const token = jwt.sign(
      { user: result[0] },
      process.env.TOKEN_SECRET || ""
    );
    if (!result && !token_insert_result) {
      return {
        success: false,
        message: "Error creating user.",
        token: token,
        userCreate: user,
      };
    }
    console.log("User created successfully.", result);
    return {
      success: true,
      message: "User, photo and phone created successfully.",
      token: token,
      userCreate: { user },
    };
  } catch (error) {
    console.error("Error creating user:", error);
    return { success: false, message: "Error creating user." };
  }
}
export async function getUserByEmail(email) {
  try {
    const query = "SELECT * FROM users WHERE email = ?";
    const [rows] = await connection.query(query, [email]);
    if (rows.length > 0) {
      return rows[0];
    } else {
      return null;
    }
  } catch (error) {
    console.error("Error retrieving user:", error);
    return null;
  }
}
export async function getAllUsers(email) {
  try {
    const query = "SELECT * FROM users WHERE email != ?";
    const [rows] = await connection.query(query, [email]);
    
    return rows.length > 0 ? rows : [];
  } catch (error) {
    console.error("Error retrieving users:", error);
    return [];
  }
}

