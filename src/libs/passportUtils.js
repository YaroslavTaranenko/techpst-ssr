const bcrypt = require('bcrypt');

module.exports.generatePassword = async (password) => {
  const hash = await bcrypt.hash(password, 5)
  return hash
}

module.exports.validatePasswords = async (password, hash) =>{
  return bcrypt.compare(password, hash)
}