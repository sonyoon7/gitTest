var express = require('express');
var router = express.Router();


/* GET home page. */
router.get('/', function(req, res, next) {


  console.log(process.env.env)
  console.log(req.app.get('env'))
  console.log('ssss')
  res.send(process.env.env);
});

module.exports = router;
