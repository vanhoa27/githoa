#include <string.h>
#include <stdio.h>

int main(int argc, char const *argv[])
{
	char* str1 = "Hallo";
	char* str2 = "Welt";
	char str3[12];

	strcpy(str3, str1);
	printf("str3 = %s, strlen(%zu)\n", str1, strlen(str3));
	strcat(str3, str2);
	printf("str2 = %s, strlen(%zu)\n", str3, strlen(str3));

	return 0;
}