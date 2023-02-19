int main() {
    int n = 256;
    int buf[n];
    unsigned int i = 5;
    for (i = n - 1; i >= 0; i--) {
        buf[i] = n - i;
    }
}
