/*
* Author: Mert Uzeken
* Email: mertuzeken@gmail.com
* Github: https://github.com/MertUzeken
*/

package KlausurvorbereitungMilestone;

public class MS3test {

	public static void main(String[] args) {
		
		Auto Auto1 = new Elektroauto(new Fahrzeugtyp("Tesla", "Model X"), "schwarz", 382.0, 75);
		Auto Auto2 = new Elektroauto(new Fahrzeugtyp("Tesla", "Model 3"), "rot", 354.0, 52.0);
		Auto auto3 = new Elektroauto(new Fahrzeugtyp("Audi", "e-tron"), "silber", 328.0, 83.6);
		Auto auto4 = new Auto(new Fahrzeugtyp("Smart", "Fortwo"), "grau");
		
		auto4.test = 2;
		//auto3.displayInformation();
		//auto4.displayInformation();
		//Auto1.displayInformation();
		//Auto2.displayInformation();
	
		
		
		//String name ="Mert";
		//String nachname= "Uzeken";	
		//System.out.print(Character.toUpperCase(name.charAt(0)));
		
		int a = 5;
		
		System.out.println("this" + Auto.test);
	}
	

}
