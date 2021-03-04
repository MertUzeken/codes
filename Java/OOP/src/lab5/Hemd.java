package lab5;

public class Hemd {
	int hemdId;
	String beschreibung;
	char farbCode;
	double preis;
	int mengeAufLager;

	Hemd(int hemdId, String beschreibung, char farbCode, double preis, int mengeAufLager) {
		this.hemdId = hemdId;
		this.beschreibung = beschreibung;
		this.farbCode = farbCode;
		this.preis = preis;
		this.mengeAufLager = mengeAufLager;
	}

	public String toString() {
		String s = "Hemd: (ID: ";
		s += hemdId;
		s += ", Beschreibung: ";
		s += beschreibung;
		s += ", Farb-Code: ";
		switch (farbCode) {
		case 'r':
			s += "rot";
			break;
		case 'g':
			s += "gelb";
			break;
		case 'b':
			s += "blau";
			break;
		case 'w':
			s += "weiﬂ";
			break;
		case 's':
			s += "schwarz";
			break;
		}
		s += ", Preis: ";
		s += preis;
		s += ", Menge auf Lager: ";
		s += mengeAufLager;
		s += ")";
		return s;
	}
}
