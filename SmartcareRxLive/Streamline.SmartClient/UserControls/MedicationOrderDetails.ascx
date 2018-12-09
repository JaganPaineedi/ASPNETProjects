<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MedicationOrderDetails.ascx.cs"
    Inherits="Streamline.SmartClient.UI.UserControls_MedicationOrderDetails" %>
<%@ Register TagPrefix="UI" TagName="Heading" Src="~/BasePages/UI/Heading.ascx" %>
<%@ Register TagPrefix="UI" TagName="MedicationClientPersonalInformation" Src="~/UserControls/MedicationClientPersonalInformation.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="UI" TagName="MedicationList" Src="~/UserControls/MedicationList.ascx" %>

<script type="text/javascript" language="javascript">
    function EnableDisable() {
        EnableDisableObjects('<%=CheckBoxDiscontinued.ClientID %>', '<%= TextBoxDiscontinue.ClientID%>', '<%=enableDisabled(Streamline.BaseLayer.Permissions.NewOrder)%>');

    }
    //Code added by Loveena in ref to Task#2971
    function ClosePage() {
        if ($("input[id$=HiddenPageName]").val() == "PatientMainPage") {
            redirectToManagementPage();
        }
        else if ($("input[id$=HiddenPageName]").val() == "ViewHistory") {
            redirectToViewHistoryPageClearSession();
        }
    }

</script>

<asp:ScriptManagerProxy runat="server" ID="SMPOD">
    <Scripts>
        <asp:ScriptReference Path="~/App_Themes/Includes/JS/MedicationOrderDetails.js?rel=3_5_x_4_1" NotifyScriptLoaded="true" />
        <asp:ScriptReference Path="~/App_Themes/Includes/JS/CommonFunctions.js?rel=3_5_x_4_1" NotifyScriptLoaded="true" />
        <asp:ScriptReference Path="~/App_Themes/Includes/JS/MedicationClientPersonalInformation.js?rel=3_5_x_4_1"
            NotifyScriptLoaded="true" />
    </Scripts>
</asp:ScriptManagerProxy>
<div>
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="99%">
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td style="width: 30%">
                            <asp:Label ID="LabelHeading" runat="server" CssClass="TittleBarBase" Text="Order Details"></asp:Label>
                        </td>
                        <td align="center" style="width: 30%">
                            <asp:Label ID="LabelSmartCareRx" runat="server" Visible="true" CssClass="SamrtCareTittleBarBase"
                                Text="SmartCareRx"></asp:Label>
                        </td>
                        <td style="width: 30%" align="right">
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="right" style="width: 50%">
                                        <asp:LinkButton ID="LinkButtonStartPage" Style="display: none" Text="Start Page" runat="server" OnClientClick="redirectToStartPage(); return false;"></asp:LinkButton>
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
                        <td style="height: 1pt; border-bottom: #5b0000 1px solid;" colspan="4">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="right" style="height: 30px; width: 3%" valign="bottom">
                                        <img id="ImgError" src="App_Themes/Includes/Images/error.gif" alt="" style="display: none;" />&nbsp;
                                    </td>
                                    <td valign="middle" nowrap="nowrap">
                                        <asp:Label ID="LabelError" runat="server" class="redTextError"></asp:Label>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                        </td>
                        <td align="right">
                            &nbsp;<input type="button" id="ButtonUpdate" name="ButtonUpdate" onclick="return Validate();return false;"
                                title="Update" style="width: 88px; height: 25px; visibility: hidden" value="Update"
                                class="ButtonWeb" runat="server" />
                            <asp:Button runat="server" ID="ButtonNewOrder" Text="New Order"
                                CssClass="ButtonWebBold" Style="display: none" OnClientClick="redirectToOrderPageClearSession();return false;" />
                            <input type="button" id="buttonPrintOrder" name="buttonPrintOrder" <%=enableDisabled(Streamline.BaseLayer.Permissions.NewOrder)%>
                                onclick="return ShowPrintOrderDialog('<%=HiddenFieldLatestClientMedicationScriptId.ClientID%>','<%=HiddenFieldScriptOrderingMethod.ClientID %>','<%=HiddenFieldPrescriptionStatus.ClientID %>');"
                                title="Print/Fax Order" value="Print/Fax Order"
                                class="ButtonWebBold" />
                            <asp:Button ID="ButtonCancel" runat="server" Text="Close"
                                Width="88px" CssClass="ButtonWebBold" OnClientClick="ClosePage();return false;" />&nbsp;
                            <!---------->
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <!--Source-->
                <table border="0px" cellpadding="0" cellspacing="0" style="width: 99%; height: 400px;">
                    <tr>
                        <td id="TDClientPersonalInformation">
                            <table border="0px" cellpadding="0" cellspacing="0" id="TableClientPersonalInformation"
                                width="99%">
                                <tr>
                                    <td width="100%">
                                        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                            <tr>
                                                <td valign="top" style="width: 100%" colspan="3">
                                                    <UI:MedicationClientPersonalInformation ID="MedicationClientPersonalInformationControl"
                                                        runat="Server" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td id="TDOrderDetails" style="height: 239px">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <UI:Heading ID="Heading1" runat="server" HeadingText="Order Details" />
                                    </td>
                                    <td align="left">
                                        <asp:CheckBox ID="CheckBoxPermitChanges" runat="server" Text="Permit Changes By Other Users"
                                            CssClass="labelFont" />
                                    </td>
                                </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0" style="border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid;
                                border-left: #dee7ef 3px solid; border-bottom: #dee7ef 3px solid; background-color: #F4F4F4"
                                id="TableOrderDetails" width="100%">
                                <!--First Row Containing Medication/Prescriber  -->
                                <tr>
                                    <td style="height: 38px">
                                        <table width="100%">
                                            <tr>
                                                <td style="width: 10%; height: 15px;" valign="middle" nowrap class="labelHeaderRow">
                                                    Medication:
                                                </td>
                                                <td style="width: 20%; height: 15px;font-weight: bold" valign="middle" nowrap class="Label">
                                                    <asp:Label ID="LabelMedicationName" runat="server" class="Label"> </asp:Label>
                                                </td>
                                                <td style="width: 10%; height: 15px;" valign="middle" nowrap class="labelHeaderRow">
                                                    Dx/Pupose:
                                                </td>
                                                <td style="width: 25%; height: 15px;" valign="middle" nowrap class="Label">
                                                    <asp:Label ID="LabelDxPurpose" runat="server" class="Label"> </asp:Label>
                                                </td>
                                                <td style="width: 10%; height: 15px;" valign="middle" nowrap class="labelHeaderRow">
                                                    Prescriber:
                                                </td>
                                                <td style="width: 20%; height: 15px;" valign="middle" nowrap class="Label">
                                                    <asp:Label ID="LabelPrescriber" runat="server" class="Label"> </asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0" style="border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid;
                                border-left: #dee7ef 3px solid; border-bottom: #dee7ef 3px solid; width: 100%;
                                background-color: #F4F4F4" id="Table1">
                                <!--First Row Containing Medication/Prescriber  -->
                                <tr>
                                    <td style="height: 104px">
                                        <asp:GridView ID="GridViewMedicationInstructions" runat="server" AllowSorting="True"
                                            AutoGenerateColumns="False" BorderWidth="0px" CellPadding="0" GridLines="None"
                                            PageSize="100" RowStyle-Height="10px" EnableViewState="False" Width="100%" OnRowDataBound="GridViewMedicationInstructions_RowDataBound">
                                            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                                            <RowStyle CssClass="GridViewRowStyle" Height="10px" />
                                            <HeaderStyle CssClass="GridViewHeaderText" />
                                            <PagerStyle CssClass="GridViewPagerText" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemStyle HorizontalAlign="Center" Width="2%" VerticalAlign="Middle"></ItemStyle>
                                                    <ItemTemplate>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="StrengthDescription" HeaderText="Strength">
                                                    <ItemStyle HorizontalAlign="left" VerticalAlign="Middle" Wrap="False" Width="5%" />
                                                    <HeaderStyle HorizontalAlign="left" />
                                                </asp:BoundField>
                                                <asp:TemplateField ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderTemplate>
                                                        Rx Start
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="LabelStartDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "StartDate","{0:MM/dd/yyyy}")%>'>
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="10%" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Left">
                                                    <HeaderTemplate>
                                                        Rx End
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="LabelEndDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EndDate","{0:MM/dd/yyyy}")%>'>
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Instruction" HeaderText="Dose/Unit/Directions">
                                                    <ItemStyle HorizontalAlign="left" VerticalAlign="Middle" Wrap="False" Width="5%" />
                                                    <HeaderStyle HorizontalAlign="left" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Days" HeaderText="Days">
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" Width="5%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="PharmacyAmount" HeaderText="Dispense Qty">
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" Width="10%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Refills" HeaderText="Refills">
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="false" Width="5%" />
                                                    <HeaderStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Sample" HeaderText="Sample">
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" Width="5%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Stock" HeaderText="Stock">
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" Width="5%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <table cellspacing="0" cellpadding="0" border="0" style="border-width: 0px; width: 100%;
                                                    border-collapse: collapse;">
                                                    <tr class="GridViewHeaderText" style="height: 20px;">
                                                        <th scope="col">
                                                            &nbsp;
                                                        </th>
                                                        <th align="left" scope="col">
                                                            Strength
                                                        </th>
                                                        <th scope="col">
                                                            Rx Start
                                                        </th>
                                                        <th align="left" scope="col">
                                                            Rx End
                                                        </th>
                                                        <th align="left" scope="col">
                                                            Dose/Unit/Directions
                                                        </th>
                                                        <th align="center" scope="col">
                                                            Days
                                                        </th>
                                                        <th align="center" scope="col">
                                                            Dispense Qty
                                                        </th>
                                                        <th align="center" scope="col">
                                                            Refills
                                                        </th>
                                                        <th align="center" scope="col">
                                                            Sample
                                                        </th>
                                                        <th align="center" scope="col">
                                                            Stock
                                                        </th>
                                                        <th align="center" scope="col">
                                                            Refills
                                                        </th>
                                                    </tr>
                                                    <tr class="GridViewRowStyle" style="height: 10px;">
                                                        <td align="center" colspan="10" valign="middle">
                                                            No Records Found
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>
                                            <PagerSettings Mode="NumericFirstLast" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" style="border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid;
                                border-left: #dee7ef 3px solid; border-bottom: #dee7ef 3px solid; width: 100%;
                                background-color: #F4F4F4">
                                <tr>
                                    <td style="width: 10%; height: 15px;" valign="middle" nowrap class="labelHeaderRow">
                                        <input id="CheckBoxOffLabel" type="checkbox" runat="server" title="Off Label" disabled="disabled" />
                                        <span id="Span_OffLabel" runat="server" class="labelFont">Off Label</span>
                                    </td>
                                    <td style="width: 10%; height: 15px;" valign="middle" nowrap class="labelHeaderRow">
                                        <input id="CheckBoxVORB" type="checkbox" runat="server" title="Off Label" disabled="disabled" />
                                        Verbal Order Read Back
                                    </td>
                                    <td style="width: 10%; height: 15px;" valign="middle" nowrap class="labelHeaderRow">
                                        <input id="CheckBoxDAW" type="checkbox" runat="server" title="Off Label" disabled="disabled" />
                                        Dispense As Written
                                    </td>
                                    <td style="width: 105px; height: 15px;" valign="middle" nowrap class="labelHeaderRow">
                                        Desired Outcome
                                    </td>
                                    <td colspan="3" style="height: 24px;">
                                        <asp:TextBox ID="TextBoxDesiredOutcome" EnableTheming="false" runat="server" TextMode="MultiLine"
                                            MaxLength="1000" Width="98%" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td style="width: 6%; height: 15px;" valign="middle" nowrap class="labelHeaderRow">
                                        Comments
                                    </td>
                                    <td colspan="3" style="height: 24px;">
                                        <asp:TextBox ID="TextBoxComments" EnableTheming="false" runat="server" TextMode="MultiLine"
                                            MaxLength="1000" Width="98%" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td style="width: 10%; height: 15px;" valign="middle" nowrap class="labelHeaderRow">
                                        <input type="checkbox" id="CheckBoxIncudeOnProescription" runat="server" disabled="disabled" />
                                        Include On Prescription
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" style="background-color: #F4F4F4">
                                <tr>
                                    <td width="50%">
                                        <table width="100%">
                                            <tr>
                                                <td style="width: 10%" valign="middle" nowrap class="labelHeaderRow">
                                                    Note
                                                </td>
                                                <td style="width: 90%">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:TextBox ID="TextBoxSpecialInstructions" runat="server" EnableTheming="false" MaxLength="1000"
                                                        TextMode="MultiLine" Width="98%" Enabled="true" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="50%">
                                        <table width="100%">
                                            <tr>
                                                <td style="width: 30%" valign="middle" nowrap class="labelHeaderRow">
                                                    Discontinue Reason
                                                </td>
                                                <td style="width: 70%">
                                                    <asp:DropDownList ID="DropDownDiscontinueReason" runat="server" Width="200px" Enabled="False">
                                                    </asp:DropDownList>
                                                    <asp:CheckBox ID="CheckBoxDiscontinued" runat="server" Text="Discontinued" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:TextBox ID="TextBoxDiscontinue" runat="server" EnableTheming="false" TextMode="MultiLine"
                                                        Width="98%" Wrap="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td style="width: 6%; height: 15px;" valign="middle" nowrap class="labelHeaderRow">
                                        Entered By
                                    </td>
                                    <td style="width: 25%; height: 15px;" valign="middle" nowrap class="Label">
                                        <asp:Label ID="LabelEnteredBy" runat="server" class="Label"> </asp:Label>
                                    </td>
                                    <td style="width: 6%; height: 15px;" valign="middle" nowrap class="labelHeaderRow">
                                        Date Created
                                    </td>
                                    <td style="width: 25%; height: 15px;" valign="middle" nowrap class="Label">
                                        <asp:Label ID="LabelDateCreated" runat="server" class="Label"> </asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <!--Order Details -->
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td valign="top">
                            <UI:Heading ID="HeadingMedicationList" runat="server" HeadingText="Script History" />
                        </td>
                    </tr>
                </table>
                <!--Start of Grid Script History DIV Tag-->
                <table cellpadding="0" cellspacing="0" style="border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid;
                    border-left: #dee7ef 3px solid; border-bottom: #dee7ef 3px solid" width="99%">
                    <tr>
                        <td valign="top">
                            <div id="MainOuterDiv" class="divVertScroll">
                                <!--Grid View Script History-->
                                <div id="DivClientScriptHistory">
                                    <asp:GridView ID="DataGridScriptHistory" runat="server" AutoGenerateColumns="false"
                                        Width="100%" AllowPaging="false" OnRowDataBound="GridScriptHistory_RowDataBound"
                                        GridLines="None" ShowHeader="true" EnableTheming="false">
                                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle ListPageAltRow" />
                                        <RowStyle CssClass="GridViewRowStyle" />
                                        <HeaderStyle CssClass="GridViewHeaderText" />
                                        <PagerStyle CssClass="GridViewPagerText" VerticalAlign="Bottom" />
                                        <Columns>
                                            <asp:TemplateField SortExpression="DeliveryMethod">
                                                <ItemStyle HorizontalAlign="left" Width="10%"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelDeliveryMethod" runat="server" Text='<%# Eval("DeliveryMethod")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderTemplate>
                                                    <asp:Label ID="LabelHeaderDeliveryMethod" Text="Delivery Method" runat="server" Style="cursor: pointer;
                                                        text-decoration: underline"></asp:Label>
                                                </HeaderTemplate>
                                                <HeaderStyle HorizontalAlign="left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField SortExpression="ScriptCreationDate">
                                                <ItemStyle HorizontalAlign="left" Width="10%"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelScriptCreationDate" runat="server" Text='<%# Eval("ScriptCreationDate","{0:M/d/yyyy} {0:HH:mm tt}")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderTemplate>
                                                    <asp:Label ID="LabelHeaderScriptCreationDate" Text="Date/Time" runat="server" Style="cursor: pointer;
                                                        text-decoration: underline"></asp:Label>
                                                </HeaderTemplate>
                                                <HeaderStyle HorizontalAlign="left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField SortExpression="CreatedBy">
                                                <ItemStyle HorizontalAlign="left" Width="10%"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelCreatedBy" runat="server" Text='<%# Eval("CreatedBy")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderTemplate>
                                                    <asp:Label ID="LabelHeaderCreatedBy" Text="Created By" runat="server" Style="cursor: pointer;
                                                        text-decoration: underline"></asp:Label>
                                                </HeaderTemplate>
                                                <HeaderStyle HorizontalAlign="left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField SortExpression="Reason">
                                                <ItemStyle HorizontalAlign="left" Width="12%"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelReason" runat="server" Text='<%# Eval("Reason")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderTemplate>
                                                    <asp:Label ID="LabelHeaderReason" Text="Reprint Reason" runat="server" Style="cursor: pointer;
                                                        text-decoration: underline"></asp:Label>
                                                </HeaderTemplate>
                                                <HeaderStyle HorizontalAlign="left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField SortExpression="LocationName">
                                                <ItemStyle HorizontalAlign="left" Width="15%"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelLocation" runat="server" Text='<%# Eval("LocationName")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderTemplate>
                                                    <asp:Label ID="LabelHeaderLocation" Text="Location" runat="server" Style="cursor: pointer;
                                                        text-decoration: underline"></asp:Label>
                                                </HeaderTemplate>
                                                <HeaderStyle HorizontalAlign="left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField SortExpression="PharmacyName">
                                                <ItemStyle HorizontalAlign="left" Width="23%"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelPharmacyName" runat="server" Text='<%# Eval("PharmacyName")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderTemplate>
                                                    <asp:Label ID="LabelHeaderPharmacyName" Text="Pharmacy Name" runat="server" Style="cursor: pointer;
                                                        text-decoration: underline"></asp:Label>
                                                </HeaderTemplate>
                                                <HeaderStyle HorizontalAlign="left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemStyle HorizontalAlign="left" Width="10%"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelPharmacyName" runat="server" Text='<%# Eval("StatusDescription")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderTemplate>
                                                    <asp:Label ID="LabelHeaderPharmacyName" Text="Status" runat="server" Style="cursor: pointer;
                                                        text-decoration: underline"></asp:Label>
                                                </HeaderTemplate>
                                                <HeaderStyle HorizontalAlign="left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemStyle HorizontalAlign="left" Width="10%"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Image runat="server" ID="Pillbottle_Image" ImageUrl="~/App_Themes/Includes/Images/pill-bottle.JPG" style="<%# ShowHidePillImage %> " Width="15px" AlternateText="Pill bottle" />
                                                </ItemTemplate>
                                                <HeaderTemplate>
                                                    <asp:Label ID="LabelHeaderPillbottle_Image" Text="Stock/Sample" runat="server" Style="cursor: pointer;
                                                        text-decoration: underline"></asp:Label>
                                                </HeaderTemplate>
                                                <HeaderStyle HorizontalAlign="left" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <table cellspacing="0" cellpadding="0" border="0" id="Control_ASP.usercontrols_medicationorderdetails_ascx_DataGridScriptHistory"
                                                style="border-width: 0px; width: 100%; border-collapse: collapse;">
                                                <tr class="GridViewHeaderText" style="height: 20px;">
                                                    <th align="left" scope="col" style="width: 3%">
                                                        &nbsp;&nbsp;
                                                    </th>
                                                    <th align="left" scope="col" style="width: 10%">
                                                        Delivery Method
                                                    </th>
                                                    <th align="left" scope="col" style="width: 2%">
                                                    </th>
                                                    <th align="left" scope="col" style="width: 15%">
                                                        Date/Time
                                                    </th>
                                                    <th align="left" scope="col" style="width: 2%">
                                                    </th>
                                                    <th align="left" scope="col" style="width: 15%">
                                                        User
                                                    </th>
                                                    <th align="left" scope="col" style="width: 2%">
                                                    </th>
                                                    <th align="left" scope="col" style="width: 15%">
                                                        Reprint Reason
                                                    </th>
                                                    <th align="left" scope="col" style="width: 2%">
                                                    </th>
                                                    <th align="left" scope="col" style="width: 15%">
                                                        Location
                                                    </th>
                                                    <th align="left" scope="col" style="width: 2%">
                                                    </th>
                                                    <th align="left" scope="col" style="width: 15%">
                                                        Pharmacy Name
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td colspan="10" class="GridViewRowStyle" align="center">
                                                        <br />
                                                        No Records Found<br />
                                                    </td>
                                                </tr>
                                            </table>
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </div>
                            </div>
                            <!--End of Grid History-->
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="CopyRightLineColor" style="height: 1px">
                <asp:Label ID="LabelClientScript" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:HiddenField
                    ID="HiddenFieldLatestClientMedicationScriptId" runat="server" />
                <asp:HiddenField ID="HiddenFieldScriptOrderingMethod" runat="server" />
                <asp:HiddenField ID="HiddenFieldClientMedicationId" runat="server" />
                <asp:HiddenField ID="HiddenFieldAscDescClientScriptHistory" runat="server" Value="ASC" />
                <asp:HiddenField ID="HiddenFieldScriptId" runat="server" />
                <asp:HiddenField ID="HiddenFieldPrescriptionStatus" runat="server" />
            </td>
        </tr>
        <%--<tr>
                           <td align="center" class="footertextbold" style="height: 15px">
                            </td>
                        </tr>--%>
    </table>

    <script language="javascript" type="text/javascript">
        function pageLoad() {
            try {
                FillAllergyControlofClientInformation('N');
                EnableDisablePrintButton('<%=HiddenFieldLatestClientMedicationScriptId.ClientID%>', 'buttonPrintOrder', '<%=enableDisabled(Streamline.BaseLayer.Permissions.NewOrder)%>');
                ShowEditPreferredPharmacy('N'); //Hide PreferredPharmacyEdit Button added by Loveena in ref to task#92
                //Added by Loveena in ref to Task#2642 as 'Communicating with server' keep on enabled after page load.
                fnHideParentDiv();
            }
            catch (ex) {

            }

        }

        function FillGridScriptHistory() {
            try {
                //A new parameter added by Sonia as OrderDetails should be get both according to ClientMedicationId as well as ScriptId
                FillGridScriptHistoryHTML('<%=HiddenFieldClientMedicationId.ClientID %>', '<%=HiddenFieldScriptId.ClientID%>','<%=ShowHidePillImage%>');

            }
            catch (ex) {


            }

        }


        function SortGridScriptHistory(ShortField) {
            try {
                SortScriptHistoryHtml(ShortField, '<%=HiddenFieldAscDescClientScriptHistory.ClientID %>','<%=ShowHidePillImage%>');

            }
            catch (ex) {


            }

        }

        function ShowViewHistoryDiv() {
            return ShowMedicationViewHistoryDiv();
        }

    </script>

</div>
