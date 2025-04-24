func getLines() -> [Bool] {
  var lines = [Bool]()
  while let line = readLine() {
    lines.append(line == "TRUE")
  }

  return lines
}

func calc(_ gates: inout [Bool]) -> Int {
  let temp = gates.indices.filter { $0 % 2 == 0 }.map { (gates[$0], gates[$0+1]) }
  gates = temp.indices.map {
    let (a, b) = temp[$0]
    return $0 % 2 == 0 ? a && b : a || b
  }

  return gates.filter { $0 }.count
}

let lines = getLines()

let ans1 = lines.indices.reduce(0) { $0 + (lines[$1] ? $1 + 1 : 0) }
print("Part 1 answer: \(ans1)")

var gates = lines

let ans2 = calc(&gates)
print("Part 2 answer: \(ans2)")

var ans3 = lines.filter { $0 }.count + ans2
while gates.count >= 2 {
  ans3 += calc(&gates)
}

print("Part 3 answer: \(ans3)")