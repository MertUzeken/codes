// Mert Uzeken
// Matrikel-Nr: 1142543

package meilenstein2;

import java.util.Scanner;

public class Meilenstein2 {

	public static void main(String[] args) {
		double[] temparatur = new double[5];

		// Eingabe
		Scanner eingabe = new Scanner(System.in);
		for (int i = 0; i <= 4; i++) {
			System.out.printf("Bitte geben Sie die Höchsttemparatur für Tag %d ein: \n", i + 1);
			temparatur[i] = eingabe.nextDouble();
		}

		// Ausgabe Kenntage
		// U sind die Tage
		kenntageErkennen(temparatur);

		// Höchst Temparatur
		System.out.printf("Die Gesamt-Hoechsttemparatur ist: %1.1f °C", berechneHoechstwert(temparatur));
		// Close Sys.in stream ...
		eingabe.close();

	}

	public static void kenntageErkennen(double[] werte) {
		for (int u = 0; u <= werte.length - 1; u++) {
			if (werte[u] >= 25 && werte[u] < 30) {
				System.out.printf("Tag: %d ist ein: Sommertag \n", u + 1);
			} else if (werte[u] >= 30 && werte[u] < 35) {
				System.out.printf("Tag: %d ist ein: Heißertag \n", u + 1);
			} else if (werte[u] >= 35) {
				System.out.printf("Tag: %d ist ein: Wüstentag \n", u + 1);
			} else {
				System.out.printf("Tag: %d ist ein: Normalertag \n", u + 1);
			}
		}
	}

	public static double berechneHoechstwert(double[] werte) {
		double temp = 0;
		for (int h = 0; h <= werte.length - 1; h++) {
			if (werte[h] > temp) {
				temp = werte[h];
			}
		}
		return temp;
	}
}
