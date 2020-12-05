<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CreateAppointment.aspx.cs" Inherits="HealthCareSite.DoctorSchedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-start flex-row p-2 mr-3 ml-3 mt-3">
            <div class="form-group">
                <asp:Label ID ="lblTime" runat="server" Text="Time" CssClass="p-2 mr-3 ml-3"></asp:Label>
                <asp:TextBox ID ="txtTime" runat ="server"/>
            </div>
            <div class="form-group">
                <asp:Label ID ="lblDay" runat="server" Text="Day" CssClass="p-2 mr-3 ml-3"></asp:Label>
                <asp:TextBox ID ="txtDay" runat ="server"/>
            </div>
        <asp:Button ID ="btnSubmit" runat ="server" Text="Add" OnClick="btnSubmit_Click"/>
        <asp:Label ID="lblDisplay" runat="server" Font-Bold="true"></asp:Label>
        <asp:Button ID ="btnHome" runat="server" Text="Home" OnClick="btnHome_Click"/>
    </div>
</asp:Content>
