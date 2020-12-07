<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="HealthCareSite.LoginControl" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<div class="container">
    <div class="row">
        
            <asp:Label ID="Label1" runat="server" Text="UserName :"></asp:Label>
        
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>

        
    </div>
    <br />
    <div class="row">
        
            <asp:Label ID="Label2" runat="server" Text="Password : "></asp:Label>
        
        
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
    </div>
    <br />
    <div class="row" visible="True">
        <div class="col">
            <asp:Label ID="lblError" runat="server" Text="" Visible="False"></asp:Label>
        </div>
    </div>
    <br />
    <div class="row">       
            <div class="col-auto">
                <asp:Button ID="btnLogin" CssClass="btn-outline-danger" runat="server" Text="Login" OnClick="btnLogin_Click" />
            </div>
            <div class="col-auto">
                <asp:Button ID="btnRegister" CssClass="btn-outline-danger" runat="server" Text="Register" OnClick="btnRegister_Click" />
            </div>        
    </div>


</div>
