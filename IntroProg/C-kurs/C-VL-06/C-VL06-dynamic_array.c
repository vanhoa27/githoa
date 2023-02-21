#include <stdio.h>
#include <stdlib.h>


void print_array(double array[], int len);

// will duplicate an array of type double
double *dbldup(double d[], int n);

int main()
{
    double array[3] = {17.17, 19.24, 28.37};
    int n = 3;

    double* copied_array = dbldup(array, n);
    print_array(copied_array, n);
    
    return 0;
}


void print_array(double array[], int len)
{
    for(int i = 0; i < len; i++)
    {
        printf("%.2f ", array[i]);
    }
}

double *dbldup(double d[], int n)
{
    double *df;
    df = (double *) malloc(n *sizeof(double));

    for(int i = 0; i < n; i++)
    {
        df[i] = d[i];
    }

    return df;   // Array wird zurückgegeben
}