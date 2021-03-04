/*
* Author: Mert Uzeken
* Email: mertuzeken@gmail.com
* Github: https://github.com/MertUzeken
*/

package Klasurvorbereitung;

public class hemd {

	private int hemdId;
	private String beschreibung;
	private char farbCode;
	private double preis;
	private int mengeAufLager;

	public hemd(int hemdId, String beschreibung, char farbCode, double preis, int mengeAufLager) {
		super();
		this.hemdId = hemdId;
		this.beschreibung = beschreibung;
		this.farbCode = farbCode;
		this.preis = preis;
		this.mengeAufLager = mengeAufLager;
	}

	public void displayInformation() {
		String farbe = "";

		if (farbCode == 'r') {
			farbe = "rot";
		} else if (farbCode == 'b') {
			farbe = "blau";
		} else {
			farbe = "gelb";
		}
		System.out.printf("ID: %d , Beschreibung: %s , Farbe: %s , Preis: %1.2f , Lagerbestand: %d \n", hemdId,
				beschreibung, farbe, preis, mengeAufLager);
	}

	public int getHemdId() {
		return hemdId;
	}

	public String getBeschreibung() {
		return beschreibung;
	}

	public char getFarbCode() {
		return farbCode;
	}

	public double getPreis() {
		return preis;
	}

	public int getMengeAufLager() {
		return mengeAufLager;
	}

	public void setHemdId(int hemdId) {
		this.hemdId = hemdId;
	}

	public void setBeschreibung(String beschreibung) {
		this.beschreibung = beschreibung;
	}

	public void setFarbCode(char farbCode) {
		this.farbCode = farbCode;
	}

	public void setPreis(double preis) {
		this.preis = preis;
	}

	public void setMengeAufLager(int mengeAufLager) {
		this.mengeAufLager = mengeAufLager;
	}

}
