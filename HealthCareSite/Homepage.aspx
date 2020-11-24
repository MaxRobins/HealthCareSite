<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="HealthCareSite.Homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <%-- left side of screen --%>
            <div class="col-6" id="left">
                <%-- Area fpr the user's profile --%>
                <div class="container" id="ProfileInformation">
                    <div class="row">
                        <asp:panel runat="server" ID="pnlPicture"></asp:panel>
                    </div>
                    <div class="row"></div>
                    <div class="row"></div>                   
                </div>
            </div>
            <%-- middle of screen --%>
            <div class="col-6" id="middle"></div>
            <%-- right side of screen --%>
            <div class="col-6" id="right"></div>
        </div>
    </div>
</asp:Content>
