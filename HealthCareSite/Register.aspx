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
        }
    </style>
</head>
<body>
    Funny User Names: <input type="text" onkeyup="showHint(this.value)">
    <p>Suggestions: <span id="txtHint"></span></p>

    <form id="form1" runat="server">
        <div class="f-flex justify-content-center">
            <div class="card">
                <div class="card-body">
                    <h5>
                        Register Form
                    </h5>
                    <div class="form-group">
                            
                        <label for="lblUsername">User Name:</label>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <label for="lblFirstName">First Name:</label>
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>

                        <label for="lblLastName">Last Name:</label>
                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>

                        <asp:RadioButtonList ID ="userType" runat ="server" CssClass="text-left">
                            <asp:ListItem>Doctor</asp:ListItem>
                            <asp:ListItem>Patient</asp:ListItem>
                        </asp:RadioButtonList>

                        <label for="lblEmail">Email:</label>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

                        <label for="lblPassword">Password:</label>
                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>

                        <label for="lblDoctorType">Doctor Type:</label>
                        <asp:TextBox ID="txtDoctorType" runat="server"></asp:TextBox>

                        <label for="lblOffice">Office:</label>
                        <asp:TextBox ID="txtOffice" runat="server"></asp:TextBox>

                        <label for="lblPhoneNumber">Phone Number:</label>
                        <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>

                        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
                        <asp:Button ID="btnLogin" runat="server" Text="Back to Login" OnClick="btnLogin_Click" />
                        <asp:Label ID="lblDisplay" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
