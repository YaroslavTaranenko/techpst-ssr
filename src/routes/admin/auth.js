const authCtrl = require('../../controllers/auth.controller')
const { Router } = require('express')
const router = Router()

router.post('/register', authCtrl.register)

router.get('/login', authCtrl.login)

module.exports = router
