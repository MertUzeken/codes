package lab5;

public class OneDay {
	private int tag, jahr;
	private String monat;
	
	public int getTag() {
		return tag;
	}
	
	public void setTag(int tag) {
		this.tag = tag;
	}
	
	public int getJahr() {
		return jahr;
	}
	
	public void setJahr(int jahr) {
		this.jahr = jahr;
	}
	
	public String getMonat() {
		return monat;
	}
	
	public void setMonat(String monat) {
		this.monat = monat;
	}
	
	public static void displayDate(OneDay tag) {
		String s = "OneDay: ";
		
		s+= " "+tag.getTag()+" . "+tag.getMonat()+" "+tag.getJahr();
		System.out.println(s);
	}
	
	OneDay(int d, String m, int y){
		String[] dictionary= {"Jan","Feb", "Mär", "Apr", "Mai", "Jun", "Jul", "Aug", "Sep", "Okt", "Nov","Dez"};

			for(int s = 0; s<=11; s++) {
				if(dictionary[s].equals(m)){
					this.tag = d;
					this.monat = m;
					this.jahr = y;
					break;
				} else if(s==11) {
					System.out.println("Monat fehlerhaftes format");
				}
		}
	}

	
}
