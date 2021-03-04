/*
* Author: Mert Uzeken
* Email: mertuzeken@gmail.com
* Github: https://github.com/MertUzeken
*/

package KlausurvorbereitungFOOD;

public class TestKlasse {

	public static void main(String[] args) {
		
		Pizza funghi = new Pizza("Funghi");
		funghi.istBelegtMit("Salami");
		funghi.istBelegtMit("Pilzen");
		
		Burger hamburger = new Burger("hamburger");
		hamburger.istBelegtMit("Hackfleisch");
		
		Gericht hawaii = new Pizza("Hawaii");
		hawaii.istBelegtMit("Schinken");
		hawaii.istBelegtMit("Ananas");
		
		Gericht cheeseburger = new Burger("Cheeseburger");
		cheeseburger.istBelegtMit("Hackfleisch");
		cheeseburger.istBelegtMit("Käse");
		

		
		
		
		Gericht[] speisekarte = new Gericht[] { funghi, hawaii, hamburger, cheeseburger	};
		
		for(Gericht gericht : speisekarte) {
			gericht.zubereitung();
		}

}
