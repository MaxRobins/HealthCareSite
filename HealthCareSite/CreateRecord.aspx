<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CreateRecord.aspx.cs" Inherits="HealthCareSite.CreateRecord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                <asp:DropDownList id="ColorList"
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
            <input class="form-check-input" type="radio" name="genders" id="male" value="option1">
            <label class="form-check-label" for="male">
                Male   
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="genders" id="female" value="option2">
            <label class="form-check-label" for="female">
                Female   
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="genders" id="otherGender" value="option3">
            <label class="form-check-label" for="otherGender">
                Other   
            </label>
        </div>
    </div>
    <div class="form-group p-2 mr-3 ml-5 mt-3">
        <label for="birthday">Date of Birth:</label>
        <input type="date" id="dateOfBirth" name="dateOfBirth">
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
	            <label for="state" class="col-sm-2 control-label">State</label>
	            <div class="col-sm-10">
		            <select class="form-control" id="state" name="state">
			            <option value="">N/A</option>
			            <option value="AK">Alaska</option>
			            <option value="AL">Alabama</option>
			            <option value="AR">Arkansas</option>
			            <option value="AZ">Arizona</option>
			            <option value="CA">California</option>
			            <option value="CO">Colorado</option>
			            <option value="CT">Connecticut</option>
			            <option value="DC">District of Columbia</option>
			            <option value="DE">Delaware</option>
			            <option value="FL">Florida</option>
			            <option value="GA">Georgia</option>
			            <option value="HI">Hawaii</option>
			            <option value="IA">Iowa</option>
			            <option value="ID">Idaho</option>
			            <option value="IL">Illinois</option>
			            <option value="IN">Indiana</option>
			            <option value="KS">Kansas</option>
			            <option value="KY">Kentucky</option>
			            <option value="LA">Louisiana</option>
			            <option value="MA">Massachusetts</option>
			            <option value="MD">Maryland</option>
			            <option value="ME">Maine</option>
			            <option value="MI">Michigan</option>
			            <option value="MN">Minnesota</option>
			            <option value="MO">Missouri</option>
			            <option value="MS">Mississippi</option>
			            <option value="MT">Montana</option>
			            <option value="NC">North Carolina</option>
			            <option value="ND">North Dakota</option>
			            <option value="NE">Nebraska</option>
			            <option value="NH">New Hampshire</option>
			            <option value="NJ">New Jersey</option>
			            <option value="NM">New Mexico</option>
			            <option value="NV">Nevada</option>
			            <option value="NY">New York</option>
			            <option value="OH">Ohio</option>
			            <option value="OK">Oklahoma</option>
			            <option value="OR">Oregon</option>
			            <option value="PA">Pennsylvania</option>
			            <option value="PR">Puerto Rico</option>
			            <option value="RI">Rhode Island</option>
			            <option value="SC">South Carolina</option>
			            <option value="SD">South Dakota</option>
			            <option value="TN">Tennessee</option>
			            <option value="TX">Texas</option>
			            <option value="UT">Utah</option>
			            <option value="VA">Virginia</option>
			            <option value="VT">Vermont</option>
			            <option value="WA">Washington</option>
			            <option value="WI">Wisconsin</option>
			            <option value="WV">West Virginia</option>
			            <option value="WY">Wyoming</option>
		            </select>
	            </div>
            </div>
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
    </div>
     <asp:Label ID="lblDisplay" runat="server" Font-Bold="true"></asp:Label>
</asp:Content>
