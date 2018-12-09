<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewHistory.ascx.cs" Inherits="Streamline.SmartClient.UI.UserControls_ViewHistory" %>
<%@ Register TagPrefix="UI" TagName="Heading" Src="~/UserControls/Heading.ascx" %>
<%@ Register TagPrefix="UI" TagName="MedicationList" Src="~/UserControls/MedicationList.ascx" %>
<asp:ScriptManagerProxy runat="server" ID="SMP1">
    <Scripts>
        <asp:ScriptReference Path="~/App_Themes/Includes/JS/ViewMedicationHistory.js?rel=3_5_x_4_1" NotifyScriptLoaded="true" />
        <asp:ScriptReference Path="~/App_Themes/Includes/JS/AjaxScript.js?rel=3_5_x_4_1" NotifyScriptLoaded="true" />
    </Scripts>
</asp:ScriptManagerProxy>
<table style="width: 100%">
    <tr>
        <td style="width: 30%">
            <asp:Label ID="Label2" runat="server" Visible="true" CssClass="TittleBarBase" Text="View Medication History"></asp:Label>
        </td>
        <td style="width: 30%" align="center">
            <asp:Label ID="LabelSmartCareRx" runat="server" Visible="true" CssClass="SamrtCareTittleBarBase"
                Text="SmartCareRx"></asp:Label>
        </td>
        <td style="width: 30%" align="right">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="right" style="width: 50%">
                        <asp:LinkButton ID="LinkButtonStartPage" Text="Start Page" runat="server" OnClientClick="redirectToStartPage();this.disabled=true;return false;"
                            Style="display: none"></asp:LinkButton>
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
                        <asp:Button ID="ButtonCancel" CssClass="ButtonWebBold" runat="server" Text="Close" Width="65px" OnClientClick="redirectToManagementPage();return false;" />
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
            ShowError(Exception.description, true);
        }

    }


    function fnShowTemp() {

        try {
            fnShowParentDiv("Communicating with server...", 150, 25)
        }
        catch (Exception) {
            ShowError(Exception.description, true);
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
            ShowError(Exception.description, true);
        }

    }

    function SetFilterValue(DropDownMedication) {
        try {
            document.getElementById('<%=HiddenFieldMedication.ClientID%>').value = document.getElementById('<%=DropDownMedication.ClientID%>').value
        }
        catch (Exception) {
            ShowError(Exception.description, true);
        }
    }

    function SetPrescriberFilterValue() {
        try {
            document.getElementById('<%=HiddenFieldPrescriber.ClientID%>').value = document.getElementById('<%=DropDownListPrescriber.ClientID%>').value
        }
        catch (Exception) {
            ShowError(Exception.description, true);
        }
    }
    function SetDateFilterValue() {
        try {
            document.getElementById('<%=HiddenFieldDateFilter.ClientID%>').value = document.getElementById('<%=DropDownListDateFilter.ClientID%>').value
            //alert(document.getElementById('<%=HiddenFieldDateFilter.ClientID%>').value);
        }
        catch (Exception) {
            ShowError(Exception.description, true);
        }
    }
    function SetDiscontinueReasonFilterValue() {
        try {
            document.getElementById('<%=HiddenFieldDiscontineReasonFilter.ClientID%>').value = document.getElementById('<%=DropDownListDiscontinuedReason.ClientID%>').value
        }
        catch (Exception) {
            ShowError(Exception.description, true);
        }
    }
  
</script>

<div>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="LEFT" style="height: 10px; width: 3%" valign="top">
                            <img id="ImgError" src="App_Themes/Includes/Images/error.gif" alt="" style="display: none;" />&nbsp;
                        </td>
                        <td valign="top" style="width: 100%">
                            <asp:Label ID="LabelError" runat="server" CssClass="redTextError"></asp:Label>
                        </td>
                        <td align="right">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <!--Source-->
                <table border="0px" cellpadding="0" cellspacing="0" style="height: 645px; width:100%;">
                    <tr>
                        <td>
                            <table border="0px" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <table cellpadding="0" cellspacing="0" style="height: 2px; border-right: #dee7ef thin solid;
                                            border-top: #dee7ef thin solid; border-left: #dee7ef thin solid; border-bottom: #dee7ef thin solid;
                                            width: 100%;" align="left">
                                            <tr>
                                                <td valign="middle" align="left" colspan="3">
                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                            </td>
                                                            <td>
                                                                <table border="0px" cellpadding="0" cellspacing="0px">
                                                                    <tr>
                                                                        <td align="center" class="labelFont" valign="middle">
                                                                            Date&nbsp;
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <asp:DropDownList ID="DropDownListDateFilter" runat="server" AutoCompleteType="Disabled"
                                                                                CssClass="ddlist" MaxLength="30" TabIndex="6" Width="150px">
                                                                            </asp:DropDownList>
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td>
                                                                <table border="0px" cellpadding="0" cellspacing="0px">
                                                                    <tr>
                                                                        <td align="left" class="labelFont" valign="middle" style="width: 70px">
                                                                            Start Date&nbsp;
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <asp:TextBox ID="TextBoxStartDate" runat="server" AutoCompleteType="Disabled" CssClass="TextBox"
                                                                                MaxLength="30" TabIndex="5" Width="95px" Height="15px"></asp:TextBox>&nbsp;
                                                                        </td>
                                                                        <td align="right" valign="middle" style="width: 29px">
                                                                            <img id="Img2" src="App_Themes/Includes/Images/calender_White.jpg" onclick="CalShow( this, '<%=TextBoxStartDate.ClientID%>')"
                                                                                onmouseover="CalShow( this, '<%=TextBoxStartDate.ClientID%>')" alt="" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td>
                                                                <table border="0px" cellpadding="0" cellspacing="0px">
                                                                    <tr>
                                                                        <td align="left" class="labelFont" valign="middle">
                                                                            End Date&nbsp;
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <asp:TextBox ID="TextBoxEndDate" runat="server" AutoCompleteType="Disabled" CssClass="TextBox"
                                                                                MaxLength="30" TabIndex="5" Width="95px" Height="15px"></asp:TextBox>&nbsp;
                                                                        </td>
                                                                        <td align="right" valign="middle">
                                                                            <img id="Img1" src="App_Themes/Includes/Images/calender_White.jpg" onclick="CalShow( this, '<%=TextBoxEndDate.ClientID%>')"
                                                                                onmouseover="CalShow( this, '<%=TextBoxEndDate.ClientID%>')" alt="" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td>
                                                                <table border="0px" cellpadding="0" cellspacing="0px">
                                                                    <tr>
                                                                        <td align="left" class="labelFont" valign="middle">
                                                                            Medication&nbsp;
                                                                        </td>
                                                                        <td valign="top">
                                                                            <asp:DropDownList ID="DropDownMedication" runat="server" AutoCompleteType="Disabled"
                                                                                CssClass="ddlist" MaxLength="30" TabIndex="6" Width="200px">
                                                                            </asp:DropDownList>
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="ButtonApplyFilter" runat="server" Text="Apply Filter" CssClass="ButtonWebBold"
                                                                    OnClick="ButtonApplyFilter_Click" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" colspan="2">
                                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 600px">
                                                        <tr>
                                                            <td>
                                                                <table border="0px" cellpadding="0" cellspacing="0px">
                                                                    <tr>
                                                                        <td align="center" class="labelFont" valign="middle">
                                                                            Prescriber&nbsp;
                                                                        </td>
                                                                        <td valign="top">
                                                                            <asp:DropDownList ID="DropDownListPrescriber" runat="server" AutoCompleteType="Disabled"
                                                                                CssClass="ddlist" MaxLength="30" TabIndex="4" Width="200px">
                                                                            </asp:DropDownList>
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td>
                                                                <table border="0px" cellpadding="0" cellspacing="0px">
                                                                    <tr>
                                                                        <td align="center" class="labelFont" valign="middle">
                                                                            Discontinue Reason&nbsp;
                                                                        </td>
                                                                        <td valign="top">
                                                                            <asp:DropDownList ID="DropDownListDiscontinuedReason" runat="server" AutoCompleteType="Disabled"
                                                                                CssClass="ddlist" MaxLength="30" TabIndex="4" Width="200px">
                                                                            </asp:DropDownList>
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <td style="width: 66px">
                                                <asp:HiddenField ID="HiddenFieldMedication" runat="server" />
                                                &nbsp;&nbsp;<asp:HiddenField ID="HiddenFieldDateFilter" runat="server" />
                                            </td>
                                            <td style="width: 215px">
                                                &nbsp;<asp:HiddenField ID="HiddenFieldPrescriber" runat="server" />
                                                <asp:HiddenField ID="HiddenFieldDiscontineReasonFilter" runat="server" />
                                            </td>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <a href="abc" id="testMedHistory" target="_blank"></a>
                            <input type="button" id="ButtonPrintList" name="ButtonPrintList" value="Print List" onclick="javascript:ButtonPrintListViewHistory('Medications - View History');return false;"
                                class="ButtonWebBold" <%=enableDisabled(Streamline.BaseLayer.Permissions.PrintList)%> />
                            <input type="button" id="ExapandCollapseMedList" name="ButtonExapandCollapseMedList" value="Expand/Collapse All"  class="ExapandCollapseMedList ButtonWebBold" />                               
                        </td>
                    </tr>
                    <tr>
                        <td width="100%" valign="top">
                            <UI:Heading ID="HeadingMedicationList" runat="server" HeadingText="Medication List" />
                            <table cellpadding="0" cellspacing="0" style="border: 1px; height: 100px; border-color: Black;
                                width: 100%">
                                <tr>
                                    <td style="border: 1px; border-style: solid; border-color: Black;">
                                        <!-- Medication List Control -->
                                        <table cellpadding="0" cellspacing="0" style="border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid;
                                            border-left: #dee7ef 3px solid; border-bottom: #dee7ef 3px solid" width="100%">
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="PanelMedicationListInformation" runat="server" BorderColor="Black"
                                                        BorderStyle="None" Height="400px" Width="100%" style="overflow:auto;">
                                                        <UI:MedicationList ID="MedicationList1" runat="Server" />
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                        <!-- Medication List Control -->
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

    SetVariableName(document.getElementById('<%=PanelMedicationListInformation.ClientID%>'));
   
 


</script>

