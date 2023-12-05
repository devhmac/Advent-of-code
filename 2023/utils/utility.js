import fs from 'fs';
const getData = () => {

  let input = process.argv[2]
  return fs.readFileSync(input, 'utf8')
}


// module.exports = { getData }
export { getData }