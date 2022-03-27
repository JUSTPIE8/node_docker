const express=require("express")
const authController=require('../controller/authController')

const router=express.Router();

router.post("/signup",authController.Signup)
router.post('/login',authController.login)
module.exports=router
