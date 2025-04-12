func getInput() -> ([Int], [Character]) {
  var nums = [Int]()
  var signs = [Character]()
  while let line = readLine() {
    if let i = Int(line) {
      nums.append(i)
    } else {
      signs = Array(line)
    }
  }

  return (nums, signs)
}

func calc(_ nums: [Int], _ signs: [Character]) -> Int {
  return nums.dropFirst().enumerated().reduce(nums.first!, {
    let (i, e) = $1
    return $0 + e * (signs[i] == "+" ? 1 : -1)
  } )
}

let (nums, signs) = getInput()

print("Part 1 answer: \(calc(nums, signs))")

print("Part 2 answer: \(calc(nums, signs.reversed()))")

let nums3 = nums.indices.filter( { $0 % 2 == 0 } ).map( { nums[$0] * 10 + nums[$0+1] } )
print("Part 3 answer: \(calc(nums3, signs.reversed()))")
