<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ScheduleAppointment.aspx.cs" Inherits="HealthCareSite.ScheduleAppointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DropDownList ID ="ddlDoctor" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlDoctor_SelectedIndexChanged">
        <asp:ListItem Selected="True" Value="White"> White </asp:ListItem>
                  <asp:ListItem Value="Sperling">Sperling</asp:ListItem>
                  <asp:ListItem Value="Kliger">Kliger</asp:ListItem>
                  <asp:ListItem Value="Robinson">Robinson</asp:ListItem>
    </asp:DropDownList>
    <asp:GridView ID="gvAppointments" runat="server" AutoGenerateColumns="False" CssClass="ml-auto mr-auto" 
       OnRowEditing="gvAppointments_RowEditing" OnRowCancelingEdit = "gvAppointments_RowCancelingEdit" 
        OnRowUpdating ="gvAppointments_RowUpdating" DataKeyNames ="Id">
        <Columns>
            <asp:BoundField HeaderText="Day" DataField="Day" ReadOnly ="True" />
            <asp:BoundField DataField="Time" HeaderText="Time" ReadOnly ="True"  />
            <asp:BoundField HeaderText="FirstName" DataField="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" />
            <asp:BoundField DataField="Doctor" HeaderText="Doctor" ReadOnly ="True"  />

            <asp:CommandField HeaderText="Schedule" ShowEditButton="True" />
            
            
            
        </Columns>
    </asp:GridView>
</asp:Content>
