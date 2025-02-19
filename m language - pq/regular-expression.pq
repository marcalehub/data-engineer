////////////////////////////////////////////////////////////////////////////////////////////////////
//Function Regular Expression//
//This function takes a pattern and a string as input and returns the result of the regular expression//
//The function uses the Web.Page function to execute a JavaScript script that performs the regular expression match//
//The result is extracted from the HTML output of the script//
////////////////////////////////////////////////////////////////////////////////////////////////////
(pattern as text, str as text)=>
let html = "
    <script>    
            var regex = """&pattern&""";
            var str = """&str&""";
            var res = str.match(regex);
            document.write(res);
    </script>",
    result = Web.Page(html)[Data]{0}[Children]{0}[Children]{1}[Text]{0}

in result