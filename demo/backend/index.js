const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send(makeid(10))
})

app.use(express.static('public'));

function makeid(length) {
  var result           = '';
  var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  var charactersLength = characters.length;
  for ( var i = 0; i < length; i++ ) {
    result += characters.charAt(Math.floor(Math.random() * 
charactersLength));
 }
 return result;
}

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
