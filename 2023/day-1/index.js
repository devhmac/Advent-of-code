const fs = require('fs')
input = process.argv[2]
data = fs.readFileSync(input, 'utf8')

data = data.split('\n')


result = data.map((string) => {
  string = string.split('')
  first = string.find(char => parseInt(char))
  last = string.findLast(char => parseInt(char))

  return first + last
}).reduce((a, b) => {
  return Number(a) + Number(b)
})




console.log(result)