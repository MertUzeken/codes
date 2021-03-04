package lab3;
import java.util.Scanner;

public class Aufgabe3 {

	public static void main(String[] args) {
		int[] aktienkurse = new int[5];
		Scanner eingabe = new Scanner(System.in);
		
		for(int i=0;i<=4; i++) {
			aktienkurse[i] = eingabe.nextInt();
		}

		int min = aktienkurse[0];
		int max = 0;
		int mittelwert = 0;
		for(int i=0; i<=4;i++) {
			if(aktienkurse[i]<min) min=aktienkurse[i];
			if(aktienkurse[i]>max) max=aktienkurse[i];
			mittelwert += aktienkurse[i];
		}
		mittelwert /= 5;

		System.out.printf("Mininmalwert:%d",min);
		System.out.printf("Maximalwert:%d",max);
		System.out.printf("Mittewert:  %d",mittelwert);
	}
}
