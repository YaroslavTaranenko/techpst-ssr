const authSrv = require('../services/auth.service')

module.exports.register = async (req, res, next) => {

  const resp = await authSrv.register(req.body)
  
  res.json(resp)
}

module.exports.login = async(req, res, next)=>{
  res.json({success: true, message: 'login route', data: null})
}