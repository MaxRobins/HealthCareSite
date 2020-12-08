<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CreateRecord.aspx.cs" Inherits="HealthCareSite.CreateRecord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body{
            background-color:antiquewhite;
        }
        h2{
            text-align:center;
        }
        p{
            text-align:center;
        }
    </style>
    <script type="text/javascript">
        function showHint(str) {
            if (str.length == 0) {
                document.getElementById("txtHint").innerHTML = "";
                return;
            }
            else {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("txtHint").innerHTML = this.responseText;
                    }
                };
            xmlhttp.open("GET", "getstate.asp?q=" + str, true);
            xmlhttp.send();
            }
        }
    </script>
    <h2>Record Form</h2> 
    <p>Below is an Form for you to fill out your information and symptoms you have been experiencing to help the doctor understand problems
        you are having.
    </p>
    <div class="d-flex justify-content-start flex-row p-2 mr-3 ml-3 mt-3">
        <div class="col-xl-6 p-2 mr-3 ml-3 mt-3">
            <div class="form-group">
                
                <asp:Label ID ="lblFirstName" runat="server" Text="First Name" CssClass="p-2 mr-3 ml-3"></asp:Label>
                <asp:TextBox ID ="txtFirstName" runat ="server"/>
            </div>
            <div class="form-group">
                <asp:Label ID ="lblLastName" runat="server" Text="Last Name" CssClass="p-2 mr-3 ml-3"></asp:Label>
                <asp:TextBox ID ="txtLastName" runat ="server"/>
            </div>
            <div class="form-group">
                <asp:Label ID ="lblPhone" runat="server" Text="Phone Number" CssClass="p-2 mr-3 ml-3"></asp:Label>
                <asp:TextBox ID ="txtPhoneNumber" runat ="server"/>
            </div>
        </div>
        <div class="col-xl-6 p-2 mr-3 ml-3 mt-3">
            <div class="form-group">
                <asp:Label ID="lblDescription" runat="server" Text="Description" CssClass="p-2 mr-3"></asp:Label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblPainLevel" runat="server" Text="Level of Pain"></asp:Label>
                <asp:DropDownList id="ddlPain"
                    runat="server">
                  <asp:ListItem Value="0">0</asp:ListItem>
                  <asp:ListItem Value="1">1</asp:ListItem>
                  <asp:ListItem Value="2">2</asp:ListItem>
                  <asp:ListItem Value="3">3</asp:ListItem>
                  <asp:ListItem Value="4">4</asp:ListItem>
                  <asp:ListItem Value="5">5</asp:ListItem>
               </asp:DropDownList>
            </div>
        </div>
    </div>
    <div class="d-flex flex-row p-2 mr-3 ml-5 mt-3">
        <div class="col-xl-6 p-2 mr-3 ml-3 mt-3">
        <div class="form-check">
            <asp:CheckBoxList id="cblSymptoms" runat="server">
                 <asp:ListItem Value="Migraines">Migraines</asp:ListItem>
                 <asp:ListItem Value="Urination">Frequent Urination</asp:ListItem>
                 <asp:ListItem Value="Nausea">Nausea</asp:ListItem>
                 <asp:ListItem Value="Coughing">Coughing</asp:ListItem>
                 <asp:ListItem Value="SoreThroat">Sore Throat</asp:ListItem>
                 <asp:ListItem Value="Fever">Fever</asp:ListItem>
                 <asp:ListItem Value="ShortOfBreath">Shortness of Breath</asp:ListItem>
                 <asp:ListItem Value="Congestion">Congestion</asp:ListItem>
                 <asp:ListItem Value="Diarrhea">Diarrhea</asp:ListItem>
                 <asp:ListItem Value="Other">Other</asp:ListItem>
            </asp:CheckBoxList>
        </div>
    </div>
        <div class="col-xl-6 p-2 mr-3 ml-3 mt-3">
        <div class="form-check">
            <asp:RadioButtonList ID="rblGender" runat="server">
                 <asp:ListItem Value="Male">Male</asp:ListItem>
                 <asp:ListItem Value="Female">Female</asp:ListItem>
                 <asp:ListItem Value="Other">Other</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div class="form-group p-2 mr-3 ml-5 mt-3">
        <label for="birthday">Date of Birth:</label>
        <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
    </div>
    </div>
    </div>
    
    <div class="d-flex justify-content-start flex-row p-2 mr-3 ml-3 mt-3">
        <div class="col-xl-6 p-2 mr-3 ml-3 mt-3">
            <div class="form-group">
                <asp:Label ID ="lblAddress" runat="server" Text="Address" CssClass="p-2 mr-3 ml-3"></asp:Label>
                <asp:TextBox ID ="txtAddress" runat ="server"/>
            </div>
            <div class="form-group">
                <asp:Label ID ="lblCity" runat="server" Text="City" CssClass="p-2 mr-3 ml-3"></asp:Label>
                <asp:TextBox ID ="txtCity" runat ="server" CssClass="ml-4"/>
            </div>
            <div class="form-group">
                <asp:Label ID ="lblZip" runat="server" Text="Zip Code" CssClass="p-2 mr-3 ml-3"></asp:Label>
                <asp:TextBox ID ="txtZipCode" runat ="server"/>
            </div>
            <div class="form-group">
	            Type in a State: <input type="text" onkeyup="showHint(this.value)">
                Suggestions: <span id="txtHint"></span>
            </div>
        </div>
        <div class="col-xl-6 p-2 mr-3 ml-3 mt-3">
            <div class="form-group">
                <asp:Label ID ="lblEmailAddress" runat="server" Text="Email Address" CssClass="p-2 mr-3 ml-3"></asp:Label>
                <asp:TextBox ID ="txtEmail" runat ="server"/>
                
            </div>
            <input type ="file" ID="imgFile" runat="server" />
        </div>
            
    </div>
    <div class="d-flex justify-content-end p-2 mb-5 mr-5">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-lg" OnClick="btnSubmit_Click" />
        <asp:Label ID="lblDisplay" runat="server"></asp:Label>
    </div>
</asp:Content>
