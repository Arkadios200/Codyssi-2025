func getLines() -> [[ClosedRange<Int>]] {
  var lines = [[ClosedRange<Int>]]()
  while let line = readLine() {
    lines.append(line.split(separator: " ").map {
      let temp = $0.split(separator: "-").map { Int(String($0))! }
      return temp[0]...temp[1]
    })
  }

  return lines
}

let lines = getLines()

let total1 = lines.reduce([], +).reduce(0, { $0 + $1.count } )
print("Part 1 answer: \(total1)")

let temp = lines.map { $0.reduce([], { $0 + Array($1) } ) }

let total2 = temp.reduce(0, { $0 + Set($1).count } )
print("Part 2 answer: \(total2)")

let total3 = temp.indices[1...].map { Set(temp[$0-1] + temp[$0]).count }.max()!
print("Part 3 answer: \(total3)")
