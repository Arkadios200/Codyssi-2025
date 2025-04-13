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

let total1 = input.filter { $0.isLetter }.count
print("Part 1 answer: \(total1)")

var temp = input.map { $0.isLetter ? letterValues[$0]! : 0 }

let total2 = temp.reduce(0, +)
print("Part 2 answer: \(total2)")

for i in temp.indices where temp[i] == 0 {
  let n = temp[i-1] * 2 - 5
  temp[i] = n + 52 * (n < 1 ? 1 : n > 52 ? -1 : 0)
}
let total3 = temp.reduce(0, +)
print("Part 3 answer: \(total3)")