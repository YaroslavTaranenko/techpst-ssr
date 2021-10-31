const app = require('./src/app')

const port = process.env.TECHPST_PORT || 3000

const start = async () =>{
  await app.listen(port)
  console.log(`Techpst app started at ${port} port`);
}

start()