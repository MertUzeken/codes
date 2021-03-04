package lab5;

public class Kunde {

	int id;
	String name, mailAdr;
	
	Kunde(int id, String name, String mailAdr){
		this.id = id;
		this.name = name;
		this.mailAdr = mailAdr;
	}
	
	public void displayKunde() {
		System.out.printf("ID: %d Name: %s E-Mail: %s \n", id,name,mailAdr);
	}
	
	public boolean isEqual(Kunde kunde) {
		return (this.mailAdr.equals(kunde.mailAdr));
	}
}
