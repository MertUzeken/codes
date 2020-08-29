/* 
 * File:   main.cpp
 * Author: Mert
 *
 * Created on 30. November 2014, 19:35
 */

#include <cstdlib>
#include <iostream>
#include <ctime>

using namespace std;

int main(void) {


    const int n = 50000;
    int Arr[n];
    int Temp;



    for (unsigned int i = 0; i < n - 1; i++)// geht die Arrayfelder solange durch wie i kleiner als n (Array größe)ist.
        Arr[i] = rand(); //Füllt sie dann mit zufälligen Werten

    time_t vorher = time(NULL);

    for (int i = 0; i < n - 1; i++) { //Eventuell bei - 1 anfangen um Array Ende nicht zu Überschreiten
        for (int j = 0; j < n - 1; j++) {
            if (Arr[j] > Arr[j + 1]) {

                Temp = Arr[j];
                Arr[j] = Arr[j + 1];
                Arr[j + 1] = Temp;

            }
        }
        cout << "Fortschritt " << int(i * 100.0 / n) << " % \r";
    }

    for (int a = 0; a < n; a++){
        cout << Arr[a] << endl;}

    time_t nachher = time(NULL);

    cout << "Dauer: " << nachher - vorher << "sec" << endl;

    return 0;

}




____________________________________________________________________________________________

/* Das ist die Zweitlösung*/
____________________________

/* 
 * File:   main.cpp
 * Author: Mert
 *
 * Created on 30. November 2014, 19:35
 */

#include <cstdlib>
#include <iostream>
#include <ctime>

using namespace std;

int main(void) {


    const int n = 10;
    int Arr[n];
    int Temp;



    for (unsigned int i = 0; i < n; i++)// geht die Arrayfelder solange durch wie i kleiner als n (Array größe)ist.
        Arr[i] = rand(); //Füllt sie dann mit zufälligen Werten


    time_t vorher = time(NULL);

    for (int i = 1; i < n; i++) {
        for (int j = n - 1; j >= i; j--) {
            if (Arr[j - 1] > Arr[j]) {

                Temp = Arr[j - 1];
                Arr[j - 1] = Arr[j];
                Arr[j] = Temp;
            }
        }
    }


    for (int a = 0; a < n; a++) {
        cout << Arr[a] << endl;
    }
    time_t nachher = time(NULL);

    cout << "Dauer: " << nachher - vorher << "sec" << endl;

    return 0;

}

