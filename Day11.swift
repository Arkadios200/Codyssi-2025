extension String {
  func splitOnce(separator: Character) -> (Substring, Substring)? {
    if let index = self.firstIndex(of: separator) {
      return (self[..<index], self[self.index(after: index)...])
    }

    return nil
  }
}

func getLines() -> [String] {
  var lines = [String]()
  while let line = readLine() {
    if line == "" { break }
    lines.append(line)
  }

  return lines
}

func exp(_ base: Int, _ pow: Int) -> Int {
  var out = 1
  for _ in 0..<pow {
    out *= base
  }

  return out
}

func base10(of s: String) -> Int {
  let (num, r) = s.splitOnce(separator: " ")!
  let radix = Int(r)!

  let digits = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")

  return Array(num).reversed().enumerated().reduce(0) {
    let (i, e) = $1
    return $0 + digits.firstIndex(of: e)! * exp(radix, i)
  }
}

func base68(of n: Int) -> String {
  let digits = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^")

  var out = ""

  var n = n
  while n > 0 {
    out.append(digits[n % 68])
    n /= 68
  }

  return String(out.reversed())
}

let lines = getLines()

let temp1 = lines.map { base10(of: $0) }

let ans1 = temp1.max()!
print("Part 1 answer: \(ans1)")

let temp2 = temp1.reduce(0, +)

let ans2 = base68(of: temp2)
print("Part 2 answer: \(ans2)")

var ans3 = 1
while exp(ans3, 4) - 1 < temp2 { ans3 += 1 }
print("Part 3 answer: \(ans3)")