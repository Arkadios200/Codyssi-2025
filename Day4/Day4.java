import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.util.ArrayList;

public class Main {
  public static void main(String[] args) throws FileNotFoundException {
    final ArrayList<String> lines = getLines();

    int total1 = 0, total2 = 0, total3 = 0;
    for (final String line : lines) {
      total1 += memory(line);
      total2 += memory(lossyCompress(line));
      total3 += memory(losslessCompress(line));
    }

    System.out.println(String.format("Part 1 answer: %d", total1));
    System.out.println(String.format("Part 2 answer: %d", total2));
    System.out.println(String.format("Part 3 answer: %d", total3));
  }

  static ArrayList<String> getLines() throws FileNotFoundException {
    ArrayList<String> lines = new ArrayList<String>();

    Scanner input = new Scanner(new File("../workspace/input.txt"));
    while (input.hasNextLine()) lines.add(input.nextLine());
    input.close();

    return lines;
  }

  static int memory(String line) {
    int acc = 0;
    for (final char c : line.toCharArray()) acc += (int) c - (c >= 'A' && c <= 'Z' ? 64 : 48);

    return acc;
  }

  static String lossyCompress(String line) {
    final int n = line.length() / 10;

    return String.format("%s%d%s", line.substring(0, n), line.length() - 2 * n, line.substring(line.length() - n));
  }

  static String losslessCompress(String line) {
    String out = "";

    while (!line.isEmpty()) {
      final char c = line.charAt(0);
      int n = 0;

      while (line.charAt(n) == c && ++n < line.length());
      out += String.format("%d%c", n, c);
      line = line.substring(n);
    }

    return out;
  }
}
