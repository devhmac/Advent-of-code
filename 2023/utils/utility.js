const fs = require('fs')
const getData = () => {


  input = process.argv[2]
  return data = fs.readFileSync(input, 'utf8')
}


module.exports = { getData }