import { getData } from '../utils/utility.js'
const data = getData().split('\n')

console.log(data)
const time = data[0].split("Time:")[1].trim().split(/\s+/)


const record = data[1].split("Distance:")[1].trim().split(/\s+/)

let result = 1
time.forEach((raceTime, index) => {
  let options = 0
  console.log('race', index)
  for (let i = 0; i < raceTime; i++) {
    let distance = i * (raceTime - i)
    // console.log(record[index])
    if (distance > record[index])
      options++

  }
  result = result * options
})
console.log(result)