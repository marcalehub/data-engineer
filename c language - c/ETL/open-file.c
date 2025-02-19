// C program to open a file
// If the file is opened successfully
// then the file pointer is returned
// otherwise NULL pointer is returned

#include <stdio.h>
int main(void)
{
    FILE *file = fopen("file-name", "r");
    if (file != NULL)
    {
        fclose(file);
    }
}