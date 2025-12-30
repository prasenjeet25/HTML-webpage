const express = require('express');
const router = express.Router();
const pool = require('../db');
const createResult = require('../util/result');

router.get("/", (req, res) => {
    sql = "select * from api_test1";
    pool.query(sql,(error,data)=>{
        res.send(createResult(error,data));
    });
  
});

router.post("/",(req,res)=>{
    let {name,email,course}=req.body
    sql = "insert into api_test1 values(?,?,?)"

    pool.query(sql,[name,email,course],(error,data) => {
        res.send(createResult(error,data))
    })
})

router.put("/",(req,res)=>{
    let {name,email,course}=req.body
    sql = "update api_test1 set email=?,course=? where name=?"

    pool.query(sql,[email,course,name],(error,data) => {
        res.send(createResult(error,data))
    })
})
module.exports = router;

router.delete("/",(req,res)=>{
    let {name}=req.body
    sql = "delete from api_test1 where name=?"

    pool.query(sql,[name],(error,data) => {
        res.send(createResult(error,data))
    })
})

module.exports = router;