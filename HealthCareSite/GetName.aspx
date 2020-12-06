<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetName.aspx.cs" Inherits="HealthCareSite.GetName" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        /*var xmlhttp;
        if (window.XMLHttpRequest) {
            xmlhttp = new XMLHttpRequest();
        }
        else {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        function getName() {
            xmlhttp.open("POST", "GetName.aspx", true);
            xmlhttp.onreadystatechange = onComplete;
            xmlhttp.send();
        }
        function onComplete() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                document.getElementById("txtHint").innerHTML = xmlhttp.responseText;
            }
        }*/
        function showHint(str) {
    if (str.length == 0) {
        document.getElementById("txtHint").innerHTML = "";
        return;
    } else {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("txtHint").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET", "getHint.asp?q=" + str, true);
        xmlhttp.send();
    }
}

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!--<div>
            <h1>Simple AJAX Example - retrieves usernames from an ASPX page.</h1>
            <div id="txtHint"></div>
            <input type="button" value="Get Funny User Name" onclick="getName();" />
        </div>-->
First name: <input type="text" onkeyup="showHint(this.value)">
<p>Suggestions: <span id="txtHint"></span></p>
    </form>
</body>
</html>
