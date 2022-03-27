const User=require('../models/userModel');
const bcrypt=require("bcryptjs")

exports.Signup=async(req,res)=>{
    const {username,password}=req.body
       try{
         const hashpassword=await bcrypt.hash(password,12)

        const newuser=await User.create({
            username,
            password:hashpassword
        })
    req.session.user=newuser
        res.status(201).json({
            status:'success',
            data:{
                user:newuser
            }
        })
    }catch(err){
        res.status(400).json({
            status:'fail'
        })
    }
}

exports.login=async(req,res)=>{
    const {username,password}=req.body
    try{
        const user=await User.findOne({username})

        if(!user){
            return res.status(404).json({
                status:'fail',
                message:"username not found"
            })
        }

        const isCorrect=await bcrypt.compare(password,user.password)
        if(isCorrect){
            req.session.user=user;
            res.status(200).json({
                status:'sucess'
            })
        }else{
            res.status(400).json({
                status:'fail',
                message:'incorrect username or password'
            })
        }

       
    }catch(err){
        res.status(400).json({
            status:'fail'
        })
    }
}
