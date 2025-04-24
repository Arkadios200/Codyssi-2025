let input = readLine()!

let total1 = input.filter { $0.isLetter }.count
print("Part 1 answer: \(total1)")

let letters = Array(" abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
var temp = input.map { letters.firstIndex(of: $0) ?? 0 }

let total2 = temp.reduce(0, +)
print("Part 2 answer: \(total2)")

for i in temp.indices where temp[i] == 0 {
  let n = temp[i-1] * 2 - 5
  temp[i] = n + 52 * (n < 1 ? 1 : n > 52 ? -1 : 0)
}

let total3 = temp.reduce(0, +)
print("Part 3 answer: \(total3)")