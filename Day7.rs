use std::fs;
use std::iter::zip;
use std::cmp::{min, max};

fn main() {
  let input = fs::read_to_string("input.txt").unwrap();
  let (freqs, swaps, test) = process(&input);

  println!("Part 1: {}", part1(&freqs, &swaps, test));
  println!("Part 2: {}", part2(&freqs, &swaps, test));
  println!("Part 3: {}", part3(&freqs, &swaps, test));
}

fn process(input: &str) -> (Vec<i32>, Vec<(usize, usize)>, usize) {
  let mut blocks = input.split("\n\n");

  let freqs: Vec<i32> = blocks.next().unwrap()
    .lines()
    .map(|line| line.parse().unwrap()).collect();

  let swaps: Vec<(usize, usize)> = blocks.next().unwrap()
    .lines()
    .map(|line| {
      let (a, b) = line.split_once('-').unwrap();
      (a.parse::<usize>().unwrap() - 1, b.parse::<usize>().unwrap() - 1)
    }).collect();

  let test: usize = blocks.next().unwrap()
    .parse::<usize>().unwrap() - 1;

  (freqs, swaps, test)
}

fn part1(freqs: &[i32], swaps: &[(usize, usize)], test: usize) -> i32 {
  let mut freqs = freqs.to_owned();

  for &(x, y) in swaps {
    freqs.swap(x, y);
  }

  freqs[test]
}

fn part2(freqs: &[i32], swaps: &[(usize, usize)], test: usize) -> i32 {
  let mut freqs = freqs.to_owned();

  for i in 0..swaps.len() {
    let (x, y) = swaps[i];
    let z = swaps[(i+1) % swaps.len()].0;

    let temp = freqs[z];
    freqs[z] = freqs[y];
    freqs[y] = freqs[x];
    freqs[x] = temp;
  }

  freqs[test]
}

fn part3(freqs: &[i32], swaps: &[(usize, usize)], test: usize) -> i32 {
  let mut freqs = freqs.to_owned();

  for &(x, y) in swaps {
    let (min, max) = (min(x, y), max(x, y));

    for (a, b) in zip(min..max, max..freqs.len()) {
      freqs.swap(a, b);
    }
  }

  freqs[test]
}