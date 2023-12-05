// const { getData } = require('../utils/utility.js')
import { getData } from '../utils/utility.js'

let data = getData()
data = data.split('\n')
// console.log(data)

let result = 0

const thresholds = {
  green: 13,
  red: 12,
  blue: 14
}

for (let i = 0; i < data.length; i++) {

  // console.log(data[i].split(/\d+\s\w+/g))

  let rounds = data[i].split(';')
  let check = true
  console.log("rounds ", rounds)

  rounds.forEach(round => {
    let count = {
      green: 0,
      red: 0,
      blue: 0
    }
    // console.log("round ", round)


    let pulls = round.match(/\d+\s\w+/g)
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