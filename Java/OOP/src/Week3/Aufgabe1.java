package Week3;
import java.util.Scanner;

public class Aufgabe1 {
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		int input = scanner.nextInt();
		
		int[] arr = new int[11];
		for(int i=1; i<=10; i++) {
			arr[i]=i*i;
		}

		System.out.println(arr[input]);
	}

}
