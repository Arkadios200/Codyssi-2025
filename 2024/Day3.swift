extension String {
  func splitOnce(separator: Character) -> (Substring, Substring)? {
    if let index = self.firstIndex(of: separator) {
      return (self[..<index], self[self.index(after: index)...])
    }

    return nil
  }
}

func getLines() -> [(num: String, radix: Int)] {
  var lines = [(String, Int)]()
  while let line = readLine() {
    let (n, r) = line.splitOnce(separator: " ")!
    lines.append((String(n), Int(r)!))
  }

  return lines
}

func base65(_ n: Int) -> String {
  let digits = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#")

  var out = ""
  var n = n
  while n > 0 {
    out.append(digits[n % 65])
    n /= 65
  }

  return String(out.reversed())
}

let lines = getLines()

let ans1 = lines.reduce(0) { $0 + $1.radix }
print("Part 1 answer: \(ans1)")


let ans2 = lines.reduce(0) { $0 + Int($1.num, radix: $1.radix)! }
print("Part 2 answer: \(ans2)")

let ans3 = base65(ans2)
print("Part 3 answer: \(ans3)")