<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HealthCareSite.Login" %>

<%@ Register Src="~/LoginControl.ascx" TagPrefix="uc1" TagName="LoginControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body{
            background-color:aquamarine;
            text-align:center;
            margin-top: 10%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="jumbotron text-xl-center"><div class="h2">HealthCare Site</div> </div>
        <div class="container">
            <div class="row">
                <div class="col-4"></div>
                 <div class="col-4">
                     <div class="h3">Login</div> <br />
                    <uc1:LoginControl runat="server" id="LoginControl" />
                 </div>
                 <div class="col-4"></div>
            </div>
        </div>



    </form>
</body>
</html>
