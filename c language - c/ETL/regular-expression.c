////////////////////////////////////////////////////////////////////////////////////////////////////
//Regular Expression//
///////////////////////////////////////////////////////////////////////////////////////////////////
#include <regex.h>
regex_t regex;
const char *test_string = "HelloWorld";
ret = regexec(&regex, test_string, 0, NULL, 0);
printf("Match\n");