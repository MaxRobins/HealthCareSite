<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="HealthCareSite.Homepage" %>

<%@ Register Src="~/UserControl.ascx" TagPrefix="uc1" TagName="UserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.6/css/responsive.dataTables.min.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/responsive/2.2.6/js/dataTables.responsive.min.js"></script>

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
            height: 54px;
        }
    </style>
    <br />
    <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
    <div class="container-fluid">
        <div class="row">
            <div class="col-3">
                <%-- Top Row --%>

                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">Profile</legend>

                    <uc1:UserControl runat="server" ID="userControl" />

                </fieldset>
              
            </div>

              <div class="col-auto">
                <asp:Panel ID="pnlCard" runat="server">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Instructions</h5>
                                <h4><asp:Label ID="lblInstructions" runat="server" Text="Label"></asp:Label></h4>
                                <p class="card-text">
                                    <asp:Label ID="lblCard" runat="server" Text="Search the table for a doctor. You can Filter the table to find a specialist. Once you have found the doctor, you can hit the click the button to schedule an appointment"></asp:Label>
                                </p>
                            </div>
                        </div>
                    </asp:Panel>
                <br />
                <asp:Panel ID="pnlCreateApp" runat="server">
                  <asp:Button ID="btnCreateApp" runat="server" Text="Add Appointment" OnClick="btnCreateApp_Click" />
                </asp:Panel>
            </div>

            <div class="col-auto">
                <div class="container-fluid">
                    
                    <br />

                    <div class="dtr-control">

                        <%-- Table for doctor page --%>

                        <asp:Panel ID="pnlDoctorTable" runat="server">

                            <fieldset class="scheduler-border">
                                <legend class="scheduler-border">My Appointments</legend>
                                <asp:GridView ID="gvRecords" runat="server" OnRowDataBound="gvRecords_RowDataBound" Width="456px" AutoGenerateColumns="False" OnRowCommand="gvRecords_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                                        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                                        <asp:BoundField DataField="Doctor" HeaderText="Doctor" />
                                        <asp:BoundField DataField="Day" HeaderText="Day" />
                                        <asp:BoundField DataField="Time" HeaderText="Time" />
                                        <asp:ButtonField ButtonType="Button" CommandName="Details" Text="Details" />
                                    </Columns>
                                </asp:GridView>
                            </fieldset>
                        </asp:Panel>
                        <%-- table for patient page --%>
                        <asp:Panel ID="pnlPatientTable" runat="server">
                            <asp:GridView ID="gvAllDoctors" runat="server" AutoGenerateColumns="False" OnRowCommand="gvAllDoctors_RowCommand" OnRowDataBound="gvAllDoctors_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                                    <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                                    <asp:BoundField DataField="DoctorType" HeaderText="Type" />
                                    <asp:BoundField DataField="OfficeLocation" HeaderText="Office" />
                                    <asp:ButtonField ButtonType="Button" CommandName="Schedule" Text="Schedule" />
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </div>

                </div>
            </div>

          

        </div>
        <%-- Bottom Row --%>
        <div class="row">
            <div class="col-2"></div>
            <div class="col-auto">
            </div>
            <div class="col-2"></div>
        </div>
    </div>

    <script>

        function pageLoad() {
            $(document).ready(function () {
                $('#<%= gvAllDoctors.ClientID %>').DataTable();
            });

            $(document).ready(function () {
                $('#<%= gvRecords.ClientID %>').DataTable();
            });
        }



    </script>

</asp:Content>
