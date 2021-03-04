package lab4;

import java.util.*;
import java.io.*;

public class Aufgabe3 {

	public static void main(String[] args) {
		double[] kontoStaende = readFileStream();
		displayHistogramm(kontoStaende);
	}

	public static double[] readFileStream() {
		double[] staende = new double[10];
		try {
			Scanner input = new Scanner(new File("C:\\Users\\KirinSenpai\\eclipse-workspace\\OOP\\bin\\lab4\\Kontostaende.txt"));
			int c = 0;

			// Read into an array
			while (input.hasNext()) {
				staende[c++] = input.nextDouble();
			}
		} 
		catch (Exception e) {
			System.out.println("could not find file");
		}
		return staende;
	}

	public static void displayHistogramm(double[] staende) {
		// First for loop = bankaccount nr.x
		for (int i = 0; i <= staende.length - 1; i++) {
			int temp = (int) staende[i];
			
			temp /= 10;
			System.out.printf("%d:", i + 1);
			
			// Display x amounts of * for each account
			for (int k = 0; k < temp; k++) {
				System.out.printf("*");
			}
			System.out.printf("\n");
		}
	}
}