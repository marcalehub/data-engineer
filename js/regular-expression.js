// regular expressions
// Regular expressions are patterns used to match character combinations in strings. In JavaScript, regular expressions are also objects. These patterns are used with the exec and test methods of RegExp, and with the match, replace, search, and split methods of String. This chapter describes JavaScript regular expressions.
var regex = "[a-zA-Z]";
var str = "Hello World";
var res = str.match(regex);
console.log(res)