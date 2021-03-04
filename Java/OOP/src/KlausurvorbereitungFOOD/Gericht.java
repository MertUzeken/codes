/*
* Author: Mert Uzeken
* Email: mertuzeken@gmail.com
* Github: https://github.com/MertUzeken
*/

package KlausurvorbereitungFOOD;

import java.util.ArrayList;

public class Gericht{
	Pizza typ;
	public ArrayList<String> Zutatenliste = new ArrayList <>();
	public abstract void istBelegtMit(String Zutat);
	
	public Gericht(Pizza typ) {
		this.typ = typ;
	}

}
