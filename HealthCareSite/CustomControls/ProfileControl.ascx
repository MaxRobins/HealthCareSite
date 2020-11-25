<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProfileControl.ascx.cs" Inherits="HealthCareSite.CustomControls.ProfileControl" %>
<asp:Panel ID="pnlPicture" runat="server">
    <asp:Image ID="imgProfile" runat="server" Height="164px" Width="175px" />
</asp:Panel>
<br />
<asp:Panel ID="pnlName" runat="server">
    <asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label>
    &nbsp;&nbsp;
    <asp:Label ID="lblLastName" runat="server" Text=""></asp:Label>
</asp:Panel>
<br />
<asp:Panel ID="pnlContact" runat="server">
    <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
    &nbsp;&nbsp;
    <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
</asp:Panel>
<br />
<asp:Panel ID="pnlDoctorInfo" runat="server">
    <asp:Label ID="lblLocation" runat="server" Text=""></asp:Label>
    &nbsp;&nbsp;
    <asp:Label ID="lblType" runat="server" Text=""></asp:Label>
</asp:Panel>
