const fs = require('fs')
input = process.argv[2]
data = fs.readFileSync(input, 'utf8')
data = data.split('\n')

console.log(data)

result = 0

thresholds = {
  green: 13,
  red: 12,
  blue: 14
}

for (let i = 0; i < data.length; i++) {

  // console.log(data[i].split(/\d+\s\w+/g))

  rounds = data[i].split(';')
  let check = true
  console.log("rounds ", rounds)

  rounds.forEach(round => {
    count = {
      green: 0,
      red: 0,
      blue: 0
    }
    // console.log("round ", round)


    pulls = round.match(/\d+\s\w+/g)
    // console.log(pulls)
    pulls.map((pull) => {
      let [num, color] = pull.split(' ')
      count[color] += Number(num)
      if (count[color] > thresholds[color]) {
        check = false
      }

      // console.log(num, color)
    })

  })
  // console.log('round', data[i])
  // console.log("game: ", i + 1)
  // console.log('games', pulls)



  if (check) {
    result += i + 1
  }




}
console.log(result)