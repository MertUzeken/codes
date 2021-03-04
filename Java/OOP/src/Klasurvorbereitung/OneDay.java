/*
* Author: Mert Uzeken
* Email: mertuzeken@gmail.com
* Github: https://github.com/MertUzeken
*/

package Klasurvorbereitung;

public class OneDay {
	
	private int tag, jahr;
	private String monat;
	
	public OneDay(int tag, int jahr, String monat) {
		super();
		this.tag = tag;
		this.jahr = jahr;
		setMonat(monat);
	}
	
	public void displayInformation() {
		System.out.printf("%d.%s.%d", getTag(),getMonat(),getJahr());
	}

	public int getTag() {
		return tag;
	}

	public int getJahr() {
		return jahr;
	}

	public String getMonat() {
		return monat;
	}

	public void setTag(int tag) {
		this.tag = tag;
	}

	public void setJahr(int jahr) {
		this.jahr = jahr;
	}

	public void setMonat(String monat) {
		
		String monatsNamen[] = {"Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember"};
		
		switch(monat) {
			case "Jan": this.monat = monatsNamen[0]; break;
			case "Feb": this.monat = monatsNamen[1]; break;
			case "Mär": this.monat = monatsNamen[2]; break;
			case "Apr": this.monat = monatsNamen[3]; break;
			case "Mai": this.monat = monatsNamen[4]; break;
			case "Jun": this.monat = monatsNamen[5]; break;
			case "Jul": this.monat = monatsNamen[6]; break;
			case "Aug": this.monat = monatsNamen[7]; break;
			case "Sep": this.monat = monatsNamen[8]; break;
			case "Okt": this.monat = monatsNamen[9]; break;
			case "Nov": this.monat = monatsNamen[10]; break;
			case "Dez": this.monat = monatsNamen[11]; break;
		}
		
	} 

	
	
	

}
