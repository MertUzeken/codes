package lab4;

import java.io.File;
import java.util.Scanner;
import java.io.FileNotFoundException;
// TODO:
//

public class Aufgabe6 {

	public static void main(String[] args) throws FileNotFoundException {

		Scanner input = new Scanner(new File("C:\\Users\\KirinSenpai\\Desktop\\Auftragsliste.csv"));
		String[] eintragZeile = new String[4];

		String zeile = input.nextLine();

		while (input.hasNext()) {
			zeile = input.nextLine();
			eintragZeile = zeile.split(";");

			for (int i = 0; i < eintragZeile.length; i++) {
				eintragZeile[i] = eintragZeile[i].replace(',', '.');
			}

			double auftragsvolumen = Double.parseDouble(eintragZeile[0]);
			double rabatt = Double.parseDouble(eintragZeile[1]);
			double nettovolumen = auftragsvolumen * (100 - rabatt) / 100;

			System.out.println("Auftagsvolumen: " + auftragsvolumen + " Euro; Rabatt: " + rabatt
					+ " Prozent  => Nettovolumen: " + nettovolumen + " Euro");
		}
	}

}
