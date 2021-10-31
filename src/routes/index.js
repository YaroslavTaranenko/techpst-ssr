const { Router } = require('express')
const authRouter = require('./admin/auth')

const router = Router()

router.use('/auth', authRouter)

router.get('/', (req, res,next)=>{
  res.json({success: true, message: "root dir1"})
})

module.exports = router