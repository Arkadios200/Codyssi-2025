func getLines() -> [Int] {
  var lines = [Int]()
  while let line = readLine() {
    lines.append(Int(line)!)
  }

  return lines
}

let abc: (Int) -> Int = { $0 * $0 * $0 * 55 + 495 }

func part1(_ rooms: [Int]) -> Int {
  return abc(rooms.sorted()[rooms.count/2])
}

func part2(_ rooms: [Int]) -> Int {
  return abc(rooms.filter { $0 % 2 == 0 }.reduce(0, +))
}

func part3(_ rooms: [Int]) -> Int {
  return rooms.map { (q: $0, c: abc($0)) }.filter { $0.c <= 15000000000000 }.max(by: { $0.q < $1.q } )!.q
}

let rooms = getLines()

print("Part 1 answer: \(part1(rooms))")
print("Part 2 answer: \(part2(rooms))")
print("Part 3 answer: \(part3(rooms))")
