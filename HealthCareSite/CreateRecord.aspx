<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CreateRecord.aspx.cs" Inherits="HealthCareSite.CreateRecord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
    <div class="d-flex justify-content-start flex-row p-2 mr-3 ml-3 mt-3">
        <div class="col-xl-6 p-2 mr-3 ml-3 mt-3">
            <div class="form-group">
                <input type ="file" ID="imgFile" runat="server" />
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
                  <asp:ListItem Selected="1" Value="1">1</asp:ListItem>
                  <asp:ListItem Value="2">2</asp:ListItem>
                  <asp:ListItem Value="3">3</asp:ListItem>
                  <asp:ListItem Value="4">4</asp:ListItem>
                  <asp:ListItem Value="5">5</asp:ListItem>
               </asp:DropDownList>
            </div>
        </div>
    </div>
    <div class="d-flex justify-content-center flex-row p-2 mr-3 ml-3 mt-3">
        <div class="form-group">
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="cbxMigraines" value="option1" />
                <label class="form-check-label" for="cbxMigraines">Migraines</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="frequentUrination" value="option2" />
                <label class="form-check-label" for="frequentUrination">Frequent Urination</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="nausea" value="option3" />
                <label class="form-check-label" for="nausea">Nausea</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="cough" value="option4" />
                <label class="form-check-label" for="cough">Coughing</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="soreThroat" value="option5" />
                <label class="form-check-label" for="soreThroat">Sore Throat</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="fever" value="option6" />
                <label class="form-check-label" for="fever">Fever or Chills</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="breath" value="option7" />
                <label class="form-check-label" for="breath">Shortness of Breath</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="congestion" value="option8" />
                <label class="form-check-label" for="congestion">Congestion or Runny Nose</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="diarrhea" value="option9" />
                <label class="form-check-label" for="diarrhea">Diarrhea</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="other" value="option10" />
                <label class="form-check-label" for="other">Other</label>
            </div>
        </div>
    </div>
    <div class="d-flex flex-row p-2 mr-3 ml-5 mt-3">
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
    <div class="d-flex flex-row p-2 mr-3 ml-5 mt-3">
        <div class="form-check">
            <asp:RadioButtonList ID="rblGender" runat="server">
                 <asp:ListItem Value="Male">Male</asp:ListItem>
                 <asp:ListItem Value="Female">Female</asp:ListItem>
                 <asp:ListItem Value="Other">Other</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <div class="form-group p-2 mr-3 ml-5 mt-3">
        <label for="birthday">Date of Birth:</label>
        <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
    </div>
    <div class="d-flex justify-content-start flex-row p-2 mr-3 ml-3 mt-3">
        <div class="col-xl-6 p-2 mr-3 ml-3 mt-3">
            <div class="form-group">
                <asp:Label ID ="lblAddress" runat="server" Text="Address" CssClass="p-2 mr-3 ml-3"></asp:Label>
                <asp:TextBox ID ="txtAddress" runat ="server"/>
            </div>
            <div class="form-group">
                <asp:Label ID ="lblCity" runat="server" Text="City" CssClass="p-2 mr-3 ml-3"></asp:Label>
                <asp:TextBox ID ="txtCity" runat ="server"/>
            </div>
            <div class="form-group">
                <asp:Label ID ="lblZip" runat="server" Text="Zip Code" CssClass="p-2 mr-3 ml-3"></asp:Label>
                <asp:TextBox ID ="txtZipCode" runat ="server"/>
            </div>
            <div class="form-group">
	            Type in a State: <input type="text" onkeyup="showHint(this.value)">
                <p>Suggestions: <span id="txtHint"></span></p>
            </div>
        <div class="col-xl-6 p-2 mr-3 ml-3 mt-3">
            <div class="form-group">
                <asp:Label ID ="lblEmailAddress" runat="server" Text="Email Address" CssClass="p-2 mr-3 ml-3"></asp:Label>
                <asp:TextBox ID ="txtEmail" runat ="server"/>
               
            </div>
        </div>
    </div>
    <div class="d-flex justify-content-end p-2 mb-5 mr-5">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-lg" OnClick="btnSubmit_Click" />
        <asp:Label ID="lblDisplay" runat="server"></asp:Label>
    </div>
</asp:Content>
