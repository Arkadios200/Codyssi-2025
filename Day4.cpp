#include <iostream>
#include <fstream>
#include <string>
#include <vector>

std::vector<std::string> get_lines() {
  std::vector<std::string> lines = {};
  std::string line = "";

  std::ifstream input("input.txt");
  while (input >> line) lines.push_back(line);
  input.close();

  return lines;
}

int memory(std::string line) {
  int acc = 0;
  for (char c : line) acc += c - (c >= 'A' && c <= 'Z' ? 64 : 48);

  return acc;
}

std::string lossy_compress(std::string line) {
  int n = line.size() / 10;

  return line.substr(0, n)
    + std::to_string(line.size() - 2 * n)
    + line.substr(line.size() - n);
}

std::string lossless_compress(std::string line) {
  std::string out = "";

  while (!line.empty()) {
    const char c = line[0];
    size_t n = 0;
    while (line[n] == c) n++;

    out += std::to_string(n) + c;
    line.erase(0, n);
  }

  return out;
}

int main() {
  const std::vector<std::string> lines = get_lines();

  int total1 = 0, total2 = 0, total3 = 0;

  for (std::string line : lines) {
    total1 += memory(line);
    total2 += memory(lossy_compress(line));
    total3 += memory(lossless_compress(line));
  }
    
  std::cout << "Part 1 answer: " << total1 << '\n';
  std::cout << "Part 2 answer: " << total2 << '\n';
  std::cout << "Part 3 answer: " << total3;
}