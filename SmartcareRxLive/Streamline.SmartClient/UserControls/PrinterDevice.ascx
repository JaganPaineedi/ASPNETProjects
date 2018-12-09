<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PrinterDevice.ascx.cs"
    Inherits="UserControls_PrinterDevice" %>
<%@ Register TagPrefix="UI" TagName="Heading" Src="~/UserControls/Heading.ascx" %>
<asp:ScriptManagerProxy runat="server" ID="SMP1">
    <Scripts>
        <asp:ScriptReference Path="~/App_Themes/Includes/JS/UserPreferences.js?rel=3_5_x_4_1" NotifyScriptLoaded="true" />
    </Scripts>
</asp:ScriptManagerProxy>

<script language="javascript" type="text/javascript">


    function pageLoad() {

        FillPrinter();

    }
    function FillPrinter() {
        GetPrinterList('<%=PanelPrinterList.ClientID%>', 'DeviceLabel Asc');
    }





    function Insert_Click() {

        try {
            var LabelErrorMessage = document.getElementById('<%=LabelErrorMessage.ClientID%>');

            var ImageError = document.getElementById('<%=ImageError.ClientID%>');
            LabelErrorMessage.innerText = '';
            ImageError.style.visibility = 'hidden';
            ImageError.style.display = 'none';

            if (document.getElementById('<%=DropDownListLocations.ClientID%>').value == '0') {
                ImageError.style.display = 'block';
                ImageError.style.visibility = 'visible';
                LabelErrorMessage.innerText = 'Please Select location.';
                return false;
            }
            else {
                FillPrinterRow('<%=DropDownListLocations.ClientID%>', '<%=CheckBoxActive.ClientID%>', '<%=TextBoxPath.ClientID%>', '<%=TextBoxDeviceLabel.ClientID%>', '<%=HiddenRadioButtonValue.ClientID%>', '<%=PanelPrinterList.ClientID%>', 'buttonInsert');
            }
            ClearPrinterControls('<%=DropDownListLocations.ClientID%>', '<%=CheckBoxActive.ClientID%>', '<%=TextBoxPath.ClientID%>', '<%=TextBoxDeviceLabel.ClientID%>');
        }
        catch (ex) {
        }
    }

    function Clear_Click() {

        ClearPrinterRow('<%=DropDownListLocations.ClientID%>', '<%=CheckBoxActive.ClientID%>', '<%=TextBoxPath.ClientID%>', '<%=TextBoxDeviceLabel.ClientID%>', '<%=HiddenRadioButtonValue.ClientID%>', '<%=PanelPrinterList.ClientID%>', 'buttonInsert');
        $("input[type=radio]:checked", $("#DivPharmacyList")).attr("checked", false);

    }

    function onPrinterRadioClick(sender, e) {
        document.getElementById('buttonInsert').value = "Update";
        var LabelErrorMessage = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>LabelErrorMessage');
        var ImageError = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>ImageError');
        LabelErrorMessage.innerText = '';
        ImageError.style.visibility = 'hidden';
        ImageError.style.display = 'none';

        RadioButtonPrinterParameters(e, '<%=DropDownListLocations.ClientID%>', '<%=CheckBoxActive.ClientID%>', '<%=TextBoxPath.ClientID%>', '<%=TextBoxDeviceLabel.ClientID%>', '<%=HiddenRadioButtonValue.ClientID%>');


    }
    function onDeleteClick(sender, e) {
        try {

            DeleteFromPrinterList(e);
            Clear_Controls();
        }
        catch (err) {
        }
    }

    function Clear_Controls() {

        ClearPrinterControls('<%=DropDownListLocations.ClientID%>', '<%=CheckBoxActive.ClientID%>', '<%=TextBoxPath.ClientID%>', '<%=TextBoxDeviceLabel.ClientID%>');
    }
    function onPrinterHeaderClick(obj) {
        onHeaderPrinterClick(obj);
    }
</script>

<table id="TableMain" border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>
            <table id="TableTitle" border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="width: 30%">
                        <asp:Label ID="Label1" runat="server" Visible="true" CssClass="TittleBarBase" Text="Add Printer Device"></asp:Label>
                    </td>
                    <td style="width: 30%" align="center">
                        <asp:Label ID="LabelSmartCareRx" runat="server" Visible="true" CssClass="SamrtCareTittleBarBase"
                            Text="SmartCareRx" style="display:none"></asp:Label>
                    </td>
                    <td style="width: 30%" align="right">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="right" style="width: 50%">
                                    <asp:LinkButton ID="LinkButtonStartPage" Text="Start Page" runat="server" OnClientClick="redirectToStartPage();this.disabled=true;return false;"></asp:LinkButton>
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
                    <td colspan="3" style="height: 1pt; border-bottom: #5b0000 1px solid;">
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="3">
                        <table cellpadding="0" width="100%" cellspacing="0" border="0">
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td valign="bottom" style="width: 16px">
                                                <asp:Image ID="ImageError" runat="server" ImageUrl="~/App_Themes/Includes/Images/error.gif"
                                                    Style="display: none; vertical-align: middle" />
                                            </td>
                                            <td valign="bottom" align="left">
                                                <asp:Label ID="LabelErrorMessage" runat="server" CssClass="redTextError" Height="18px"
                                                    Style="vertical-align: middle"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td align="right">
                                    <asp:Button ID="ButtonClose" runat="server" Text="Close" CssClass="ButtonWeb" OnClientClick="redirectToStartPage();return false;"
                                        Width="83px" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table id="TableGeneral" border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>
            <UI:Heading ID="Heading1" runat="server" HeadingText="Details" />
        </td>
    </tr>
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" style="height: 1px; border-right: #dee7ef thin solid;
                border-top: #dee7ef thin solid; border-left: #dee7ef thin solid; border-bottom: #dee7ef thin solid;"
                align="left" width="98%">
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td style="width: 8px">
                                </td>
                                <td class="labelFont" style="width: 64px">
                                    <asp:Label ID="LabelName" class="Label" runat="server" Text="Location"></asp:Label>
                                </td>
                                <td style="width: 212px">
                                    &nbsp;<asp:DropDownList ID="DropDownListLocations" runat="server" Width="206px">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 9px">
                                </td>
                                <td style="width: 52px">
                                    <asp:CheckBox ID="CheckBoxActive" runat="server" Text="Active" Style="font-weight: normal;
                                        font-size: 8.25pt; color: black; font-family: Microsoft Sans Serif; text-align: center" />
                                </td>
                                <td style="width: 17px">
                                </td>
                                <td style="width: 17px" class="labelFont">
                                    <asp:Label ID="LabelPath" class="Label" runat="server" Text="Path"></asp:Label>
                                </td>
                                <td style="width: 4px">
                                </td>
                                <td style="width: 50px">
                                    <asp:TextBox ID="TextBoxPath" runat="server" CssClass="TextBox" Width="170px" MaxLength="50"></asp:TextBox>
                                </td>
                                <td style="width: 4px">
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                            </tr>
                        </table>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td height="10px">
                                </td>
                            </tr>
                        </table>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td>
                                    &nbsp;&nbsp;
                                </td>
                                <td nowrap="nowrap" class="labelFont" valign="middle" rowspan="2" style="width: 7%px">
                                    <asp:Label ID="LabelDeviceLabel" class="Label" runat="server" Text="Device Label"></asp:Label>
                                </td>
                                <td style="width: 5px" rowspan="2">
                                </td>
                                <td rowspan="2" style="width: 93%">
                                    &nbsp;<asp:TextBox ID="TextBoxDeviceLabel" runat="server" CssClass="TextBox" Width="206px"
                                        MaxLength="50"></asp:TextBox>
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
                        <%--<asp:Button ID="ButtonClear" runat="server" Text="Clear" CssClass="ButtonWeb" OnClientClick="Clear_Controls();"
                            Width="79px" OnClick="ButtonClear_Click" />--%>
                        <%--<asp:Button ID="ButtonUpdate" runat="server" Text="Insert" CssClass="ButtonWeb" OnClick="ButtonUpdate_Click" Width="79px" />--%>
                        <input type="button" id="buttonInsert" class="ButtonWeb" onclick="Insert_Click()"
                            value="Insert" />
                        <input type="button" id="buttonClear" class="ButtonWeb" onclick="Clear_Click()" value="Clear" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td style="width: 663px; height: 10px;">
            <input type="hidden" id="HiddenRadioButtonValue" runat="server" />
        </td>
        <td align="center">
        </td>
    </tr>
</table>
<table style="border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid; border-left: #dee7ef 3px solid;
    width: 100%; border-bottom: #dee7ef 3px solid; height: 310px;" cellspacing="0"
    cellpadding="0">
    <tbody>
        <tr>
            <td>
                <div id="DivPharmacyList" style="overflow-x: hidden; overflow-y: auto; height: 310px;
                    width: 100%;">
                    <%--<UI:PharmaciesList ID="PharmaciesList1" runat="server" /> --%>
                    <asp:Panel ID="PanelPrinterList" runat="server">
                    </asp:Panel>
                </div>
            </td>
        </tr>
    </tbody>
</table>
