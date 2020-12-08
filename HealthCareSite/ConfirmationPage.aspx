<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ConfirmationPage.aspx.cs" Inherits="HealthCareSite.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body{
            background-color:aliceblue;
        }
        h1{
            text-align:center;
        }
        td{
            
            padding:30px;
            border-spacing:30px;
            border-collapse:separate;
        }
        tr{
            text-align:center;
        }
    </style>
    <h1>Thank You For Scheduling an Appointment</h1>

   <div class="d-flex justify-content-center flex-row p-2 mr-3 ml-3 mt-3">
        <table>
            <tr style="color:red;">
                <th>First Name</th>
                <th>Last Name</th>
                <th>Time</th>
                <th>Day</th>
                <th>Doctor</th>
            </tr>
            <asp:Repeater ID="rptConfirmation" runat="server">
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lblFirstName" runat="server"
                                Text='<%# DataBinder.Eval(Container.DataItem, "FirstName") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblLastName" runat="server"
                                Text='<%# DataBinder.Eval(Container.DataItem, "LastName") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblTime" runat="server"
                                Text='<%# DataBinder.Eval(Container.DataItem, "Time") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDay" runat="server"
                                Text='<%# DataBinder.Eval(Container.DataItem, "Day") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDoctor" runat="server"
                                Text='<%# DataBinder.Eval(Container.DataItem, "Doctor") %>'></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</asp:Content>
