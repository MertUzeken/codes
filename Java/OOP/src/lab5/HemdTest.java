package lab5;

//Aufgabe3
public class HemdTest {

	// Methoden
	public static void main(String[] args) {
		Hemd hemdHawaii = new Hemd(1, "Hawaii", 'b', 20.00, 5);
		Hemd hemdBusiness = new Hemd(2, "Business", 'w', 40.00, 50);

		displayInformation(hemdHawaii);
		displayInformation(hemdBusiness);
	}

	public static void displayInformation(Hemd hemd) {
		System.out.println(hemd.toString());
	}
}