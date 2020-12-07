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
        <div class="d-flex justify-content-center">
            <div class="card" style="width:25rem">
                <div class="card-body">
                    <h5 class="card-title">
                        Login
                    </h5>
                    <div class="form-group">

                        <uc1:LoginControl runat="server" id="LoginControl" />

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
