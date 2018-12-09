<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PharmacyManagement.ascx.cs"
    Inherits="Streamline.SmartClient.UI.UserControls_PharmacyManagement" %>
<%@ Register TagPrefix="UI" TagName="Heading" Src="~/UserControls/Heading.ascx" %>
<%@ Register TagPrefix="UI" TagName="PharmaciesList" Src="~/UserControls/PharmaciesList.ascx" %>
<asp:ScriptManagerProxy runat="server" ID="SMP1">
    <Scripts>
        <asp:ScriptReference Path="~/App_Themes/Includes/JS/UserPreferences.js?rel=3_5_x_4_1" NotifyScriptLoaded="true" />
    </Scripts>
</asp:ScriptManagerProxy>

<script language="javascript" type="text/javascript">

    function pageLoad() {
        PharmacyManagement.FillPharmacies();
    }

    var PharmacyManagement = {
        onRadioClickPharmacy: function (sender, e) {
            document.getElementById('HiddenFieldParentSelectedPharmacyId').value = e.PharmacyId;
            document.getElementById('buttonInsert').value = "Update";
            var LabelErrorMessage = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>LabelErrorMessage');
            var ImageError = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>ImageError');
            LabelErrorMessage.innerText = '';
            ImageError.style.visibility = 'hidden';
            ImageError.style.display = 'none';
            RadioButtonParameters(e, ' ', '<%=TextBoxName.ClientID%>', '<%=TextBoxPhone.ClientID%>', '<%=TextBoxFax.ClientID%>', '<%=TextBoxEmail.ClientID%>', '<%=TextBoxCity.ClientID%>', '<%=TextBoxZip.ClientID%>', '<%=TextBoxSureScriptsIdentifier.ClientID%>', '<%=TextBoxAddress.ClientID%>', '<%=DropDownListState.ClientID%>', '<%=CheckBoxActive.ClientID%>', '<%=CheckBoxPreferred.ClientID%>', '<%=TextBoxSpecialty.ClientID%>');
        },

        onDeleteClick: function (sender, e) {
            try {
                DeleteFromList(e);
                PharmacyManagement.Clear_Controls();
            } catch (err) {
            }
        },
        GetPharmaciesList: function (condition) {
            try {
                document.getElementById('<%=HiddenRadioButtonValue.ClientID%>').value = condition;
                GetAllPharmaciesList('<%=PanelPharmaciesList.ClientID%>', condition);
            } catch (ex) {
            }
        },
        Clear_Controls: function () {
            ClearControls('<%=TextBoxName.ClientID%>', '<%=TextBoxPhone.ClientID%>', '<%=TextBoxFax.ClientID%>', '<%=TextBoxCity.ClientID%>', '<%=TextBoxZip.ClientID%>', '<%=TextBoxSureScriptsIdentifier.ClientID%>', '<%=TextBoxAddress.ClientID%>', '<%=DropDownListState.ClientID%>', '<%=CheckBoxActive.ClientID%>', '<%=CheckBoxPreferred.ClientID%>');
        },
        SetRadioButton: function () {
            PharmacyManagement.showInProgress();
            var e = new Object();
            e.PharmacyId = parent.document.getElementById('HiddenFieldPharmacyId').value;
            e.Active = parent.document.getElementById('HiddenFieldPharmacyActive').value;
            if (parent.document.getElementById('HiddenFieldCheckButtonStatus').value == 'S') {
                document.getElementById('buttonInsert').value = "Update";
                var radioButtonId = "Rb_" + document.getElementById('HiddenFieldParentSelectedPharmacyId').value;
                var chk = $("input[id$=" + radioButtonId + "]")[0];
                if (chk != undefined)
                    chk.checked = false;
            } else {
                document.getElementById('buttonInsert').value = "Update";
            }

            var checkBoxPreferred = '<%=CheckBoxPreferred.ClientID%>';
            document.getElementById(checkBoxPreferred).checked = true;
            var LabelErrorMessage = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>LabelErrorMessage');
            var ImageError = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>ImageError');
            LabelErrorMessage.innerText = '';
            ImageError.style.visibility = 'hidden';
            ImageError.style.display = 'none';
            RadioButtonParameters(e.PharmacyId, e.Active, '<%=TextBoxName.ClientID%>', '<%=TextBoxPhone.ClientID%>', '<%=TextBoxFax.ClientID%>', '<%=TextBoxEmail.ClientID%>', '<%=TextBoxCity.ClientID%>', '<%=TextBoxZip.ClientID%>', '<%=TextBoxSureScriptsIdentifier.ClientID%>', '<%=TextBoxAddress.ClientID%>', '<%=DropDownListState.ClientID%>', '<%=CheckBoxActive.ClientID%>', '<%=CheckBoxPreferred.ClientID%>', '<%=TextBoxSpecialty.ClientID%>');
        },
        FillPharmacies: function () {
            GetPharmacyList('<%=PanelPharmaciesList.ClientID%>', 'PharmacyName Asc');
        },
        imposeMaxLength: function (Object, MaxLen) {
            if (Object.value.length >= MaxLen)
                Object.value = Object.value.substring(0, MaxLen);
        },
        Insert_Click: function () {
            try {
                if (PharmacyManagement.checkRequiredFields()) {
                    PharmacyManagement.showInProgress();
                    FillPharmacyRow('<%=TextBoxName.ClientID%>', '<%=TextBoxPhone.ClientID%>', '<%=TextBoxFax.ClientID%>', '<%=TextBoxEmail.ClientID%>', '<%=TextBoxAddress.ClientID%>', '<%=DropDownListState.ClientID%>', '<%=TextBoxCity.ClientID%>', '<%=TextBoxZip.ClientID%>', '<%=TextBoxSureScriptsIdentifier.ClientID%>', '<%=CheckBoxActive.ClientID%>', '<%=CheckBoxPreferred.ClientID%>', '<%=HiddenRadioButtonValue.ClientID%>', '<%=PanelPharmaciesList.ClientID%>', '<%=RadioButtonAllPharmacies.ClientID%>', '<%=RadioButtonActivePharmacies.ClientID%>', '<%=TextBoxSpecialty.ClientID%>', 'buttonInsert');
                }
            } catch (ex) {
            }
        },

        Clear_Click: function () {
            ClearPharmacyRow('<%=TextBoxName.ClientID%>', '<%=TextBoxPhone.ClientID%>', '<%=TextBoxFax.ClientID%>', '<%=TextBoxEmail.ClientID%>', '<%=TextBoxAddress.ClientID%>', '<%=DropDownListState.ClientID%>', '<%=TextBoxCity.ClientID%>', '<%=TextBoxZip.ClientID%>', '<%=TextBoxSureScriptsIdentifier.ClientID%>', '<%=CheckBoxActive.ClientID%>', '<%=CheckBoxPreferred.ClientID%>', '<%=HiddenRadioButtonValue.ClientID%>', '<%=PanelPharmaciesList.ClientID%>', '<%=RadioButtonAllPharmacies.ClientID%>', '<%=RadioButtonActivePharmacies.ClientID%>', '<%=TextBoxSpecialty.ClientID%>', 'buttonInsert', 'buttonMerge');
        },

        Merge_Click: function () {
            try {
                document.getElementById('HiddenFieldCheckButtonStatus').value = 'M';
                openPharmacySearch();
            } catch (ex) {
            }
        },

        Search_Click: function () {
            try {
                document.getElementById('HiddenFieldCheckButtonStatus').value = 'S';
                openPharmacySearch('buttonSearch');
            } catch (ex) {
            }
        },

        checkRequiredFields: function () {
            try {
                var LabelErrorMessage = document.getElementById('<%=LabelErrorMessage.ClientID%>');
                var ImageError = document.getElementById('<%=ImageError.ClientID%>');
                LabelErrorMessage.innerText = '';
                ImageError.style.visibility = 'hidden';
                ImageError.style.display = 'none';
                if (document.getElementById('<%=TextBoxName.ClientID%>').value == '') {
                    ImageError.style.display = 'block';
                    ImageError.style.visibility = 'visible';
                    LabelErrorMessage.innerText = 'Please Enter Pharmacy Name';
                    return false;
                }

                if ($("input[id$=TextBoxFax]").val() == '') {
                    ImageError.style.display = 'block';
                    ImageError.style.visibility = 'visible';
                    LabelErrorMessage.innerText = 'Please Enter Fax Number';
                    return false;
                }

                var RegExPattern = new RegExp(/^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/);
                if ((document.getElementById('<%=TextBoxEmail.ClientID%>').value.match(RegExPattern)) || (document.getElementById('<%=TextBoxEmail.ClientID%>').value.replace(/^\s+|\s+$/g, "") == "")) {
                    return true;
                } else {
                    ImageError.style.display = 'block';
                    ImageError.style.visibility = 'visible';
                    LabelErrorMessage.innerText = 'Please enter valid email.';
                    $("[id$=TextBoxEmail]").focus();
                    return false;
                }
                LabelErrorMessage.innerText = '';
                ImageError.style.visibility = 'hidden';
                ImageError.style.display = 'none';
                return true;
            } catch (ex) {
            }
        },
        showInProgress: function () {
            var obj = document.getElementById("PharmacyManagement_dvProgress");
            if (obj) obj.style.display = '';
        },
        hideInProgress: function () {
            var obj = document.getElementById("PharmacyManagement_dvProgress");
            if (obj) obj.style.display = 'none';
        }
    }

    function closeDiv() {
        $("#DivSearchPharmacy").css('display', 'none');
    }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<table id="TableMain" border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td style="height: 38px">
            <table id="TableTitle" border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="width: 30%">
                        <asp:Label ID="Label1" runat="server" Visible="true" CssClass="TittleBarBase" Text="Pharmacy Management"></asp:Label>
                    </td>
                    <td align="center" style="width: 30%">
                        <asp:Label ID="LabelSmartCareRx" runat="server" Visible="true" CssClass="SamrtCareTittleBarBase"
                            Text="SmartCareRx"></asp:Label>
                    </td>
                    <td style="width: 30%" align="right">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="right" style="width: 50%">
                                    <asp:LinkButton ID="LinkButtonStartPage" Style="display: none" Text="Start Page"
                                        runat="server" OnClientClick="redirectToStartPage();this.disabled=true;return false;"></asp:LinkButton>
                                </td>
                                <td align="right" style="width: 50%">
                                    <asp:LinkButton ID="LinkButtonLogout" Text="Logout" runat="server" OnClick="LinkButtonLogout_Click"
                                        Style="display: none"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="height: 1pt; border-bottom: #5b0000 1px solid;"></td>
                </tr>
                <tr>
                    <td width="98%" align="right" colspan="3">
                        <asp:Button ID="ButtonClose" runat="server" Text="Close" CssClass="ButtonWeb" OnClientClick="redirectToStartPage();return false"
                            Width="83px" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table id="TableGeneral" border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td valign="bottom" style="width: 16px">
                        <asp:Image ID="ImageError" runat="server" ImageUrl="~/App_Themes/Includes/Images/error.gif"
                            Style="display: none; vertical-align: middle" />
                    </td>
                    <td valign="bottom">
                        <asp:Label ID="LabelErrorMessage" runat="server" CssClass="redTextError" Height="18px"
                            Style="vertical-align: middle"></asp:Label>
                    </td>
                </tr>
            </table>
            <UI:Heading ID="Heading1" runat="server" HeadingText="Details" />
        </td>
    </tr>
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" style="height: 1px; border-right: #dee7ef thin solid; border-top: #dee7ef thin solid; border-left: #dee7ef thin solid; border-bottom: #dee7ef thin solid;"
                align="left" width="98%">
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td></td>
                                <td class="labelFont" style="width: 42px">
                                    <asp:Label ID="LabelName" class="Label" runat="server" Text="Name"></asp:Label>
                                </td>
                                <td style="width: 4px"></td>
                                <td style="width: 212px">
                                    <asp:TextBox ID="TextBoxName" runat="server" CssClass="TextBox" Width="280px" MaxLength="100"></asp:TextBox>
                                </td>
                                <td style="width: 9px"></td>
                                <td style="width: 52px">
                                    <asp:CheckBox ID="CheckBoxActive" runat="server" Text="Active" Style="font-weight: normal; font-size: 8.25pt; color: black; font-family: Microsoft Sans Serif; text-align: center" />
                                </td>
                                <td style="width: 17px"></td>
                                <td class="labelFont">
                                    <asp:Label ID="LabelPhone" class="Label" runat="server" Text="Phone"></asp:Label>
                                </td>
                                <td style="width: 4px"></td>
                                <td style="width: 50px">
                                    <asp:TextBox ID="TextBoxPhone" runat="server" CssClass="TextBox" Width="130px" MaxLength="50"></asp:TextBox>
                                </td>
                                <td style="width: 44px"></td>
                                <td class="labelFont">
                                    <asp:Label ID="LabelFax" class="Label" runat="server" Text="Fax"></asp:Label>
                                </td>
                                <td style="width: 4px"></td>
                                <td>
                                    <asp:TextBox ID="TextBoxFax" runat="server" CssClass="TextBox" Width="80px" MaxLength="50"></asp:TextBox>
                                </td>
                                <td style="width: 10px"></td>
                                <td class="labelFont">
                                    <asp:Label ID="LabelEmail" class="labelFont" runat="server" Text="Email Id"></asp:Label>
                                </td>
                                <td style="width: 4px"></td>
                                <td style="width: 50px">
                                    <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="TextBox" Width="120px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5" style="width: 52px"></td>
                                <td colspan="11" height="1%">
                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                        <tr>
                                            <td style="width: 6%">
                                                <asp:CheckBox ID="CheckBoxPreferred" runat="server" Text="Preferred" Style="font-weight: normal; font-size: 8.25pt; color: black; font-family: Microsoft Sans Serif; text-align: center" />
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td height="10px"></td>
                            </tr>
                        </table>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td rowspan="2"></td>
                                <td class="labelFont" valign="middle" style="width: 42px;" rowspan="2">
                                    <asp:Label ID="LabelAddress" class="Label" runat="server" Text="Address"></asp:Label>
                                </td>
                                <td style="width: 5px" rowspan="2"></td>
                                <td rowspan="2" style="width: 211px">
                                    <asp:TextBox ID="TextBoxAddress" runat="server" EnableTheming="false" Font-Names="Microsoft Sans Serif"
                                        Font-Size="8.50pt" TextMode="MultiLine" Width="280px" Height="31px" onBlur="return PharmacyManagement.imposeMaxLength(this, 100);"></asp:TextBox>
                                </td>
                                <td style="width: 75px" rowspan="2"></td>
                                <td valign="middle" rowspan="2">
                                    <asp:Label ID="LabelCity" runat="server" class="labelFont" Text="City "></asp:Label>
                                </td>
                                <td rowspan="2"></td>
                                <td valign="middle" style="width: 15px">
                                    <asp:TextBox ID="TextBoxCity" runat="server" CssClass="TextBox" Width="120px" MaxLength="30"></asp:TextBox>
                                </td>
                                <td style="width: 30px" rowspan="2"></td>
                                <td valign="middle" rowspan="2">
                                    <asp:Label ID="LabelState" class="labelFont" runat="server" Text="State"></asp:Label>
                                </td>
                                <td style="width: 5px" rowspan="2"></td>
                                <td rowspan="2" style="width: 123px">
                                    <asp:DropDownList ID="DropDownListState" runat="server" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 7px" rowspan="2"></td>
                                <td valign="middle" rowspan="2">
                                    <asp:Label ID="LabelZip" class="labelFont" runat="server" Text="Zip  "></asp:Label>
                                </td>
                                <td style="width: 6px" rowspan="2"></td>
                                <td rowspan="2">
                                    <asp:TextBox ID="TextBoxZip" runat="server" CssClass="TextBox" Width="120px" MaxLength="12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="16"></td>
                            </tr>
                            <tr>
                                <td colspan="5"></td>
                                <td colspan="7">
                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                        <tr>
                                            <td align="left" style="width: 20%">
                                                <asp:Label ID="LabelSureScripts" class="labelFont" runat="server" Text="NCPDP Number"></asp:Label>
                                            </td>
                                            <td align="left" style="width: 2%"></td>
                                            <td align="left" style="width: 66%">
                                                <asp:TextBox ID="TextBoxSureScriptsIdentifier" runat="server" CssClass="TextBox"
                                                    Width="300px"></asp:TextBox>
                                            </td>
                                            <td align="left" style="width: 12%"></td>
                                        </tr>
                                    </table>
                                </td>
                                <td colspan="4">
                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                        <tr>
                                            <td align="left" style="width: 20%">
                                                <asp:Label ID="Label2" class="labelFont" runat="server" Text="Specialty"></asp:Label>
                                            </td>
                                            <td align="left" style="width: 2%"></td>
                                            <td align="left" style="width: 66%">
                                                <asp:TextBox ID="TextBoxSpecialty" runat="server" CssClass="TextBox"
                                                    Width="300px" MaxLength="150"></asp:TextBox>
                                            </td>
                                            <td align="left" style="width: 12%"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" style="width: 98%">
    <tr>
        <td>
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="right" style="height: 30px" valign="bottom">
                        <input type="button" id="buttonMerge" class="ButtonWeb" style="display: none" onclick="PharmacyManagement.Merge_Click()" disabled="disabled"
                            value="Merge" />
                        <input type="button" id="buttonSearch" class="ButtonWeb" onclick="PharmacyManagement.Search_Click()"
                            value="Search" />
                        <input type="button" id="buttonInsert" class="ButtonWeb" onclick="PharmacyManagement.Insert_Click()"
                            value="Insert" />
                        <input type="button" id="buttonClear" class="ButtonWeb" onclick="PharmacyManagement.Clear_Click()" value="Clear" />
                        <input type="hidden" id="HiddenFieldCheckButtonStatus" />
                        <input type="hidden" id="HiddenFieldSelectedPharmacyId" />
                        <%--Added By Priya Ref:task No:85--%>
                        <input type="hidden" id="HiddenFieldParentSelectedPharmacyId" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td style="width: 50%">
            <input id="RadioButtonActivePharmacies" runat="server" style="font-weight: normal; visibility: hidden; font-size: 8.25pt; color: black; font-family: Microsoft Sans Serif; text-align: center"
                checked="true" type="radio" onclick="PharmacyManagement.GetPharmaciesList('Active');" /><a
                    style="visibility: hidden; font-weight: normal; font-size: 8.25pt; color: black; font-family: Microsoft Sans Serif; text-align: center">Active Pharmacies Only</a>
            <input id="RadioButtonAllPharmacies" runat="server" style="visibility: hidden; font-weight: normal; font-size: 8.25pt; color: black; font-family: Microsoft Sans Serif; text-align: center"
                type="radio" onclick="PharmacyManagement.GetPharmaciesList('All');" /><a style="visibility: hidden; font-weight: normal; font-size: 8.25pt; color: black; font-family: Microsoft Sans Serif; text-align: center">All Pharmacies</a>
            <input type="hidden" id="HiddenRadioButtonValue" runat="server" />
            <UI:Heading ID="Heading2" runat="server" HeadingText="Preferred Pharmacies"></UI:Heading>
        </td>
        <td style="width: 45%; text-align: right;">
            <div id="PharmacyManagement_dvProgress" style="display: none; right: inherit;" class="progress">
                <font size="Medium" color="#1c5b94"><b><i>Communicating with Server...</i></b></font>
                <img src="App_Themes/Includes/Images/Progress.gif" title="Progress" />
            </div>
        </td>
        <td style="width: 5%;">&nbsp;</td>
    </tr>
</table>
<table style="border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid; border-left: #dee7ef 3px solid; width: 98%; border-bottom: #dee7ef 3px solid; height: 330px;" cellspacing="0" cellpadding="0">
    <tbody>
        <tr>
            <td>
                <div id="DivPharmacyList" style="overflow-x: none; overflow-y: scroll; height: 330px; width: 100%;">
                    <asp:Panel ID="PanelPharmaciesList" runat="server">
                    </asp:Panel>
                </div>
            </td>
        </tr>
    </tbody>
</table>
<div id="DivSearchPharmacy" style="position: absolute; left: 100px; top: 0px; z-index: 990; display: none; background-color: white; border: black thin solid;">
    <table style="width: 100%;" cellpadding="0" cellspacing="0">
        <tr class="PopUpTitleBar">
            <td id="topborder" class="TitleBarText"></td>
            <td style="width: 20px;" align="right">
                <img id="ImgCross" onclick="closeDiv()" src='<%= Page.ResolveUrl("App_Themes/Includes/Images/cross.jpg") %>' title="Close" alt="Close" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <iframe id="iFramePharmacySearch" name="iFramePharmacySearch" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
            </td>
        </tr>
    </table>
</div>
