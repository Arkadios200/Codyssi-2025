func getLines() -> [String] {
  var lines = [String]()
  while let line = readLine() {
    lines.append(line)
  }

  return lines
}

func memory(_ s: String) -> Int {
  return s.reduce(0, {
    if let i = Int(String($1)) {
      return $0 + i
    } else {
      return $0 + Int($1.asciiValue!) - 64
    }
  } )
}

func lossyCompress(_ line: String) -> String {
  let n = line.count / 10

  return line.prefix(n) + String(line.count - 2 * n) + line.suffix(n)
}

func losslessCompress(_ line: String) -> String {
  var line = line
  var out = ""

  while !line.isEmpty {
    let c = line.first!
    let n = line.prefix(while: { $0 == c } ).count
    out += String(n) + String(c)
    line.removeFirst(n)
  }

  return out
}

let lines = getLines()

let total1 = lines.reduce(0, { $0 + memory($1) } )
print("Part 1 answer: \(total1)")

let total2 = lines.reduce(0, { $0 + memory(lossyCompress($1)) } )
print("Part 2 answer: \(total2)")

let total3 = lines.reduce(0, { $0 + memory(losslessCompress($1)) } )
print("Part 3 answer: \(total3)")
