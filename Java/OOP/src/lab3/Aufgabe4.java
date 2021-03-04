package lab3;

import java.util.Scanner;

public class Aufgabe4 {

	public static void main(String[] args) {

		Scanner eingabe = new Scanner(System.in);
		
		int[] aktienkurse = new int[5];
		for(int i=0;i<=4; i++) {
			aktienkurse[i] = eingabe.nextInt();
		}

		System.out.printf("Minwert: %d", minWert(aktienkurse));
		System.out.printf("Maxwert: %d", maxWert(aktienkurse));
		System.out.printf("Mittelwert: %d", mittelWert(aktienkurse));
	}
	
	public static int minWert(int[] Werte) {
		int min= Werte[0];
		for(int i=0; i<=4;i++) if(Werte[i]<min) min=Werte[i];
		return min;
	}
	public static int maxWert(int[] Werte) {
		int max= 0;
		for(int i=0; i<=4;i++) if(Werte[i]>max) max=Werte[i];
		return max;
	}
	public static int mittelWert(int[] Werte) {
		int mittelwert = 0;
		for(int i=0; i<=4;i++) mittelwert += Werte[i];
		return mittelwert/5;
	}
}
