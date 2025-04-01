#include <iostream>
#include <algorithm>
#include <limits>
#include <string>
#include <stdexcept>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    unsigned long long int a = 0, b = 0;
    unsigned long long int ra = 0, rb = 0;

    cout << "\n" << "=====----------=====";
    cout << "\n" << "   GCD CALCULATOR";
    cout << "\n" << "Natural numbers only!";
    cout << "\n" << "=====----------=====";

    while (true) {
        string auxiliary = "";

        while (true) {
            cout << "\n" << "First number: ";
            getline(cin, auxiliary);
            try {
                a = stoi(auxiliary); 
                break;
            } catch (invalid_argument &e) {
                cout << "\n" << "Please type a number!";
                continue;
            }
        }
        ra = a;

        
        while (true) {
            cout << "\n" << "Second number: ";
            getline(cin, auxiliary);
            try {
                b = stoi(auxiliary); 
                break;
            } catch (invalid_argument &e) {
                cout << "\n" << "Please type a number!";
                continue;
            }
        }
        rb = b;

        if (a < b) {
            swap(a, b);
        }

        if (a*b == 0) {
            cout << "\n" << "No zeroes!";
            continue;
        }

        unsigned long long int r = 0;
        r = a % b;
        a = b;
        while (r != 0) {
            b = r;
            r = a % b;
            a = b;
        }

        cout << "\n" << "gcd(" << ra << ", " << rb << ") = " << b;

        cout << "\n" << "Another? (Y/n) ";
        getline(cin, auxiliary);

        if (auxiliary == "Y" || auxiliary == "y") {
            continue;
        } else {
            break;
        }
    }

    return 0;
}