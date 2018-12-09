<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserManagement.ascx.cs"
    Inherits="Streamline.SmartClient.UI.UserControls_UserManagement" %>

<script language="javascript" type="text/javascript">
    function OpenUserPreferences(StaffId) {
        fnShow();
        OpenUserPreferencesWithStaffId(StaffId);
    }
    function SetStaffIdForUserPreferenceIdToNull() {
        SetStaffIdForUserPreferenceToNull();
    }
    function fnScroll(header, content) {
        $(header).scrollLeft($(content).scrollLeft());
    }

</script>

<asp:ScriptManagerProxy runat="server" ID="SMPOD">
    <Scripts>
        <asp:ScriptReference Path="~/App_Themes/Includes/JS/UserPreferences.js?rel=3_5_x_4_1" NotifyScriptLoaded="true" />
        <asp:ScriptReference Path="~/App_Themes/Includes/JS/CommonFunctions.js?rel=3_5_x_4_1" NotifyScriptLoaded="true" />
    </Scripts>
</asp:ScriptManagerProxy>
<asp:HiddenField ID="HiddenFieldAscDescGridUserManagement" runat="server" Value="ASC" />
<table id="TableTitleBar" border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td id="topborder" style="font-weight: bold; font-size: 12px; color: #950732; font-family: Microsoft Sans Serif; width: 30%">
            <asp:Label ID="Label1" runat="server" Visible="true" CssClass="TittleBarBase" Text="User Management"></asp:Label>
        </td>
        <td align="center" style="width: 30%">
            <asp:Label ID="LabelSmartCareRx" runat="server" Visible="true" CssClass="SamrtCareTittleBarBase"
                Text="SmartCareRx"></asp:Label>
        </td>
        <td style="width: 30%" align="right">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="right" style="width: 50%">
                        <asp:LinkButton ID="LinkButtonStartPage" Text="Start Page" runat="server" OnClientClick="redirectToStartPage();this.disabled=true;return false;" Style="display: none"></asp:LinkButton>
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
</table>
<table width="100%">
    <tr>
        <td>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td valign="bottom" style="width: 16px">
                        <asp:Image ID="ImageError" runat="server" ImageUrl="~/App_Themes/Includes/Images/error.gif"
                            Style="display: none; vertical-align: middle" />
                    </td>
                    <td valign="bottom" style="padding-left: 3px">
                        <asp:Label ID="LabelErrorMessage" runat="server" CssClass="redTextError" Height="18px"
                            Style="vertical-align: middle"></asp:Label>
                    </td>

                    <td valign="top" style="width: 16px">
                        <asp:Image ID="ImageSuccess" runat="server" ImageUrl="~/App_Themes/Includes/Images/Yes.png"
                            Style="display: none; vertical-align: middle" />
                    </td>
                    <td valign="bottom" style="padding-left: 3px">
                        <asp:Label ID="LabelSuccessMessage" runat="server" CssClass="greenTextSuccess" Height="18px"
                            Style="vertical-align: middle"></asp:Label>
                    </td>
                </tr>
            </table>

        </td>
    </tr>
    <tr>
        <td align="left">
            <table border="0">
                <tr>
                    <td class="Label">Password
                    </td>
                    <td style="padding-left: 5px">
                        <%--<input type="text" size="20" id="UserMangementPassword"  runat="server" />--%>
                        <asp:TextBox ID="UserMangementPassword" runat="server" CssClass="TextBox" Width="130px"
                            MaxLength="20" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="Label" style="padding-left: 25px">Enter Token #/OTP </td>
                    <td style="padding-left: 5px">
                        <%-- <input type="text" size="20" id="UserMangementOTP" runat="server" />--%>
                        <asp:TextBox ID="UserMangementOTP" runat="server" CssClass="TextBox" Width="130px"
                            MaxLength="20" type="number"></asp:TextBox>
                    </td>
                    <td style="width: 258px"></td>
                    <td>
                        <input id="UserMangementEnableEPCS" type="button" value="Enable EPCS" onclick="EnableEPCS()"
                            class="ButtonWeb" style="width: 95px; height: 24px" />
                    </td>
                    <td>
                        <input id="UserMangementDisableEPCS" type="button" value="Disable EPCS" onclick="DisableEPCS()"
                            class="ButtonWeb" style="width: 95px; height: 24px" />
                    </td>
                </tr>
            </table>
        </td>
        <td align="right">
            <input id="ButtonNewUser" type="button" value="New User" onclick="SetStaffIdForUserPreferenceIdToNull()"
                class="ButtonWeb" style="width: 79px; height: 24px" />
            <input id="ButtonClose" type="button" value="Close" onclick="redirectToStartPage()"
                class="ButtonWeb" style="width: 79px; height: 24px" />
        </td>
    </tr>
</table>
<table cellpadding="0" cellspacing="0" border="0" width="915px" style="margin-bottom: 5px;">
    <tr>
        <td>
            <input id="RadioButtonActiveUsers" runat="server" style="font-weight: normal; font-size: 8.25pt; color: black; font-family: Microsoft Sans Serif; text-align: center"
                checked="true"
                type="radio" onclick="ChangeUserActiveUsermanagementListPage();" /><a
                    style="font-weight: normal; font-size: 8.25pt; color: black; font-family: Microsoft Sans Serif; text-align: center">Active Users Only</a>
            <input id="RadioButtonAllUsers" runat="server" style="font-weight: normal; font-size: 8.25pt; color: black; font-family: Microsoft Sans Serif; text-align: center"
                type="radio"
                onclick="ChangeUserActiveUsermanagementListPage();" /><a style="font-weight: normal; font-size: 8.25pt; color: black; font-family: Microsoft Sans Serif; text-align: center">All
        Users</a>
            <input id="RadioButtonAllPrescribers" runat="server" style="font-weight: normal; font-size: 8.25pt; color: black; font-family: Microsoft Sans Serif; text-align: center"
                type="radio"
                onclick="ChangeUserActiveUsermanagementListPage();" /><a style="font-weight: normal; font-size: 8.25pt; color: black; font-family: Microsoft Sans Serif; text-align: center">
        All Prescribers</a>

            <input id="RadioButtonAllEPCSPrescribers" runat="server" style="font-weight: normal; font-size: 8.25pt; color: black; font-family: Microsoft Sans Serif; text-align: center"
                type="radio"
                onclick="ChangeUserActiveUsermanagementListPage();" /><a style="font-weight: normal; font-size: 8.25pt; color: black; font-family: Microsoft Sans Serif; text-align: center">
        All EPCS Prescribers</a>
        </td>
        <td style="text-align: right;">
            <input type="text" size="30" id="UserMangementSearchText" placeholder="Enter first and/or last name" />
            <button id="UserMangementSearchTextButton" style="margin-left: 10px;" onclick="SearchUserManagementListPage(this);return false;">Search</button>
            <button id="UserMangementResetButton" style="margin-left: 10px;" onclick="SearchUserManagementListPage(this);return false;">Reset</button>
        </td>
    </tr>
</table>
<asp:Panel ID="PanelUserManagement" Style="height: 500px;" runat="server" Width="900px">
    <!-- ###StartUserManagement### -->
    <table id="Table1" align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="left">
                <div id="DivGridContainer">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td>
                                <asp:ListView runat="server" ID="lvUserList" OnLayoutCreated="LayoutCreated">
                                    <LayoutTemplate>
                                        <table cellpadding="0" cellspacing="0" class="ListPageContainer">
                                            <tr>
                                                <td>
                                                    <asp:Panel runat="server" ID="divHeader" Style="width: 900px; margin-right: 18px;" CssClass="ListPageHeader">
                                                        <table cellpadding="0" cellspacing="0" width="900x">
                                                            <tr>
                                                                <td width="3%"></td>
                                                                <td width="15%">
                                                                    <asp:Panel runat="server" ID="StaffName" SortId="StaffName" CssClass="SortLabel">Staff Name</asp:Panel>
                                                                </td>
                                                                <td width="15%">
                                                                    <asp:Panel runat="server" ID="UserCode" SortId="UserCode" CssClass="SortLabel">User Name</asp:Panel>
                                                                </td>
                                                                <td width="10%">
                                                                    <asp:Panel runat="server" ID="Active" SortId="Active" CssClass="SortLabel">Active</asp:Panel>
                                                                </td>
                                                                <td width="12%">
                                                                    <asp:Panel runat="server" ID="Prescriber" SortId="Prescriber" CssClass="SortLabel">Prescriber</asp:Panel>
                                                                </td>
                                                                <td width="26%">
                                                                    <asp:Panel runat="server" ID="DeviceAuthenticated" SortId="DeviceAuthenticated" CssClass="SortLabel">Device Authenticated</asp:Panel>
                                                                </td>
                                                                <td width="23%">
                                                                    <asp:Panel runat="server" ID="EPCSEnabled" SortId="EPCSEnabled" CssClass="SortLabel">EPCS Enabled</asp:Panel>
                                                                </td>
                                                                <td width="23%">
                                                                    <asp:Panel runat="server" ID="EPCS" SortId="EPCS" CssClass="SortLabel">EPCS Permission</asp:Panel>
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:Panel runat="server" ID="PhoneNumber" SortId="PhoneNumber" CssClass="SortLabel">Phone Number</asp:Panel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:Panel ID="divListPageContent" runat="server" Style="width: 920px; height: 500px;"
                                                        CssClass="ListPageContent">
                                                        <table width="900px" cellspacing="0" cellpadding="0" id="UserList">
                                                            <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tr class='<%# Container.DisplayIndex % 2 == 0 ? "" : "ListPageAltRow " %>ListPageHLRow' id='<%# "UserListRow_" + Eval("StaffId") %>'>
                                            <td width="4%">
                                                <%--<input type="checkbox" runat="server" id="KeyID_KeyId" keyid='<%#Eval("StaffId")%>' disabled='<%# Eval("Permission").ToString() == "N" ? true : false %>' onclick='<%# "javascript:CheckSelectedItem(this.id)"%>' />--%>
                                                <input type="checkbox" runat="server" id="KeyID_KeyId" keyid='<%#Eval("StaffId")%>' disabled='<%# Eval("EPCSPermission").ToString() == "N" ? true : false %>'/>
                                                <input type="hidden" id="hidden_KeyID_KeyId" value='<%#Eval("StaffId")%>' />
                                            </td>
                                            <td width="15%">
                                                <%# "<div class=\"ellipsis\" Title=\"" + Eval("StaffName") + "\" onclick=\"OpenUserPreferences("+ Eval("StaffId") + ");\"><u>" + Eval("StaffName") + "</u></div>"%>
                                            </td>
                                            <td width="15%">
                                                <%# "<div class=\"ellipsis\" Title=\"" + Eval("UserCode") + "\">" + Eval("UserCode") + "</div>"%>
                                            </td>
                                            <td width="10%">
                                                <%# "<div class=\"ellipsis\" Title=\"" + Eval("Active") + "\">" + Eval("Active") + "</div>"%>
                                            </td>
                                            <td width="12%">
                                                <%# "<div class=\"ellipsis\" Title=\"" + Eval("Prescriber") + "\">" + Eval("Prescriber") + "</div>"%>
                                            </td>
                                            
                                            <td width="26%">
                                                <%# "<div class=\"ellipsis\" Title=\"" + Eval("DeviceAuthenticated") + "\">" + Eval("DeviceAuthenticated") + "</div>"%>
                                            </td>
                                             <td width="23%">
                                                <%# "<div class=\"ellipsis\" Title=\"" + Eval("EPCSEnabled") + "\">" + Eval("EPCSEnabled") + "</div>"%>
                                            </td>
                                            <td width="23%">
                                                <%# "<div class=\"ellipsis\" Title=\"" + Eval("EPCS") + "\">" + Eval("EPCS") + "</div>"%>
                                            </td>
                                            <td width="20%">
                                                <%# "<div class=\"ellipsis\" Title=\"" + Eval("PhoneNumber") + "\">" + Eval("PhoneNumber") + "</div>"%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                                        <tr>
                                            <td colspan="5" style="text-align: center; color: red;">No Staff Records Found</td>
                                        </tr>
                                    </EmptyDataTemplate>
                                </asp:ListView>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <!-- ###EndUserManagement### -->
</asp:Panel>
<script type="text/javascript">
    $("#UserMangementSearchText").keydown(function (event) {
        if (event.keyCode == 13) {
            $("#UserMangementSearchTextButton").click();
            return false;
        }
    });
</script>
