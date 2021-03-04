/*
* Author: Mert Uzeken
* Email: mertuzeken@gmail.com
* Github: https://github.com/MertUzeken
*/

package KlausurvorbereitungMilestone;

public class Auto {
	
	static int identifikationsNummer;
	int ID = 0;
	Fahrzeugtyp fahrzeugtyp;
	String Farbe;
	int test;
	
	public Auto(Fahrzeugtyp fahrzeugtyp, String farbe) {
		ID = identifikationsNummer++;
		this.Farbe = farbe;
		this.fahrzeugtyp = fahrzeugtyp;
	}
	
	public void displayInformation() {
		System.out.printf("Auto: ID: %d %s , %s, %s \n", ID, fahrzeugtyp.hersteller,fahrzeugtyp.modell, Farbe);
	}
}

