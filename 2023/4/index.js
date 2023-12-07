import { getData } from '../utils/utility.js'
const data = getData().split('\n')

let result = 0
for (let i = 0; i < data.length; i++) {
  let tHash = {}
  let wHash = {}
  let winners = data[i].split(':')[1].split('|')[0].trim().split(/\s+/)
  let ticket = data[i].split('|')[1].trim().split(/\s+/)

  for (let num of ticket) {
    tHash[num] = (tHash[num] || 0) + 1
  }

  for (let num of winners) {
    wHash[num] = (wHash[num] || 0) + 1
  }


  let points = 0
  for (let num in tHash) {
    console.log("comparison", num, ': ', tHash[num], wHash[num])
    if (tHash[num] === wHash[num]) {
      console.log('considering match')
      points === 0 ? points = 1 : points = points * 2

    }
  }
  result = result + points
}