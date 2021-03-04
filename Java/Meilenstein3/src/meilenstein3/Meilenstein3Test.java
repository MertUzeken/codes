// Mert Uzeken
// Matrikel-Nr: 1142543

package meilenstein3;

public class Meilenstein3Test {

	public static void main(String[] args) {
		Elektroauto auto1 = new Elektroauto(new Fahrzeugtyp("Tesla", "Model X"), "schwarz", 382.0, 75);
		Elektroauto auto2 = new Elektroauto(new Fahrzeugtyp("Tesla", "Model 3"), "rot", 354.0, 52.0);
		Elektroauto auto3 = new Elektroauto(new Fahrzeugtyp("Audi", "e-tron"), "silber", 328.0, 83.6);
		Auto auto4 = new Auto(new Fahrzeugtyp("Smart", "Fortwo"), "grau");

		auto4.displayInfo(auto4);
	}

}
