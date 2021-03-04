package lab4;
import java.util.Scanner;
import java.io.*;

public class Aufgabe2 {

	public static void main(String[] args) {
		try {
			Scanner input = new Scanner(new File("C:\\Users\\KirinSenpai\\eclipse-workspace\\OOP\\bin\\lab4\\Kontostaende.txt"));
			double[] staende = new double[10];
			int c=0;
			
			//Read into an array
			while(input.hasNext()) {
				staende[c++] = input.nextDouble();
			}
			
			//Output
			for(int i=0;i<10;i++) System.out.printf("%d: %1.2f \n", i+1,staende[i]);
		}
		catch(Exception e) {
			System.out.println("could not find file");
		}
	}
}

 