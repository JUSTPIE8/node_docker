const express=require('express')
const mongoose=require('mongoose')
const postRouter=require('./routes/postRoutes')
const authRouter=require("./routes/authRoute")

const cors=require('cors')

const session=require('express-session')
//const redis=require('redis')
const ioredis=require('ioredis')

const{MONGO_USER,MONGO_IP,MONGO_PORT,MONGO_PASSWORD, REDIS_URL, REDIS_PORT, SESSION_SECRET}=require('./config/config');

let RedisStore=require('connect-redis')(session)

let redisClient = new ioredis(REDIS_PORT,REDIS_URL)
console.log()
const app=express()
app.use(express.json())
const mongoUrl=`mongodb://${MONGO_USER}:${MONGO_PASSWORD}@${MONGO_IP}:${MONGO_PORT}/?authSource=admin`
mongoose.connect(mongoUrl).then(
    ()=>console.log("sucessfully connected to database")
).catch((e)=>console.log(e));

app.enable('trust proxy')
app.use(cors({}));
app.use(
  session({
    store: new RedisStore({ client: redisClient }),
    
    secret:SESSION_SECRET,
  
    cookie:{
      secure:false,
      resave:false,
      saveUninitialized:false,
      httpOnly:true,
      maxAge:600000
    }
  }));
app.get("/",(req,res)=>{
  res.send("hello world ");
  console.log("hello")
})


  app.use('/posts',postRouter)
app.use('/auth',authRouter)

const port=process.env.PORT||3000
app.listen(3000,()=>{
    console.log('stared')
})
