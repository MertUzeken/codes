// Mert Uzeken
// Matrikel-Nr: 1142543

package meilenstein3;

public class Auto {

	int idnr = 0;
	String fahrzeugtyp = " ";
	String farbe = " ";

	public void setIDNr(int idnr) {
		this.idnr = idnr++;
	}

	public void setFahrzeugtyp(String typ) {
		this.fahrzeugtyp = typ;
	}

	public void setFarbe(String farbe) {
		this.farbe = farbe;
	}

	public int getIDNr() {
		return this.idnr;
	}

	public String getFahrzeugtyp() {
		return this.fahrzeugtyp;
	}

	public String getFarbe() {
		return this.farbe;
	}

	public static void displayInfo(Auto auto) {
		System.out.printf("Fahrzeug-ID: %d \n Fahrzeugtyp: %s ,Farbe %s", auto.getIDNr(), auto.getFahrzeugtyp(),
				auto.getFarbe());
	}

	Auto(Fahrzeugtyp fahrzeugtyp, String farbe) {
		this.farbe = farbe;
	}

}
