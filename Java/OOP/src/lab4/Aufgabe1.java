package lab4;
import java.util.Scanner;

public class Aufgabe1 {

	public static void main(String[] args) {
		Scanner eingabe = new Scanner(System.in);
		String text = eingabe.next();
		String textOhneKlammer;
		
		int posKlammerAuf=text.indexOf("(");
		int posKlammerZu=text.lastIndexOf(")");
		
		//System.out.printf("%d", posKlammerAuf);
		//System.out.printf("%d", posKlammerZu);
		
		if(posKlammerAuf == -1 | posKlammerZu == -1) {
			System.out.println("");
		}
		else {
			textOhneKlammer = text.replaceFirst("\\(", "");
			textOhneKlammer = textOhneKlammer.substring(posKlammerAuf, posKlammerZu-1); //+ " " + textOhneKlammer.substring(posKlammerZu);
			System.out.printf("%s", textOhneKlammer);
			//cleanUP
		eingabe.close();
		}
	}
}
