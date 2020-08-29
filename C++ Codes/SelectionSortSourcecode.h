/* 
 * File:   main.cpp
 * Author: Mert
 *
 * Created on 3. Dezember 2014, 15:01
 */

#include <cstdlib>
#include <iostream>
#include <ctime>

using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {
    int n = 10000;
    int Arr[n];
    int Temp;

    for (unsigned int i = 0; i < n; i++)
        Arr[i] = rand();

        time_t vorher = time(NULL);

    for (unsigned int i = 0; i < n - 1; i++) {
        for (unsigned int j = i + 1; j < n; j++) {
            if (Arr[i] > Arr[j]) {
                Temp = Arr[i];
                Arr[i] = Arr[j];
                Arr[j] = Temp;
            }
        }
    cout << "Fortschritt " << int(i * 100.0 / n) << " % \r";
    }

        for (int a = 0; a < n; a++){
        cout << Arr[a] << endl;}
        
   time_t nachher = time(NULL);

    return 0;
}

