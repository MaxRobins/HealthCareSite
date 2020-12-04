<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="HealthCareSite.Homepage" %>

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
                <%-- Bottom Row --%>

                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">Profile</legend>
                    <div class="container-fluid">
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
                    </div>

                </fieldset>
            </div>
            <div class="col-auto">
                <div class="container-fluid">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Schedule Appointments</h5>
                            <p class="card-text">
                                <asp:Label ID="lblCard" runat="server" Text="Click Below to schedule appointments"></asp:Label>
                            </p>
                            <asp:Button ID="btnAppointment" CssClass="btn-outline-danger" runat="server" Text="Schedule Appiontment" OnClick="btnAppointment_Click" />
                        </div>
                    </div>
                    <br />

                    <div class="dtr-control">
                       
                        <%-- Table for doctor page --%>
                        <asp:Panel ID="pnlDoctorTable" runat="server">
                            <asp:GridView ID="gvRecords" runat="server" OnRowDataBound="gvRecords_RowDataBound" Width="456px" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                                    <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                                    <asp:BoundField DataField="Doctor" HeaderText="Doctor" />
                                    <asp:ButtonField ButtonType="Button" CommandName="Details" Text="Details" />
                                </Columns>
                            </asp:GridView>
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

        function pageLoad()
        {
             $(document).ready(function () {
                $('#<%= gvAllDoctors.ClientID %>').DataTable();
             });

            $(document).ready(function () {
                $('#<%= gvRecords.ClientID %>').DataTable();
            });
        }

        

    </script>

</asp:Content>
