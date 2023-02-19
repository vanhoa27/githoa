#include <stdio.h>
#include <string.h>

/* Echo Line */
void echo()
{
    char buf[4];  /* Way too small! */
    gets(buf);
    puts(buf);
}

int main()
{
    printf("Type a string: ");
    echo();
    return 0;
}
