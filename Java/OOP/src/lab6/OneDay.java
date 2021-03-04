package lab6;

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
	
	OneDay(int tag, String monat, int jahr){
		this.tag = tag;
		this.monat = monat;
		this.jahr = jahr;
	}
}
