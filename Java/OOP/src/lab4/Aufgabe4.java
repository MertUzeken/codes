package lab4;

import java.util.*;

// ToDo:
// Methode userCheck gibt falsche bool werte, korrigieren !! 					[X]
// LV2 setPassword um groß klein schreibungs check erweitert werden 			[X]
// LV3 setPassword um Sonderzeichen || groß klein || Zeichen erweitert werden 	[X]
// Schleife Zeile 19 funktioniert korrekt ?										[X]

public class Aufgabe4 {

	public static void main(String[] args) {
		String[] userList = { "John", "Peter", "Josh", "Joseph", "Mert", "Kirin" };
		Scanner input = new Scanner(System.in);

		String user = input.next();
		Boolean status = checkUser(user.toString(), userList);

		// Check user available?
		if (status == true) {
			System.out.println("Nutzer wurde gefunden");

			// Set password
			System.out.println("Bitte geben sie ein neues Password mit der mind. länge 8 ein.");
			String password = input.next();

			while (setPassword(password) == false) {
				System.out.println("Bitte geben sie ein neues Password mit der mind. länge 8 ein.");
				password = input.next();
			}
			// Check password strength
			passwordStrength(password.toCharArray());
		} else {
			System.out.println("Nutzer konnte nicht gefunden werden.");
		}
		input.close();
	}

	public static boolean checkUser(String user, String[] userList) {
		for (int i = 0; i <= userList.length - 1; i++) {
			if (user.equals(userList[i]))
				return true;
		}
		return false;
	}

	public static boolean setPassword(String passInput) {
		if (passInput.length() < 8) {
			System.out.println("Passwort ist zu kurz.");
			return false;
		}
		return true;
	}

	public static void passwordStrength(char[] password) {
		// Level 2 security (ein Großbuchstabe und eine Zahl)
		boolean zahl = false;
		boolean grossbuchstabe = false;
		// Level 3 security (Level 2 + Erster Buchstabe groß und ein Sonderzeichen)
		boolean ersterGrossbuchstabe = false;
		boolean sonderzeichen = false;

		// Condition check ASCII
		for (int i = 0; i < password.length; i++) {
			if (password[i] >= 48 && password[i] <= 57)
				zahl = true;
			if (password[i] >= 65 && password[i] <= 90)
				grossbuchstabe = true;
			if (password[0] >= 65 && password[0] <= 90)
				ersterGrossbuchstabe = true;
			if ((password[i] >= 33 && password[i] <= 47) || password[i] >= 58 && password[i] <= 64)
				sonderzeichen = true;
		}

		// Level 2 security check
		if (grossbuchstabe && zahl == true) {
			// Level 3 security check
			if ((grossbuchstabe && zahl == true) && (ersterGrossbuchstabe && sonderzeichen == true)) {
				System.out.println("Security Level: ★★★");
			} else {
				System.out.println("Security Level: ★★");
			}
		} else {
			// Level 1 security check
			if (password.length >= 8)
				System.out.println("Security Level: ★");
		}
	}
}
