<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VerbalOrdersReview.ascx.cs"
    Inherits="UserControls_VerbalOrdersReview" %>
<%@ Register TagPrefix="UI" TagName="Heading" Src="~/BasePages/UI/Heading.ascx" %>
<asp:ScriptManagerProxy runat="server" ID="SMP1">
    <Scripts>
        <asp:ScriptReference Path="~/App_Themes/Includes/JS/MedicationMgt.js?rel=3_5_x_4_1" NotifyScriptLoaded="true" />
    </Scripts>
</asp:ScriptManagerProxy>

<script type="text/javascript" language="javascript">

    $(document).ready(function () {
        if ($("span[id$=QInteraction]").length > 0) {
            $("span[id$=QInteraction]").css('margin-right', '3px')
        }
        document.getElementById("CheckBox_ReadyToSign").checked = false;
        document.getElementById("TextBox_OneTimePassword").value = "";
    });

    function ApproveOrder() {
        ApproveOrders('<%=hiddenClientMedicationScriptId.ClientID %>');
    }
    function RetractOrders() {
        RetractOrder('<%=hiddenClientMedicationScriptId.ClientID %>');
    }


    function Close() {

        if (document.getElementById('<%=HiddenFieldSign.ClientID %>').value == "true") {
            if (confirm('There are approved orders that have not been signed yet. Would you still like to Close the page?')) {
                //added By Priya Ref:task No:2859
                if (document.getElementById("HiddenPageName").value == "FromDashBoard") {
                    redirectToStartPage();
                }
                else
                    redirectToManagementPage();
            }
            else {

                // BeforeSign();
            }
        }
        else {
            //Added by Loveena on 28Nov2009
            //added By Priya Ref:task No:2859
            if (document.getElementById("HiddenPageName").value == "FromDashBoard")
                redirectToStartPage();
            else
                redirectToManagementPage();
        }
    }

    function BeforeSign(type) {
        var path = '<%=Server.MapPath(".") %>';
        path.ReplaceAll("//", "#");
        ValidateSign('<%=LabelErrorMessage.ClientID %>', '<%=ImageError.ClientID %>', '<%=tableErrorMessage.ClientID %>', '<%=txtPasword.ClientID %>', type, path)
    }
</script>

<a id="CancelOrderCreateControls" runat="server" onclick="false" onserverclick="createControl"></a>
<a id="anchor" runat="server" onclick="false" onserverclick="GetControl"></a>
<table width="100%">
    <tr>
        <td style="width: 30%" nowrap="nowrap">
            <asp:Label ID="LabelTitle" runat="server" Visible="true" CssClass="TittleBarBase"
                Text="Order Approval for..."></asp:Label>
        </td>
        <td align="center" style="width: 30%">
            <asp:Label ID="LabelSmartCareRx" runat="server" Visible="true" CssClass="SamrtCareTittleBarBase"
                Text="SmartCareRx"></asp:Label>
        </td>
        <td style="width: 40%" align="right">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="right" style="width: 50%">
                        <asp:LinkButton ID="LinkButtonStartPage" Text="Start Page" runat="server" Style="display: none"
                            OnClientClick="redirectToStartPage();return false;"></asp:LinkButton>
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
        <td style="height: 1pt; border-bottom: #5b0000 1px solid;" colspan="4"></td>
    </tr>
</table>
<table cellpadding="0" width="100%" cellspacing="0" border="0">
    <tr>
        <td align="left" valign="top" style="width: 40%;">
            <table id="tableErrorMessage" runat="server" border="0" cellpadding="0" cellspacing="0"
                style="height: 10px">
                <tr>
                    <td valign="top" style="height: 10px">
                        <asp:Image ID="ImageError" runat="server" ImageUrl="~/App_Themes/Includes/Images/error.gif"
                            Style="display: none; vertical-align: middle" />
                    </td>
                    <td valign="top" style="height: 10px">
                        <asp:Label ID="LabelErrorMessage" runat="server" Style="vertical-align: middle" CssClass="redTextError"></asp:Label>&nbsp;
                    </td>
                </tr>
            </table>
        </td>
        <td align="right" valign="bottom" style="width: 60%;">
            <table cellpadding="1" width="50%" cellspacing="1" border="0">
                <tr>
                    <td align="left" style="width: 90px;" class="labelFont">
                        <span>Password:</span>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtPasword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td align="left">
                        <input type="button" id="ButtonSign" value="Sign" disabled="disabled" onclick="BeforeSign('Sign');"
                            class="ButtonWeb" style="width: 77px; height: 24px" runat="server" />
                    </td>
                    <td align="left"></td>
                    <td align="left">
                        <asp:Button ID="btnClose" runat="server" CssClass="ButtonWeb" EnableViewState="False"
                            Text="Close" TabIndex="3" OnClientClick="Close();return false" Width="77px"></asp:Button>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="height: 450px; vertical-align: top; width: 50%; min-width: 500px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" width="98%">
                            <tr>
                                <td align="left">
                                    <UI:Heading ID="Heading1" runat="server" HeadingText="Orders" />
                                </td>
                                <td align="right"></td>
                                <td valign="top" align="right">
                                    <input type="button" id="ButtonApproveAll" tabindex="4" class="ButtonWeb" value="Approve All Order"
                                        onclick="ApproveAllOrders();" <%=enableDisabled(Streamline.BaseLayer.Permissions.ApproveAllOrder)%> />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="0" width="98%" cellpadding="0" cellspacing="0">
                            <tr style="background-color: #dce5ea;">
                                <td colspan="2">
                                    <div id="PlaceLabel" runat="server" visible="true">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="PlaceHolder" runat="server" visible="true" style="overflow: auto; height: 530px; width: 100%;">
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
        <td style="height: 519px; width: 50%" valign="top">
            <table style="width: 100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td>
                        <UI:Heading ID="Heading2" runat="server" HeadingText="Order Details" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid; border-left: #dee7ef 3px solid; width: 100%; border-bottom: #dee7ef 3px solid"
                            cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <table cellpadding="1" cellspacing="1" border="0" width="100%">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td style="width: 30px;" align="left" class="labelFont">Patient
                                                        </td>
                                                        <td style="width: 2px;" align="left"></td>
                                                        <td align="left" nowrap="nowrap" style="width: 30px;">
                                                            <asp:Label ID="lblClientName" runat="server" CssClass="Label"></asp:Label>
                                                        </td>
                                                        <td class="labelFont" style="width: 10px;" align="left">
                                                            <span>DOB</span>
                                                        </td>
                                                        <td style="width: 2px;" align="left"></td>
                                                        <td align="left" style="width: 20px;">
                                                            <asp:Label ID="lblDob" runat="server" CssClass="Label" Style="width: 40px;"></asp:Label>
                                                        </td>
                                                        <td class="labelFont" nowrap="nowrap" align="left" style="width: 20px;">
                                                            <span>Prescribing location</span>
                                                        </td>
                                                        <td style="width: 2px;" align="left"></td>
                                                        <td nowrap="nowrap" align="left" style="width: 30px;">
                                                            <asp:Label ID="lblPrescribinglocation" runat="server" CssClass="Label" Width="50px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td style="width: 10px" align="left" nowrap="nowrap">
                                                            <input type="radio" name="radio" id="radioPrint" disabled="disabled" /><span id="spanPrint"
                                                                class="Label" disabled="disabled">Print</span>
                                                        </td>
                                                        <td style="width: 10px" align="left" nowrap="nowrap">
                                                            <input type="radio" name="radio" id="radioFax" disabled="disabled" /><span id="spanFax"
                                                                class="Label" disabled="disabled" style="width: 7px">Fax</span>
                                                        </td>
                                                        <td style="width: 20px" align="left" nowrap="nowrap">
                                                            <input type="radio" name="radio" id="radioElectronic" disabled="disabled" /><span
                                                                id="spanElectronic" class="Label" disabled="disabled">Electronic</span>
                                                        </td>
                                                        <td style="width: 2px;" align="left"></td>
                                                        <td class="labelFont" style="width: 10px" align="left" nowrap="nowrap">
                                                            <span style="width: 10px">Pharmacy</span>
                                                        </td>
                                                        <td style="width: 2px" align="left"></td>
                                                        <td nowrap="nowrap" align="left" nowrap="nowrap">
                                                            <asp:Label ID="lblPharmacy" runat="server" CssClass="Label" Width="50px"></asp:Label>
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
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td>
                                    <UI:Heading ID="Heading3" runat="server" HeadingText="Prescription" />
                                </td>
                                <td>
                                    <span id="label_readytosign">Ready To Sign</span>
                                    <input type="CheckBox" id="CheckBox_ReadyToSign" />
                                </td>
                                <td>
                                    <span id="label_OTP">OTP</span>
                                    <input type="Text" id="TextBox_OneTimePassword" />
                                </td>

                                <td align="right">
                                    <% if (Session["OpenVerbalOrder"] == "V")
                                       {%>

                                    <input type="button" id="ButtonRetractOrder" tabindex="5" class="ButtonWeb" value="Retract Your Approval" onclick="RetractOrders();" disabled="disabled" />
                                    <%} %>
                                    <% if (Session["OpenVerbalOrder"] == "A")
                                       {%>
                                    <asp:Button ID="ButtonAdjustDosageSchedule" runat="server" Text="Adjust Dosage/Schedule" TabIndex="5"
                                        OnClientClick="javascript:ButtonAdjustDosageSchedule('FromQueuedOrderScreen');return false;"
                                        CssClass="ButtonWeb" />
                                    <%} %>
                                </td>

                                <td align="center">
                                    <% if (Session["OpenVerbalOrder"] == "A")
                                       {%>
                                    <input type="button" id="ButtonCanceltOrder" tabindex="6" class="ButtonWeb" value="Void" onclick="VoidOrder();" />
                                    <%} %>
                                </td>
                                <td align="right" style="width: 17%">
                                    <input type="button" id="ButtonApproveOrder" tabindex="7" class="ButtonWeb" value="Approve Order" onclick="ApproveOrder();" />
                                </td>
                            </tr>
                        </table>
                        <table style="height: 450px; border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid; border-left: #dee7ef 3px solid; width: 100%; border-bottom: #dee7ef 3px solid"
                            cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td>
                                    <div id="divReportViewer" runat="server" style="overflow-x: scroll; overflow-y: scroll; height: 440px">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 100%">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div id="divDisclaimer">
                                                        <span id="Control_ASP.usercontrols_medicationsprescribe_ascx_ctl00_Disclaimer" style="font-size: Smaller; font-style: italic;">By completing the two-factor authentication protocol at this time, you are legally sigining the prescriptions(s) 
 and authorizing the transmission of the above information to the pharmacy for dispensing. The two-factor authentication protocol may only be completed by the practitioner whose name and DEA registration number appear above.</span>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
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
<asp:HiddenField ID="hiddenClientMedicationScriptId" runat="server" />
<asp:HiddenField ID="HiddenDrugCategory" runat="server" />
<asp:HiddenField ID="HiddenFieldSign" runat="server" />
<asp:HiddenField ID="HiddenMedicationScriptId" runat="server" />
<asp:HiddenField ID="_boolRowWithInteractionFound" runat="server" />
<input type="hidden" id="hiddenPharmacyId" />