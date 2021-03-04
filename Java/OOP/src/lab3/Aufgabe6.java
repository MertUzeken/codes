package lab3;
import java.util.Scanner;

public class Aufgabe6 {

	public static void main(String[] args) {
		
		char test= 0;
		
		// Die ersten 128 Zeichen
		for(int i= 0; i<128;i++) {
			test= (char) i;
			System.out.printf("val: %c \n", test);
		}
		
		// Großbuchstaben
		for(int i= 65; i<=90;i++) {
			test= (char) i;
			System.out.printf("val: %c \n", test);
		}
	}

}
