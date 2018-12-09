<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PatientConsentHistory.ascx.cs"
    Inherits="Streamline.SmartClient.UI.UserControls_PatientConsentHistory" %>
<%@ Register Src="ConsentHistoryList.ascx" TagName="ConsentHistoryList" TagPrefix="uc1" %>
<%@ Register TagPrefix="UI" TagName="Heading" Src="~/UserControls/Heading.ascx" %>
<asp:ScriptManagerProxy runat="server" ID="SMP1">
    <Scripts>
        <asp:ScriptReference Path="~/App_Themes/Includes/JS/PatientConsentHistory.js?rel=3_5_x_4_1" NotifyScriptLoaded="true" />
        <asp:ScriptReference Path="~/App_Themes/Includes/JS/AjaxScript.js?rel=3_5_x_4_1" NotifyScriptLoaded="true" />
    </Scripts>
</asp:ScriptManagerProxy>
<table style="width: 100%">
    <tr>
        <td style="width: 30%">
            <asp:Label ID="Label2" runat="server" Visible="true" CssClass="TittleBarBase" Text="View Consent History"></asp:Label>
        </td>
        <td align="center" style="width: 30%">
            <asp:Label ID="LabelSmartCareRx" runat="server" Visible="true" CssClass="SamrtCareTittleBarBase"
                Text="SmartCareRx"></asp:Label>
        </td>
        <td style="width: 30%" align="right">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="right" style="width: 50%">
                        <asp:LinkButton ID="LinkButtonStartPage" Text="Start Page" runat="server" Style="display: none"
                            OnClientClick="redirectToStartPage();this.disabled=true;return false;"></asp:LinkButton>
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
        <td style="height: 1pt; border-bottom: #5b0000 1px solid;" colspan="3">
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="left" nowrap="nowrap">
                        <asp:Label ID="LabelClientName" Style="font-family: Microsoft Sans Serif; font-size: 8.25pt;"
                            runat="server"></asp:Label>
                    </td>
                    <td align="right">
                        <asp:Button ID="ButtonCancel" CssClass="ButtonWebBold" runat="server"
                            Text="Close" Width="65px" OnClientClick="redirectToManagementPage();return false;" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<script type="text/javascript" language="javascript">

    function fnHideParentDiv1() {

        try {
            var objdvProgress = document.getElementById('dvProgress');
            if (objdvProgress != null)
                objdvProgress.style.display = 'none';
        }
        catch (Exception) {
            alert(Exception.message);
        }

    }


    function fnShowTemp() {

        try {
            fnShowParentDiv("Communicating with server...", 150, 25)
        }
        catch (Exception) {
        }
    }

    function fnShowParentDiv(msgText, progMsgLeft, progMsgTop) {

        try {

            var objdvProgress = document.getElementById("dvProgress");
            objdvProgress.style.left = progMsgLeft;
            objdvProgress.style.top = progMsgTop;
            objdvProgress.style.display = '';
        }
        catch (Exception) {
        }

    }

    function SetMedicationFilterValue(DropDownConsentMedication) {
        try {
            document.getElementById('<%=HiddenFieldMedication.ClientID%>').value = document.getElementById('<%=DropDownConsentMedication.ClientID%>').value

        }
        catch (Exception) {
        }
    }
  

  
</script>

<div>
    <%--Start By Pradeep--%>
    <table align="center" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="LEFT" style="height: 10px; width: 3%" valign="top">
                            <img id="ImgError" src="App_Themes/Includes/Images/error.gif" alt="" style="display: none;" />&nbsp;
                        </td>
                        <td valign="top" style="width: 85%">
                            <asp:Label ID="LabelError" runat="server" CssClass="redTextError" Width="90%"></asp:Label>
                        </td>
                        <td align="right" style="width: 12%; padding-right: 5px">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table cellpadding="0" border="0" cellspacing="0" style="border-right: #dee7ef thin solid;
                                border-top: #dee7ef thin solid; border-left: #dee7ef thin solid; border-bottom: #dee7ef thin solid;
                                width: 100%;" align="left">
                                <tr>
                                    <td align="left" class="labelFont" valign="top" style="width: 70px">
                                        Start Date&nbsp;
                                    </td>
                                    <td valign="top" style="width: 75px">
                                        <asp:TextBox ID="TextBoxConsentStartDate" runat="server" AutoCompleteType="Disabled"
                                            CssClass="TextBox" MaxLength="30" TabIndex="1" Width="70px"></asp:TextBox>
                                    </td>
                                    <td align="left" valign="top" style="width: 35px">
                                        &nbsp;<img id="Img2" src="App_Themes/Includes/Images/calender_White.jpg" onclick="CalShow( this, '<%=TextBoxConsentStartDate.ClientID%>')"
                                            onmouseover="CalShow( this, '<%=TextBoxConsentStartDate.ClientID%>')" alt="" />
                                    </td>
                                    <td align="left" class="labelFont" valign="top">
                                        End Date&nbsp;
                                    </td>
                                    <td valign="top" style="width: 75px">
                                        <asp:TextBox ID="TextBoxConsentEndDate" runat="server" AutoCompleteType="Disabled"
                                            CssClass="TextBox" MaxLength="30" TabIndex="2" Width="70px"></asp:TextBox>&nbsp;
                                    </td>
                                    <td align="left" valign="top" style="width: 35px">
                                        &nbsp;<img id="Img1" src="App_Themes/Includes/Images/calender_White.jpg" onclick="CalShow( this, '<%=TextBoxConsentEndDate.ClientID%>')"
                                            onmouseover="CalShow( this, '<%=TextBoxConsentEndDate.ClientID%>')" alt="" />
                                    </td>
                                    <td align="left" class="labelFont" valign="top">
                                        Medication&nbsp;
                                    </td>
                                    <td valign="top" style="width: 200px">
                                        <asp:DropDownList ID="DropDownConsentMedication" runat="server" AutoCompleteType="Disabled"
                                            CssClass="ddlist" MaxLength="30" TabIndex="3" Width="200px">
                                        </asp:DropDownList>
                                        &nbsp;
                                    </td>
                                    <td align="left" valign="top">
                                        <asp:Button ID="ButtonApplyFilter" runat="server" Text="Apply Filter" CssClass="ButtonWebBold"
                                            OnClick="ButtonApplyFilter_Click" TabIndex="4" /><asp:HiddenField ID="HiddenFieldMedication"
                                                runat="server" />
                                    </td>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <a href="abc" id="testMedHistory" target="_blank"></a>
                            <input type="button" id="ButtonPrintList" name="ButtonPrintList" value="Print List" onclick="javascript:ButtonPrintListViewConsentHistory('Medications - View Client Consent History');return false;"
                                class="ButtonWebBold" />
                        </td>
                    </tr>
                    <tr>
                        <td width="990px" valign="top">
                            <UI:Heading ID="HeadingMedicationList" runat="server" HeadingText="Consent List" />
                            <table cellpadding="0" cellspacing="0" style="border: 1px; height: 100px; border-color: Black;
                                width: 100%">
                                <tr>
                                    <td style="border: 1px; border-style: solid; border-color: Black;">
                                        <!-- Medication List Control -->
                                        <table cellpadding="0" cellspacing="0" style="border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid;
                                            border-left: #dee7ef 3px solid; border-bottom: #dee7ef 3px solid" width="100%">
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="PanelConsentMedicationListInformation" runat="server" BorderColor="Black"
                                                        BorderStyle="None" Height="400px" Width="100%">
                                                        <uc1:ConsentHistoryList ID="ConsentHistoryList1" runat="server" />
                                                    </asp:Panel>
                                                </td>
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
</div>

<script type="text/javascript" language="javascript">

    SetVariableName(document.getElementById('<%=PanelConsentMedicationListInformation.ClientID%>'));
</script>

