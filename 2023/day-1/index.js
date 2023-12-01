const fs = require('fs')
input = process.argv[2]
data = fs.readFileSync(input, 'utf8')

data = data.split('\n')

const calibrations = []


const getFirstNumber = (string) => {
  for (let i = 0; i < string.length; i++) {
    if (parseInt(string[i])) {

      return string[i]
    }
  }
}
const getLastNumber = (string) => {
  for (let j = string.length - 1; j >= 0; j--) {
    if (parseInt(string[j])) {


      return string[j]
    }
  }
}

data.forEach((string) => {
  calibrations.push(getFirstNumber(string) + getLastNumber(string))
})

console.log(calibrations)

result = calibrations.reduce((a, b) => {
  return Number(a) + Number(b)
})

console.log(result)