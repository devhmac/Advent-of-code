const fs = require('fs')
input = process.argv[2]
data = fs.readFileSync(input, 'utf8')
data = data.split('\n')

const part1 = (data) => {
  result = data.map((string) => {
    string = string.split('')
    first = string.find(char => parseInt(char))
    last = string.findLast(char => parseInt(char))

    return first + last
  }).reduce((a, b) => {
    return Number(a) + Number(b)
  })

  return result
}


const partTwo = (data) => {

  const hash = {
    'zero': 0,
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9
  }
  searchArr = Object.keys(hash)
  result = data.map(line => {

    for (let i = 0; i < searchArr.length; i++) {
      line = line.replace(searchArr[i], hash[searchArr[i]])
    }
    return line
  })
  return result
}

// console.log(Object.keys(map))


// regex = /one|two|three|four|five|six|seven|eight|nine|zero/
// console.log('hellothisistwonow'.search(regex))

console.log(part1(partTwo(data)))