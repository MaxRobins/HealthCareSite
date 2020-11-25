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
   </style>
    <br />
    <div class="container-fluid">
        <div class="row">
            <%-- left side of screen --%>
            <div class="col-6" id="left">
                <%-- Area fpr the user's profile --%>
                <div class="container" id="ProfileInformation">
                    <div class="row">
                        <h2>Sample Test</h2>
                        <br />
                        <fieldset class="scheduler-border">
                             <legend class="scheduler-border">Instructions</legend>
                    
                         </fieldset>
                    </div>                                 
                </div>
            </div>
            <%-- middle of screen --%>
            <div class="col-6" id="middle"></div>
            <%-- right side of screen --%>
            <div class="col-6" id="right"></div>
        </div>

        <%-- 2nd row --%>
        <div class="row">
            <div class="col-6" id="btmLeft"></div>
            <div class="col-6" id="btmMiddle"></div>
            <div class="col-6" id="btmRight"></div>
        </div>
    </div>
</asp:Content>
