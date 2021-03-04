// Mert Uzeken
// Matrikel-Nr: 1142543

package meilenstein3;

public class Elektroauto {
	private double akkukapazität;
	private double reichweite;
	private String farbe;

	public void SetAkkukapazität(double akkukapazität) {
		this.akkukapazität = akkukapazität;
	}

	public void SetReichweite(double reichweite) {
		this.reichweite = reichweite;
	}

	public double getAkkukapazität() {
		return this.akkukapazität;
	}

	public double getReichweite() {
		return this.reichweite;
	}

	Elektroauto(Fahrzeugtyp fahrzeugtyp, String farbe, double akkukapazität, double reichweite) {
		this.akkukapazität = akkukapazität;
		this.reichweite = reichweite;
		this.farbe = farbe;
	}

}
