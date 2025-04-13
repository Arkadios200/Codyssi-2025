let letterValues: [Character: Int] = [
  "a": 01, "A": 27,
  "b": 02, "B": 28,
  "c": 03, "C": 29,
  "d": 04, "D": 30,
  "e": 05, "E": 31,
  "f": 06, "F": 32,
  "g": 07, "G": 33,
  "h": 08, "H": 34,
  "i": 09, "I": 35,
  "j": 10, "J": 36,
  "k": 11, "K": 37,
  "l": 12, "L": 38,
  "m": 13, "M": 39,
  "n": 14, "N": 40,
  "o": 15, "O": 41,
  "p": 16, "P": 42,
  "q": 17, "Q": 43,
  "r": 18, "R": 44,
  "s": 19, "S": 45,
  "t": 20, "T": 46,
  "u": 21, "U": 47,
  "v": 22, "V": 48,
  "w": 23, "W": 49,
  "x": 24, "X": 50,
  "y": 25, "Y": 51,
  "z": 26, "Z": 52
]

let input = readLine()!

let temp = input.filter { $0.isLetter }

let total1 = temp.count
print("Part 1 answer: \(total1)")

let total2 = temp.reduce(0, { $0 + letterValues[$1]! } )
print("Part 2 answer: \(total2)")

let arr = Array(input)
var newArr = [Int](repeating: 0, count: arr.count)
arr.indices.forEach {
  if arr[$0].isLetter {
    newArr[$0] = letterValues[arr[$0]]!
  } else {
    var n = newArr[$0-1] * 2 - 5
    if n < 1 {
      n += 52
    } else if n > 52 {
      n -= 52
    }

    newArr[$0] = n
  }
}

let total3 = newArr.reduce(0, +)
print("Part 3 answer: \(total3)")