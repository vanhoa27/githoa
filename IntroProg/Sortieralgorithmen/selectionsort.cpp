#include <iostream>
#include <ctime>
#include <cstdlib>
using namespace std;

void printArray(int *array, int length);
void selectionsort(int *array, int length);

int main() {
    int len = 10;
    int numbers[len];
    srand(time(0));

    // fill array with random numbers
    for (int i = 0; i < len; i++) {
        numbers[i] = (rand()%19)+1; 
    }

    cout << "Unsorted array: ";
    printArray(numbers, len);

    cout << "Sorted array: ";
    selectionsort(numbers, len);
    printArray(numbers, len);
}

void printArray(int *array, int length) {
    for (int i = 0; i < length; i++)
        cout << array[i] << " ";
    cout << endl;
}

void selectionsort(int *array, int length) {
    for (int i = 0; i < length - 1; i++) {
        int min = i;
        for (int j = i + 1; j < length; j++) {
            if (array[j] < array[min]) {
                min = j; 
            }
        }
        int temp = array[i];
        array[i] = array[min];
        array[min] = temp;
    }
}
