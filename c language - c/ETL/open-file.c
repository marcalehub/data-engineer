#include <stdio.h>
int main(void)
{
    FILE *file = fopen("file-name", "r");
    if (file != NULL)
    {
        fclose(file);
    }
}