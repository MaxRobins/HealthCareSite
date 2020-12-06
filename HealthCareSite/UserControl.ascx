<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserControl.ascx.cs" Inherits="HealthCareSite.UserControl" %>
<div class="container-fluid">
    <div class="row">
        <asp:Image CssClass="img-fluid rounded" ID="imgProfile" runat="server" />
        <br />
    </div>
    <div class="row">
        <div class="col">
            <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>

        </div>
        <div class="col">
            <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
        </div>

    </div>
    <div class="row">
        <div class="col">
            <asp:Label ID="lblEmail" runat="server" Text="Name@Email.com"></asp:Label>
        </div>

        <div class="col">
            <asp:Label ID="lblPhone" runat="server" Text="555-555-5555"></asp:Label>
        </div>

    </div>

    <asp:Panel ID="pnlDoctorInfo" runat="server">
        <div class="row">
            <div class="col">
                <asp:Label ID="lblLocation" runat="server" Text="123 Place Road"></asp:Label>
            </div>

            <div class="col">
                <asp:Label ID="lblType" runat="server" Text="Cardiologist"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col">
            </div>
        </div>
    </asp:Panel>
</div>
