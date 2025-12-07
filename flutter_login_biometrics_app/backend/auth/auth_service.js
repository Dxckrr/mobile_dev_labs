const usersDatabase = [
  {
    email: "juandavid0101@gmail.com",
    password: "clase_de_moviles",
  },
  {
    email: "profe_ali@gmail.com",
    password: "backend",
  },
];

export async function getUserFromDB(email, password) {
  try {
    const user = usersDatabase.find(
      (u) => u.email === email && u.password === password
    );
    if (!user) return null;
    return user;
  } catch (error) {
    console.error("Error retrieving user:", error);
    return null;
  }
}
export async function getUserByEmail(email) {
  try {
    const user = usersDatabase.find(
      (u) => u.email === email
    );
    if (!user) return null;
    return user;
  } catch (error) {
    console.error("Error retrieving user:", error);
    return null;
  }
}
