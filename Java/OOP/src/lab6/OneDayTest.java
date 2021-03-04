package lab6;

public class OneDayTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		OneDay feiertag = new OneDay(1, "Jan", 2021);
		displayInformation(feiertag);
	}
	
	public static void displayInformation(OneDay tag) {
		String s = "OneDay: ";
		
		s+= " "+tag.getTag()+" . "+tag.getMonat()+" "+tag.getJahr();
		System.out.println(s);
	}
}
