﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RXMyPhrases.ascx.cs"
    Inherits="UserControls_RXMyPhrases" EnableViewState="false" %>
<%@ Register TagPrefix="UI" TagName="Heading" Src="~/UserControls/Heading.ascx" %>

<asp:ScriptManagerProxy runat="server" ID="SMP1">
    <Scripts>
        <asp:ScriptReference Path="~/App_Themes/Includes/JS/ClientMedicationOrder.js?rel=3_5_x_4_1" NotifyScriptLoaded="true" />
        <asp:ScriptReference Path="~/App_Themes/Includes/JS/CommonFunctions.js?rel=3_5_x_4_1" NotifyScriptLoaded="true" />
    </Scripts>
</asp:ScriptManagerProxy>


<script language="javascript" type="text/javascript">

    function pageLoad() {
        //debugger
        try {
            LabelErrorMessage = document.getElementById('<%= ClientID + ClientIDSeparator %>LabelErrorMessage');
            ImageError = document.getElementById('<%= ClientID + ClientIDSeparator %>ImageError');
            var tableErrorMessage = document.getElementById('<%=tableErrorMessage.ClientID%>');
            LabelGridErrorMessage = document.getElementById('<%= ClientID + ClientIDSeparator %>LabelGridErrorMessage');
            ImageGridError = document.getElementById('<%= ClientID + ClientIDSeparator %>ImageGridError');
            var tableGridErrorMessage = document.getElementById('<%=tableGridErrorMessage.ClientID%>');
            PanelPhrasesList = ('<%=PanelPhrasesListInformation.ClientID%>');
            ClientMedicationOrder.GetPhrasesList(PanelPhrasesList, '<%=DropDownListScreenPhraseCategory.ClientID %>');
        }
        catch (e) {
            alert(e);
        }
    }

    function Insert_Click() {
        var varValidate = Validate();
        if (varValidate == true) {
            document.getElementById('buttonInsert').value = "Insert";
        }
        return;
    }

    function DeleateFromPhraseList(KeyPhraseId) {
        //debugger
        ClientMedicationOrder.DeleateFromPhraseList(KeyPhraseId);
    }

    function Clear_Click() {
        document.getElementById('<%=CheckBoxFavorites.ClientID%>').checked = false;
        document.getElementById('RXMyPhrases_TextBoxPhraseText').value = "";

        var LabelErrorMessage = document.getElementById('<%= ClientID + ClientIDSeparator %>LabelErrorMessage');
        var ImageError = document.getElementById('<%= ClientID + ClientIDSeparator %>ImageError');
        LabelErrorMessage.innerText = '';
        ImageError.style.visibility = 'hidden';
        ImageError.style.display = 'none';
        var tableErrorMessage = document.getElementById('<%=tableErrorMessage.ClientID%>');
        tableErrorMessage.style.display = 'none';
        var LabelGridErrorMessage = document.getElementById('<%= ClientID + ClientIDSeparator %>LabelGridErrorMessage');
         var ImageGridError = document.getElementById('<%= ClientID + ClientIDSeparator %>ImageGridError');
        LabelGridErrorMessage.innerText = '';
        ImageGridError.style.visibility = 'hidden';
        ImageGridError.style.display = 'none';
        var tableGridErrorMessage = document.getElementById('<%=tableGridErrorMessage.ClientID %>');
        tableGridErrorMessage.style.display = 'none';
        ClientMedicationOrder.GetPhrasesList(PanelPhrasesList, '<%=DropDownListScreenPhraseCategory.ClientID %>');
    }

    function ModifyPhraseList(KeyPhraseId) {
        //debugger
        ClientMedicationOrder.ModifyPhraseList(KeyPhraseId, '<%=CheckBoxFavorites.ClientID%>', '<%=TextBoxPhraseText.ClientID%>', '<%=DropDownListKeyPhraseCategory.ClientID%>', '<%=HiddenKeyPhraseId.ClientID%>');
         document.getElementById('buttonInsert').value = "Modify";
     }

     function RefreshKeyPhrasesGrid()
     {
          ClientMedicationOrder.GetPhrasesList('<%=PanelPhrasesListInformation.ClientID%>', '<%=DropDownListScreenPhraseCategory.ClientID %>');
     }


    function Validate() {
        try {
            var LabelErrorMessage = document.getElementById('<%= ClientID + ClientIDSeparator %>LabelErrorMessage');
            var DivErrorMessage = document.getElementById('<%= ClientID + ClientIDSeparator %>DivErrorMessage');
            var ImageError = document.getElementById('<%= ClientID + ClientIDSeparator %>ImageError');
            var tableErrorMessage = document.getElementById('<%=tableErrorMessage.ClientID%>');
            var LabelGridErrorMessage = document.getElementById('<%= ClientID + ClientIDSeparator %>LabelGridErrorMessage');
            var DivGridErrorMessage = document.getElementById('<%= ClientID + ClientIDSeparator %>DivGridErrorMessage');
            var ImageGridError = document.getElementById('<%= ClientID + ClientIDSeparator %>ImageGridError');
            var tableGridErrorMessage = document.getElementById('<%=tableGridErrorMessage.ClientID%>');

            LabelErrorMessage.innerText = '';
            ImageError.style.visibility = 'hidden';
            ImageError.style.display = 'none';
            tableErrorMessage.style.display = 'none';
            LabelGridErrorMessage.innerText = '';
            ImageGridError.style.visibility = 'hidden';
            ImageGridError.style.display = 'none';
            tableGridErrorMessage.style.display = 'none';

            var KeyPhraseCategory = document.getElementById('<%=DropDownListKeyPhraseCategory.ClientID%>');
            var TextBoxPhraseText = document.getElementById('<%=TextBoxPhraseText.ClientID%>');

            if (document.getElementById('<%=TextBoxPhraseText.ClientID%>').value == ''){
                tableErrorMessage.style.display = 'block';
                DivErrorMessage.style.display = 'block';
                ImageError.style.display = 'block';
                ImageError.style.visibility = 'visible';
                LabelErrorMessage.innerText = 'Please enter My Phrase text.';
                return false;
            }

            if (document.getElementById('<%=CheckBoxFavorites.ClientID%>').checked == true) {
                document.getElementById('<%=HiddenFavorite.ClientID%>').value = 'Y';
            } else {
                document.getElementById('<%=HiddenFavorite.ClientID%>').value = 'N';
            }

            ClientMedicationOrder.FillKeyPhraseRow('<%= ClientID + ClientIDSeparator %>tablePhraseList', '<%= HiddenKeyPhraseId.ClientID %>', '<%= TextBoxPhraseText.ClientID %>', '<%= DropDownListKeyPhraseCategory.ClientID %>', '<%= HiddenFavorite.ClientID %>', '<%= ClientID + ClientIDSeparator %>LabelErrorMessage', '<%= ClientID + ClientIDSeparator %>DivErrorMessage', '<%= ClientID + ClientIDSeparator %>ImageError', '<%= PanelPhrasesListInformation.ClientID %>', '<%= ClientID + ClientIDSeparator %>LabelGridErrorMessage', '<%= ClientID + ClientIDSeparator %>DivGridErrorMessage', '<%= ClientID + ClientIDSeparator %>ImageGridError', '<%= tableErrorMessage.ClientID %>', '<%= tableGridErrorMessage.ClientID %>');

        } catch (Err) {
            alert("Error:" + Err.message);
        }
    }

</script>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td style="height: 6px" colspan="3"></td>
    </tr>
    <tr>
        <td colspan="9">
            <table id="tableErrorMessage" runat="server" style="display: none" border="0" cellpadding="0"
                cellspacing="0">
                <tr>
                    <td valign="bottom">
                        <asp:Image ID="ImageError" runat="server" ImageUrl="~/App_Themes/Includes/Images/error.gif"
                            Style="display: none; vertical-align: middle" />
                    </td>
                    <td valign="bottom">&nbsp;
                                        <asp:Label ID="LabelErrorMessage" runat="server" Style="vertical-align: middle" CssClass="redTextError"
                                            BackColor="#DCE5EA"></asp:Label>&nbsp;
                    </td>
                    <td valign="bottom">
                        <div id="DivErrorMessage" runat="server" style="display: none; height: 12px; width: 22px;">
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <UI:Heading ID="Heading1" runat="server" HeadingText="Phrases"></UI:Heading>
        </td>
    </tr>

    <tr>
        <td class="content_tab_bg">
            <table style="border-bottom: #dee7ef 3px solid; border-left: #dee7ef 3px solid; border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid; width: 100%;"
                cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" style="padding-top: 2%; padding-left: 1%;">
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr id="CurrentLocation" runat="server">

                                            <td nowrap="nowrap">
                                                <asp:Label ID="LabelKeyPhraseCategory" runat="server" CssClass="labelFont" Text="Category"></asp:Label>&nbsp; 
                                                    <asp:DropDownList ID="DropDownListKeyPhraseCategory" runat="server" CssClass="ddlist" Width="200px">
                                                    </asp:DropDownList>
                                            </td>


                                            <td align="left" style="padding-left: 5px">
                                                <img src="App_Themes/Includes/Images/Key.png" id="ButtonTagsKeyPhrases" name="ButtonFavoritePhrases" alt="" />
                                            </td>

                                        </tr>
                                        <tr>
                                            <td class="labelFont" style="width: 10%" valign="middle">Phrase</td>
                                            <td colspan="1" nowrap="nowrap" style="width: 5%;" valign="middle">
                                                <input id="CheckBoxFavorites" type="checkbox" runat="server" />
                                            </td>

                                            <td class="labelFont" style="width: 85%" colspan="1" valign="middle">Add to Favorites</td>

                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-top: 2%;" colspan="2">
                                    <asp:TextBox ID="TextBoxPhraseText" EnableTheming="false" runat="server" TextMode="MultiLine"
                                        MaxLength="1000" Columns="120" Rows="4" CssClass="TextboxMultiline"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="tblMain" runat="server" width="100%" border="0" cellpadding="0" cellspacing="0"
                                        style="border-bottom: #dee7ef 3px solid; border-left: #dee7ef 3px solid; border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid;">
                                        <tr>
                                            <td colspan="23">
                                                <div style="height: 30px;">
                                                    <table border="0" width="98%">

                                                        <tr>

                                                            <td align="right">
                                                                <input type="button" class="ButtonWeb" id="buttonInsert" onclick="Insert_Click()"
                                                                    value="Insert" />
                                                                <input type="button" class="ButtonWeb" id="buttonClear" onclick="Clear_Click()" value="Clear" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <table id="tableGridErrorMessage" runat="server" style="display: none" border="0"
                                        cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td valign="top">
                                                <asp:Image ID="ImageGridError" runat="server" ImageUrl="~/App_Themes/Includes/Images/error.gif"
                                                    Style="display: none; vertical-align: middle" />
                                            </td>
                                            <td valign="top">
                                                <asp:Label ID="LabelGridErrorMessage" runat="server" Style="vertical-align: middle"
                                                    CssClass="redTextError" BackColor="#DCE5EA" Height="18px"></asp:Label>
                                            </td>
                                            <td valign="top">
                                                <div id="DivGridErrorMessage" style="display: none; width: 19px;" runat="server">
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="height5"></td>
                </tr>
                <tr>
                    <td class="height5">
                        <table cellpadding="0" cellspacing="0" border="0" style="padding-top: 2%; padding-left: 1%;">
                            <tr>
                                <td nowrap="nowrap">
                                    <asp:Label ID="LabelScreenPhraseCategory" runat="server" CssClass="labelFont" Text="Category"></asp:Label>&nbsp;
                                    <asp:DropDownList ID="DropDownListScreenPhraseCategory" runat="server" CssClass="ddlist" Width="200px" onchange="RefreshKeyPhrasesGrid()">
                                    </asp:DropDownList>

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="height5"></td>
    </tr>
    <tr>

        <td>
            <table style="height: 130px; width: 100%;">
                <tr>
                    <td>
                        <UI:Heading ID="HeadingPhrasesList" runat="server" HeadingText="Phrases List" />
                        <table id="Key" cellpadding="0" cellspacing="0" style="border-bottom: #dee7ef 3px solid; border-left: #dee7ef 3px solid; border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid; height: 120px; width: 100%;">
                            <tr id="KeyPhrasePhraseList" class="HeaderTabContent">
                                <td style="width: 100%;">
                                    <div id="PhrasesListInformation" style="height: 250px; overflow: auto">
                                        <asp:Panel ID="PanelPhrasesListInformation" runat="server" BorderColor="Black"
                                            BorderStyle="None" Height="250px" Width="100%" BackColor="White">
                                        </asp:Panel>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

            </table>
        </td>
    </tr>
    <tr>

        <td style="width: 872px">

            <input id="HiddenKeyPhraseId" type="hidden" runat="server" value="0" />
            <input id="HiddenKeyPhraseCategory" type="hidden" runat="server" />
            <input id="HiddenPhraseText" type="hidden" runat="server" />
            <input id="HiddenFavorite" type="hidden" runat="server" />
            <asp:HiddenField ID="HiddenFieldInfoToolTip" runat="server" />
        </td>
    </tr>

</table>

