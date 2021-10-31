const {v4} = require('uuid')
const db = require('../libs/db')
const { generatePassword } = require('../libs/passportUtils')

module.exports.login = () => {}

module.exports.register = async ({ email, password }) => {
  const hash = generatePassword(password)
  const query = `INSERT INTO users(uuid, email,password, createdAt, updatedAt) VALUES('${v4()}', '${email}', '${hash}', NOW(), NOW());`
  try {
    const user = await db.query(query)
    console.log(user)
    return { success: true, message: null, data: user }
  } catch (e) {
    console.log(e)
    return {
      success: false,
      message: e.message || 'Registration error',
      data: null,
    }
  }
}
