<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ViewAppointment.aspx.cs" Inherits="HealthCareSite.ViewAppointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <style>
        body{
            text-align:center;
            padding-left:10px;
            border-collapse: separate;
            border-spacing: 15px 50px;
            background-color:antiquewhite;
        }
        table {
            border-collapse: separate;
            border-spacing: 15px 50px;
            border: 1px solid #ccc;
            border-collapse: collapse;
        }
        table th {
                background-color: #F7F7F7;
                color: #333;
                font-weight: bold;
            }

            table th, table td {
                padding: 20px;
                border-color: #ccc;
            }
    </style>
    <div class="container-fluid">
        <div class="row">
            <div class="col"></div>
            <div class="col">
                <div class="h1">Appointment Details</div>
                <br />
                <div id="divDisplay" runat="server"></div>

            </div>
            <div class="col"></div>
        </div>
    </div>
</asp:Content>
