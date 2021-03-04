package lab3;
import java.util.Scanner;

public class Aufgabe5 {

	public static void main(String[] args) {
		int[] anspruchTage= {15,20,25,30};
		
		Scanner kbrd = new Scanner(System.in);
		int eingabe = kbrd.nextInt();
		if (eingabe <=1) {
			System.out.printf("Tage: %d " ,anspruchTage[0]);
		}
		else if(eingabe > 1 & eingabe <=3) {
			System.out.printf("Tage: %d " ,anspruchTage[1]);
		}
		else if(eingabe > 3 & eingabe <=5) {
			System.out.printf("Tage: %d " ,anspruchTage[2]);
		}
		else if(eingabe >= 6) {
			System.out.printf("Tage: %d " ,anspruchTage[3]);
		}
	}

}
