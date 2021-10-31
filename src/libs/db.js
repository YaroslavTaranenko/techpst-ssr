const { Pool } = require('pg')

const pool = new Pool({
  host: process.env.PG_HOST,
  // port: process.env.PG_PORT,
  database: process.env.PG_BASE,
  user: process.env.PG_USER,
  password: process.env.PG_PASS
})

pool.on('error', (err, client) => {
  console.log('Unexpected error on idle client', err)
  // process.exit(-1)
})

pool.on('connect', ()=>{
  console.log(`DB connection established`)
})

module.exports = pool;