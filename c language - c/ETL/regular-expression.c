////////////////////////////////////////////////////////////////////////////////////////////////////
//Regular Expression//

//Regular expressions are a powerful tool for matching patterns in text. This page gives a basic introduction to regular expressions themselves sufficient for our Python exercises and shows how regular expressions work in Python. The Python "re" module provides regular expression support.

///////////////////////////////////////////////////////////////////////////////////////////////////
#include <regex.h>
regex_t regex;
const char *test_string = "HelloWorld";
ret = regexec(&regex, test_string, 0, NULL, 0);
printf("Match\n");