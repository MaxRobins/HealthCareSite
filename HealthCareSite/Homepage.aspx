<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="HealthCareSite.Homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <style>
       fieldset.scheduler-border {
    border: 2px groove #dedede !important;
    padding: 0 1.4em 1.4em 1.4em !important;
    margin: 0 0 1.5em 0 !important;
    -webkit-box-shadow: 0px 0px 0px 0px #000;
    box-shadow: 0px 0px 0px 0px #000;
    border-radius: 5px;
}

        legend.scheduler-border {
    font-size: 1.2em !important;
    font-weight: bold !important;
    text-align: left !important;
    width: auto;
    padding: 0 10px;
    border-bottom: none;
}

       .img {
           height:54px;

       }
   </style>
    <br />
    <div class="container-fluid">
        <div class="row">
            <%-- left side of screen --%>
            <div class="col-auto" id="left">
                <%-- Area fpr the user's profile --%>
                              
                <fieldset class="scheduler-border">
                        <legend class="scheduler-border">Profile</legend>
                        <div class="row">   
                            <asp:Image CssClass="img-fluid rounded" ID="imgProfile" runat="server" />
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
                    </asp:Panel>
                        
                    </fieldset>                                               
                
            </div>
            <%-- Right of screen --%>
            <div class="col-auto" id="middle">
                <asp:Panel ID="pnlTable" runat="server">

                    <div class="table-responsive-lg">
                        <asp:GridView  CssClass="respo" ID="gvAppointments" runat="server"></asp:GridView>
                    </div>

                </asp:Panel>                
            </div>
           

        <%-- 2nd row --%>
        <div class="row">
            <div class="col-6" id="btmLeft"></div>
            <div class="col-6" id="btmMiddle"></div>
            <div class="col-6" id="btmRight"></div>
        </div>
    </div>
</asp:Content>
