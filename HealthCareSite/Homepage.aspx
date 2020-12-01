<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="HealthCareSite.Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.6/css/responsive.dataTables.min.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/responsive/2.2.6/js/dataTables.responsive.min.js"></script>


    <script>
        $(document).ready(function () {
            $('#<%= gvRecords.ClientID %>').DataTable();
        });
    </script>
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
    <div class="container-fluid">
        <div class="row">
            <div class="col-3">
                <%-- Area fpr the user's profile --%>

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
                        <img class="card-img-top" src="Images/defaultImage" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                    <br />
                    <div class="dtr-control">
                    <asp:GridView ID="gvRecords" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvRecords_RowDataBound" Width="456px">
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="Title" />
                            <asp:BoundField DataField="Authors" HeaderText="Authors" />
                            <asp:BoundField DataField="BasePrice" HeaderText="Price" />
                        </Columns>
                    </asp:GridView>
                </div>

                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-2"></div>
            <div class="col-auto">

            </div>
            <div class="col-2"></div>
        </div>
    </div>




</asp:Content>
