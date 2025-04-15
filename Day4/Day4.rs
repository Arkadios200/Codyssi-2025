use std::fs;

fn main() {
  let input = fs::read_to_string("input.txt").unwrap();
  let lines: Vec<_> = input.split_whitespace().collect();

  let total1 = lines.iter().fold(0, |acc, &line| acc + memory(line));
  println!("Part 1 answer: {total1}");

  let total2 = lines.iter().fold(0, |acc, &line| acc + memory(&lossy_compress(line)));
  println!("Part 2 answer: {total2}");

  let total3 = lines.iter().fold(0, |acc, &line| acc + memory(&lossless_compress(line)));
  println!("Part 3 answer: {total3}");
}

fn memory(line: &str) -> u32 {
  line.chars().fold(0, |acc, c| {
    acc + match c.to_digit(10) {
      Some(i) => i,
      None => (c as u8 - 64) as u32
    }
  })
}

fn lossy_compress(line: &str) -> String {
  let n = line.len() / 10;

  format!("{}{}{}",
    &line[..n],
    line.len() - 2 * n,
    &line[line.len()-n..]
  )
}

fn lossless_compress(line: &str) -> String {
  let mut s = String::from(line);
  let mut out = String::new();

  while !s.is_empty() {
    let c = s.chars().next().unwrap();
    let n = s.drain(
        ..s.chars().position(|e| e != c)
        .unwrap_or(s.len())
      ).collect::<String>()
      .len();

    out += format!("{n}{c}").as_str();
  }

  out
}
