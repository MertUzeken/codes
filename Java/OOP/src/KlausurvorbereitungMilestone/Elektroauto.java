/*
* Author: Mert Uzeken
* Email: mertuzeken@gmail.com
* Github: https://github.com/MertUzeken
*/

package KlausurvorbereitungMilestone;

class Elektroauto extends Auto{
	double AkkuKapazität;
	double Reichweite;

	
	public Elektroauto(Fahrzeugtyp fahrzeugtyp, String farbe, double Akkukapazität, double Reichweite) {
		super(fahrzeugtyp, farbe);
		this.AkkuKapazität = Akkukapazität;
		this.Reichweite = Reichweite;
	}
	
	public void displayInformation() {
		System.out.printf("Elektroauto: ID: %d %s, %s, %s, %1.2f, %1.2f \n", ID, fahrzeugtyp.hersteller,fahrzeugtyp.modell, Farbe, AkkuKapazität, Reichweite);
	}
}