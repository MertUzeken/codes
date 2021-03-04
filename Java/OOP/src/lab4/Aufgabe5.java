package lab4;

import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;

// TODO:
// Text ausgeben [X]
// Anzahl Wörter [X]
// Anzahl Zahlen [X]
// Histogramm	 [X]

public class Aufgabe5 {

	public static void main(String[] args) throws FileNotFoundException {
		Scanner input = new Scanner(new File("C:\\Users\\KirinSenpai\\Desktop\\Textpassage.txt"));
		int anzahlEintraege = 0;

		while (input.hasNext()) {
			input.next();
			anzahlEintraege++;
		}
		input.reset();

		input = new Scanner(new File("C:\\Users\\KirinSenpai\\Desktop\\Textpassage.txt"));
		String[] inhalt = new String[anzahlEintraege];
		int counter = 0;

		while (input.hasNext()) {
			inhalt[counter] = input.next();
			counter++;
		}

		// Anzahl Worte
		int anzahlWorte = 0;
		for (int i = 0; i < inhalt.length; i++) {
			if (Character.isAlphabetic((inhalt[i].charAt(0))))
				anzahlWorte++;
		}

		// Anzahl Zahlen
		int anzahlZahlen = 0;
		for (int i = 0; i < inhalt.length; i++) {
			if (Character.isDigit((inhalt[i].charAt(0))))
				anzahlZahlen++;
		}

		System.out.printf("Anzahl Worte: %d \n", anzahlWorte);
		histogramm(anzahlWorte);
		System.out.printf("Anzahl Zahlen: %d \n", anzahlZahlen);
		histogramm(anzahlZahlen);

	}

	public static void histogramm(int Anzahl) {
		for (int i = 0; i < Anzahl; i++) {
			System.out.printf("*");
		}
		System.out.println("\n");
	}
}
