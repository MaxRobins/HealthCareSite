<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HealthCareSite.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script type="text/javascript">
        function showHint(str) {
            if (str.length == 0) {
                document.getElementById("txtHint").innerHTML = "";
                return;
            }
            else {
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
    <style>
        body{
            background-color:aquamarine;
            text-align:center;
            margin-top: 10%;
            padding-left:10%;
            padding-right:10%;
        }
        .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
}
    </style>
</head>
<body>
    Funny User Names: <input type="text" onkeyup="showHint(this.value)">
    <p>Suggestions: <span id="txtHint"></span></p>

    <form id="form1" runat="server">
        <div class="f-flex justify-content-center">
            <div class="card p-2 ml-2 mr-2">
                <div class="card-body">
                    <h5>
                        Register Form
                    </h5>
                    <div class="form-group">
                    <div class ="row justify-content-center">
                        <label for="lblUsername">User Name:</label>
                        <asp:TextBox ID="txtName" CssClass="ml-1 mr-1" runat="server"></asp:TextBox>
                        <label for="lblFirstName">First Name:</label>
                        <asp:TextBox ID="txtFirstName" CssClass="ml-1 mr-1" runat="server"></asp:TextBox>
                        <label for="lblLastName">Last Name:</label>
                        <asp:TextBox ID="txtLastName" CssClass="ml-1 mr-1" runat="server"></asp:TextBox>
                        <label for="lblEmail">Email:</label>
                        <asp:TextBox ID="txtEmail" CssClass="ml-1 mr-1" runat="server"></asp:TextBox>
                    </div>
                        <asp:RadioButtonList ID ="userType" runat ="server" CssClass="text-left">
                            <asp:ListItem>Doctor</asp:ListItem>
                            <asp:ListItem>Patient</asp:ListItem>
                        </asp:RadioButtonList>
                    <div class="row">
                        
                    </div>
                    <div class="row justify-content-center p-2 ml-2 mr-2">
                        <label for="lblPassword">Password:</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="ml-1 mr-1"></asp:TextBox>

                        <label for="lblDoctorType">Doctor Type:</label>
                        <asp:TextBox ID="txtDoctorType" runat="server" CssClass="ml-1 mr-1"></asp:TextBox>

                        <label for="lblOffice">Office:</label>
                        <asp:TextBox ID="txtOffice" runat="server" CssClass="ml-1 mr-1"></asp:TextBox>

                        <label for="lblPhoneNumber">Phone Number:</label>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="ml-1 mr-1"></asp:TextBox>
                    
                    </div>
                    <div class="row justify-content-center p-2 ml-2 mr-2">
                        <asp:Button ID="btnRegister" runat="server" CssClass="ml-1 mr-1" Text="Register" OnClick="btnRegister_Click" />
                        <asp:Button ID="btnLogin" runat="server" CssClass="ml-1 mr-1" Text="Back to Login" OnClick="btnLogin_Click" />
                        <asp:Label ID="lblDisplay" runat="server"></asp:Label>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
