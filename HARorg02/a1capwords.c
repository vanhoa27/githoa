#include <stdio.h>

int cap_words(char* string);

char str_info1[] = "test_string: \"";
char str_info2[] = "\"\nRueckgabewert cap_words(test_string): ";
char test_string[] = "Nur aNfangsbuchstaben ZAEhlen als gROss geschrieben";

int main() {
	printf("%s", str_info1);
	
	printf("%s", test_string);
	
	printf("%s", str_info2);
	
	int x = cap_words(test_string);
	
	printf("%d ", x);
	
	return 0;
}

int cap_words(char* string) {
	int cap_count = 0;
	int i = 0;

	while (string[i] != '\0') {
		if (i == 0 && string[i] > 'A' && string[i] < 'Z') {
			cap_count++;
		}
		else if (string[i] >= 'A' && string[i] <= 'Z' && string[i-1] == ' ') {
			cap_count++;
		}
		i++;
	}
	return cap_count;
}
