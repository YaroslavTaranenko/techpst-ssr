const passport = require('passport')
const LocalStrategy = require('passport-local').Strategy
const db = require('./db')
const { generatePassword, validatePasswords } = require('./passportUtils')

const getUserById = async (id) => {
  try {
    const response = await db.query(
      `SELECT uuid, email, username, first_name, last_name, status, avatar FROM users WHERE uuid='${id}';`,
    )
    const user = response.rows[0]
    return user ? user : null
  } catch (e) {
    console.log(e)
    return null
  }
}
const getUserByEmail = async (email) => {
  try {
    const response = await db.query(
      `SELECT uuid, email, password FROM users WHERE email='${email}';`,
    )
    const user = response.rows[0]
    return user ? user : null
  } catch (e) {
    console.log(e)
    return null
  }
}

passport.use(
  new LocalStrategy(
    {
      usernameField: 'email',
      passwordField: 'password',
    },
    async function (username, password, done) {
      try {
        const user = await getUserByEmail(username)
        if (user === null)
          return done(null, false, { message: 'Incorrect username.' })
        if (!validatePasswords(password, user.password))
          return done(null, false, { message: 'Incorrect password' })
        return done(null, user)
      } catch (e) {
        console.log(e)
        return done(e, false)
      }
    },
  ),
)

passport.serializeUser(function(user, done) {
  done(null, user.uuid);
});

passport.deserializeUser(function(id, done) {
  getUserById(id, function(err, user) {
    done(err, user);
  });
});