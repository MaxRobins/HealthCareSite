<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CreateRecord.aspx.cs" Inherits="HealthCareSite.CreateRecord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-start flex-row p-2 mr-3 ml-3 mt-3">
        <div class="col-xl-6 p-2 mr-3 ml-3 mt-3">
            <div class="form-group">
                <asp:Label ID ="lblFirstName" runat="server" Text="First Name" CssClass="p-2 mr-3 ml-3"></asp:Label>
                <input type="text" class="form-control" placeholder="..." />
            </div>
            <div class="form-group">
                <asp:Label ID ="lblLastName" runat="server" Text="Last Name" CssClass="p-2 mr-3 ml-3"></asp:Label>
                <input type="text" class="form-control" placeholder="..." />
            </div>
            <div class="form-group">
                <asp:Label ID ="lblPhone" runat="server" Text="Phone Number" CssClass="p-2 mr-3 ml-3"></asp:Label>
                <input type="text" class="form-control" placeholder="..." />
            </div>
        </div>
        <div class="col-xl-6 p-2 mr-3 ml-3 mt-3">
            <div class="form-group">
                <asp:Label ID="lblDescription" runat="server" Text="Description" CssClass="p-2 mr-3"></asp:Label>
                <textarea class="form-control" rows="4" id="Description"></textarea>
            </div>
            <div class="form-group">
                <asp:Label ID="lblPainLevel" runat="server" Text="Level of Pain"></asp:Label>
                <select class="form-control" id="painLevel">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
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
                <asp:Label ID ="lblEmailAddress" runat="server" Text="Email Address" CssClass="p-2 mr-3 ml-3"></asp:Label>
                <input type="text" class="form-control" placeholder="..." />
            </div>
        </div>
        <div class="col-xl-6 p-2 mr-3 ml-3 mt-3">
            <div class="form-group">
                <asp:Label ID ="lblAddress" runat="server" Text="Address" CssClass="p-2 mr-3 ml-3"></asp:Label>
                <input type="text" class="form-control" placeholder="..." />
            </div>
        </div>
    </div>
</asp:Content>
