func getLines() -> [Int] {
  var lines = [Int]()
  while let line = readLine() {
    lines.append(Int(line)!)
  }

  return lines
}

let prices = getLines()

let total1 = prices.reduce(0, +)
print("Part 1 answer: \(total1)")

let total2 = prices.sorted(by: >)[20...].reduce(0, +)
print("Part 2 answer: \(total2)")

let total3 = prices.indices.reduce(0) { $0 + prices[$1] * ($1 % 2 == 0 ? 1 : -1) }
print("Part 3 answer: \(total3)")