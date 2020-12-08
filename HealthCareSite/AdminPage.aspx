<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="HealthCareSite.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.6/css/responsive.dataTables.min.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/responsive/2.2.6/js/dataTables.responsive.min.js"></script>


    <div class="container-fluid">
        <div class="row">
            <div class="col"></div>
            <div class="col">

                <asp:GridView ID="gvAllUsers" runat="server"></asp:GridView>

            </div>
            <div class="col">

                <asp:GridView ID="gvAllAppointments" runat="server"></asp:GridView>

            </div>
        </div>
    </div>

     <script>

        function pageLoad() {
            $(document).ready(function () {
                $('#<%= gvAllUsers.ClientID %>').DataTable();
            });

        }



    </script>

</asp:Content>
