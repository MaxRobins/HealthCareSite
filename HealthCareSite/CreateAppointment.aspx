<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CreateAppointment.aspx.cs" Inherits="HealthCareSite.DoctorSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        h1{
            text-align:center;
        }
        p{
            text-align:center;
        }
        body{
            background-color:azure;
        }
        .card{
            background-color:ivory;
        }
    </style>
    <h1>Create an Appointment</h1>
    <p>Schedule your available times throughout the week</p>
    <div class ="d-flex justify-content-center">
        <div class="card p-2 ml-2 mr-2" style="width: 18rem;">
            <div class="card-body">
                <div class="d-flex justify-content-center flex-row p-2 mr-3 ml-3 mt-3">
                    <div class="form-group">
                        <asp:Label ID ="lblTime" runat="server" Text="Time" CssClass="p-2 mr-3 ml-3"></asp:Label>
                        <asp:TextBox ID ="txtTime" runat ="server"/>
                    </div>
                </div>
                <div class="d-flex justify-content-center flex-row p-2 mr-3 ml-3 mt-3">
                    <div class="form-group">
                        <asp:Label ID ="lblDay" runat="server" Text="Day" CssClass="p-2 mr-3 ml-3"></asp:Label>
                        <asp:TextBox ID ="txtDay" runat ="server"/>
                    </div>
                </div>
                <div class="d-flex justify-content-center flex-row p-2 mr-3 ml-3 mt-3">
                    <div class="form-group">
                        <asp:Button ID ="btnSubmit" runat ="server" Text="Add" OnClick="btnSubmit_Click"/>
                        <asp:Label ID="lblDisplay" runat="server" Font-Bold="true"></asp:Label>
                        <asp:Button ID ="btnHome" runat="server" Text="Home" CssClass="ml-2" OnClick="btnHome_Click"/>
                    </div>
                </div>
           </div>
        </div>
    </div>
</asp:Content>
