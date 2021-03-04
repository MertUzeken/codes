/*
* Author: Mert Uzeken
* Email:  mertuzeken@gmail.com
* Github: https://github.com/MertUzeken
*/

package Klasurvorbereitung;

import java.util.Scanner;

/* 1.) Implementieren Sie zunächst ein Programm, das untersucht, ob ein eingegebener Text einem vorgegebenen Benutzernamen entspricht.
 * 
 * 2.) Erweitern Sie das bestehende Programm so, dass der Benutzer zur Eingabe eines neuen Passwortes aufgefordert wird.
 * 	   Dieses Passwort wird nur akzeptiert, wenn es mind. 8 Zeichen lang ist. Diese Anforderung legt eine Minimalanforderungen an die Sicherheit des Passwortes fest,
 *     die dem Benutzer durch die Ausgabe des Sicherheitslevels mit nur einem * angezeigt wird (Sicherheitslevel: *). ,
 *     Ansonsten wird eine Meldung ausgegeben, dass das Passwort ungültig ist.
 * 
 * 3.) Erweitern Sie Ihr Programm um folgende Eigenschaften: Der Benutzer soll die Option haben,
 *     den Sicherheitslevel auf Level 2 oder 3 zu erhöhen (Anzeige -> Sicherheitslevel ** oder ***).
 *     Sicherheitslevel 2 ist erreicht, wenn im Passwort ein Zeichen ein Großbuchstabe und ein Zeichen eine Zahl ist.
 *     Sicherheitslevel 3 ist erreicht, wenn im Passwort zusätzlich das erste Zeichen ein Großbuchstabe und ein Zeichen ein Sonderzeichen ist.
 *     Erst dann soll das Passwort vom Programm mit einer entsprechenden Ausgabe akzeptiert werden.
*/

public class K3 {

	public static void main(String[] args) {
		Scanner eingabe = new Scanner(System.in);
		String user = eingabe.next();

		checkAuthUsername(user);
		System.out.println("Increase password security level");

		// Increase to security lv 2
		setPassword(2);

		// Increase to "" 3
		setPassword(3);

	}

	public static int setPassword(int level) {
		Scanner eingabe = new Scanner(System.in);
		char[] password;
		password = eingabe.next().toCharArray();
		switch (level) {

		case 1:
			// Initial + LV 1
			if (password.length >= 8) {
				System.out.println("Security Lv: * ");
			} else {
				System.out.println("Password too short ");
			}
			break;

		case 2:
			// ZU MÜDE IS NUR BULLSHIT, SCHREIBS UM
			for (int i = 0; i <= password.length - 1; i++) {
				if (password[i] >= 65 && password[i] <= 90) {
				else if (password[i] >= 48 && password[i] <= 57) {
					System.out.println("Security Lv: * *");
				}
				} else {
					System.out.println("Password to weak to reach Lv: 2");
				}
			}
			break;

		case 3:
			
			for (int i = 0; i <= password.length - 1; i++) {
				if (password[0] >= 65 && password[i] <= 90) {
					if (password[i] >= 33 && password[i] <= 47) {
						if (password[i] >= 58 && password[i] <= 64) {
							System.out.println("Security Lv: * * *");
						}
					}
				} else {
					System.out.println("Password to weak to reach Lv: 3");
				}
			}
			break;
		}
		eingabe.nextLine();
		return level; // Return new security level
	}

	public static void checkAuthUsername(String name) {
		// Some info received ...
		if (name.equals("mert")) {
			System.out.println("User found...");
			setPassword(1); // initial Password
		} else {
			System.out.println("Error");
		}
	}

}
