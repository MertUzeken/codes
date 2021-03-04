/*
* Author: Mert Uzeken
* Email: mertuzeken@gmail.com
* Github: https://github.com/MertUzeken
*/

package Klasurvorbereitung;

import java.util.Scanner;

/* Schreiben Sie ein Programm, das eine Zeichenkette einliest.
 * Aus dieser Zeichenkette ist der Teil zwischen den beiden Klammern ( und ) auszufiltern und auf der Konsole auszugeben.
 * Beachten Sie dabei mögliche Fälle in der Zeichenkette wie "a)(avc)".
 * Wenn mehrere Klammern ) nach der Klammer ( vorkommen, soll der der Teil zwischen der ersten Klammer ( und der ersten Klammer ) ausgefiltert werden.
 * Kommen die beiden Klammern in der Zeichenkette nicht vor, dann ist der leere String "" auszugeben.
*/

public class K1 {

	public static void main(String[] args) {

		Scanner eingabe = new Scanner(System.in);
		String search = eingabe.next();
		eingabe.close();

		int F = search.indexOf("(") + 1; // First occurence of (
		int L = search.lastIndexOf(")"); // First occurence of )

		String substring = "";
		substring = search.substring(F, L);

		print(substring);

	}

	public static void print(String x) {
		System.out.println(x);
	}
}
