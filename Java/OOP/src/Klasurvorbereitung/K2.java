/*
* Author: Mert Uzeken
* Email: mertuzeken@gmail.com
* Github: https://github.com/MertUzeken
*/
package Klasurvorbereitung;

import java.util.Scanner;
import java.io.*;

/* 1.) Schreiben Sie ein Programm, das Kontostände aus der Datei "Kontostaende.txt" in ein Array einliest 
 * 	   und alle Kontostände über 100 € ausgibt.
 *     Als Vorbereitung, legen Sie dazu die Datei "Kontostaende.txt" auf Ihrem Rechner ab.
 * 
 * 2.) Schreiben Sie ein Programm, das die aus der Datei "Kontostaende.txt" in ein Array eingelesenen Kontostände als Histogramm darstellt.
 * 	   (ein '*' entspricht 10 Euro).
 *     Was ist ein Histogramm?
 *     Pro Kontostand werden in einer Zeile '*' ausgegeben. Die Anzahl der '*' ist durch die Höhe des Kontostands definiert.
 *     Versuchen Sie als Lösungsvariante, eine Methode einzuführen, die die Histogrammausgabe realisiert.
*/

public class K2 {

	public static void main(String[] args) throws FileNotFoundException {
		int anzahlZeilen = countLines();
		double kontostaende[] = new double[anzahlZeilen + 1];
		kontostaende = readLines(anzahlZeilen);

		for (int i = 0; i <= anzahlZeilen - 1; i++) {
			System.out.printf("%d: %1.2f €", i, kontostaende[i]);
			System.out.println("\n");
		}

		histogramm(kontostaende);
	}

	public static int countLines() throws FileNotFoundException {
		File datei = new File("C:\\Users\\KirinSenpai\\Desktop\\this.txt");
		Scanner eingabe = new Scanner(datei);

		int i = 0;
		while (eingabe.hasNext()) {
			i++;
			eingabe.next();
		}
		eingabe.close();
		eingabe = null;
		return i;
	}

	public static double[] readLines(int lineCount) throws FileNotFoundException {
		File datei = new File("C:\\Users\\KirinSenpai\\Desktop\\this.txt");
		Scanner eingabe = new Scanner(datei);
		double konto[] = new double[lineCount];
		int n = 0;
		while (eingabe.hasNext()) {
			konto[n] = eingabe.nextDouble();
			n++;
		}
		eingabe.close();
		eingabe = null;
		return konto;
	}

	public static void histogramm(double konto[]) {
		for (int i = 0; i <= konto.length - 1; i++) {
			System.out.printf("KontoNr.: %d \n", i);
			for (int k = 0; k < (int) konto[i]; k++) {
				System.out.printf("*");
			}
			System.out.println("");
		}
	}
}
