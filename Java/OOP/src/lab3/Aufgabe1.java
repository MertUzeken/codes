package lab3;
import java.util.Scanner;

public class Aufgabe1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		double[] kontoKunden = new double[15];
		Scanner eingabe = new Scanner(System.in);
		
				
		System.out.println("Bitte geben sie nacheinander alle Kontostaende ein \n");
		
		for (int i=0; i<=6; i++) {
		System.out.println("Nutzer nr: " + (i));
		kontoKunden[i] = eingabe.nextDouble();
		}
		
		System.out.printf("Nutzer nr: 5 Kontostand: %1.2f", kontoKunden[5]);
		System.out.printf("Nutzer nr: 6 Kontostand: %1.2f €", kontoKunden[6]);
		
	}

}
