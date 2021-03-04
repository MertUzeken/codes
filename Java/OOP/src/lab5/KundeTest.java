package lab5;

public class KundeTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Kunde kunde1 = new Kunde(20, "Mert", "mertuzeken@gmail.com");
		Kunde kunde2 = new Kunde(20, "Peter", "PeterMustermann@gmail.com");
		kunde1.displayKunde();
		kunde2.displayKunde();
		
		System.out.println(kunde1==kunde2);			//Vergleicht Klassen instanzen ?
		System.out.println(kunde1.isEqual(kunde2)); //Vergleicht Mailadresse der ersten Instanz Klasse mit der zweiten ...
		}

}
