<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserPreferences.ascx.cs"
    Inherits="Streamline.SmartClient.UI.UserControls_UserPreferences" %>
<%@ Register TagPrefix="UI" TagName="Heading" Src="~/UserControls/Heading.ascx" %>
<style type="text/css">
    .auto-style1
    {
        height: 26px;
    }

    .auto-style2
    {
        width: 5px;
        height: 26px;
    }
</style>
<asp:ScriptManagerProxy runat="server" ID="SMP1">
    <Scripts>
        <asp:ScriptReference Path="~/App_Themes/Includes/JS/UserPreferences.js?rel=3_5_x_4_1" NotifyScriptLoaded="true" />
    </Scripts>

</asp:ScriptManagerProxy>

<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        //When page loads...
        if ($("[id$=HiddenPageName]").val() == 'ClientList') {
            $("#DivHolderMain")[0].style.height = "700px";
            $("#PlaceHolderMain")[0].style.height = "570px";
        }
    });
    function pageLoad() {
        try {
            if (typeof RegisterPermissionsListControlEvents === 'function')
                RegisterPermissionsListControlEvents();
        }
        catch (ex) {
            Streamline.SmartClient.ExceptionManager.getInstance().publishException(ERROR_CODE_REGULAR, ex);
        }
    }

</script>

<script language="javascript" type="text/javascript">

    function Validate(activeTextBox, errorMessage) {
        try {
            var LabelErrorMessage = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>LabelErrorMessage');
            var DivErrorMessage = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>DivErrorMessage');
            var ImageError = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>ImageError');
            //Code to clear Error Messages.
            LabelErrorMessage.innerText = '';
            ImageError.style.visibility = 'hidden';
            ImageError.style.display = 'none';

            var RegExPattern = /^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/;
            if ((document.getElementById(activeTextBox.id).value.match(RegExPattern)) || (document.getElementById(activeTextBox.id).value == '')) {
                return true;
            }
            else {
                DivErrorMessage.style.display = 'block';
                ImageError.style.display = 'block';
                ImageError.style.visibility = 'visible';
                LabelErrorMessage.innerText = errorMessage;
                document.getElementById(activeTextBox.id).value = "";
                return false;
            }

        }
        catch (err) {
            return false;
        }
    }
    function ValidateFirstName() {
        try {
            var LabelErrorMessage = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>LabelErrorMessage');
            var DivErrorMessage = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>DivErrorMessage');
            var ImageError = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>ImageError');
            //Code to clear Error Messages.
            LabelErrorMessage.innerText = '';
            ImageError.style.visibility = 'hidden';
            ImageError.style.display = 'none';
            //var RegExPattern = /^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/;  
            //var RegExPattern = "^[A-Z][a-zA-Z]*$";               
            var RegExPattern = "^[a-zA-Z][a-zA-Z0-9]*[ \t]*[a-zA-Z][a-zA-Z0-9]*$";
            if ((document.getElementById('<%=TextBoxFirstName.ClientID%>').value.match(RegExPattern)) || (document.getElementById('<%=TextBoxFirstName.ClientID%>').value == '')) {
                return true;
            }
            else {
                DivErrorMessage.style.display = 'block';
                ImageError.style.display = 'block';
                ImageError.style.visibility = 'visible';
                LabelErrorMessage.innerText = 'Please enter valid first name.';
                document.getElementById('<%=TextBoxFirstName.ClientID%>').value = "";
                return false;
            }

        }
        catch (err) {
            return false;
        }
    }

    function ValidateUserName() {
        try {
            var LabelErrorMessage = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>LabelErrorMessage');
            var DivErrorMessage = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>DivErrorMessage');
            var ImageError = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>ImageError');
            //Code to clear Error Messages.
            LabelErrorMessage.innerText = '';
            ImageError.style.visibility = 'hidden';
            ImageError.style.display = 'none';
            //var RegExPattern = /^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/;  
            //var RegExPattern = "^[A-Z][a-zA-Z]*$";               
            var RegExPattern = "^[a-zA-Z][a-zA-Z0-9]*[ \t]*[a-zA-Z][a-zA-Z0-9]*$";
            if ((document.getElementById('<%=TextBoxFirstName.ClientID%>').value.match(RegExPattern)) || (document.getElementById('<%=TextBoxFirstName.ClientID%>').value == '')) {
                return true;
            }
            else {
                DivErrorMessage.style.display = 'block';
                ImageError.style.display = 'block';
                ImageError.style.visibility = 'visible';
                LabelErrorMessage.innerText = 'Please enter valid device user name.';
                document.getElementById('<%=TextBoxFirstName.ClientID%>').value = "";
                return false;
            }

        }
        catch (err) {
            return false;
        }
    }


    function Updatemessagestatus(msg) {
        try {
            //debugger;
            if (msg == "OTP") {
                $('[id$=ImageSuccess]')[0].style.display = 'none';
                $('[id$=LabelSuccessMessage]')[0].innerText = '';
                $('[id$=Devicesuccessimage]')[0].style.display = 'none';
                $('[id$=ImageError]')[0].style.display = 'block';
                $('[id$=LabelErrorMessage]')[0].innerText = "One Time Password provided is incorrect";
            }
            else if (msg == "DEA") {
                $('[id$=ImageSuccess]')[0].style.display = 'none';
                $('[id$=LabelSuccessMessage]')[0].innerText = '';
                $('[id$=ImageError]')[0].style.display = 'block';
             //   $('[id$=Devicesuccessimage]')[0].style.display = 'none';
                $('[id$=LabelErrorMessage]')[0].innerText = "DEA Number is required ";
            }
            else if (msg == "Success") {
                $('[id$=ImageSuccess]')[0].style.display = 'block';
                $('[id$=LabelSuccessMessage]')[0].innerText = 'Updated Successfully';
                $('[id$=ImageError]')[0].style.display = 'none';
                $('[id$=LabelErrorMessage]')[0].innerText = '';
                $('[id$=Devicesuccessimage]')[0].style.display = 'block';

            }

        }
        catch (err) {
            return false;
        }
    }


    function ValidateLastName() {
        try {
            var LabelErrorMessage = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>LabelErrorMessage');
            var DivErrorMessage = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>DivErrorMessage');
            var ImageError = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>ImageError');
            //Code to clear Error Messages.
            LabelErrorMessage.innerText = '';
            ImageError.style.visibility = 'hidden';
            ImageError.style.display = 'none';
            //var RegExPattern = /^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/;  
            //var RegExPattern = "^[A-Z][a-zA-Z]*$";               
            var RegExPattern = "^[a-zA-Z][a-zA-Z0-9]*[ \t]*[a-zA-Z][a-zA-Z0-9]*$";
            if ((document.getElementById('<%=TextBoxLastName.ClientID%>').value.match(RegExPattern)) || (document.getElementById('<%=TextBoxLastName.ClientID%>').value == '')) {
                return true;
            }
            else {
                DivErrorMessage.style.display = 'block';
                ImageError.style.display = 'block';
                ImageError.style.visibility = 'visible';
                LabelErrorMessage.innerText = 'Please enter valid last name.';
                document.getElementById('<%=TextBoxLastName.ClientID%>').value = "";
                return false;
            }

        }
        catch (err) {
            return false;
        }
    }

    function ValidateOTP(strErrorMessage) {
        try {
            var LabelErrorMessage = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>LabelErrorMessage');
            var DivErrorMessage = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>DivErrorMessage');
            var ImageError = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>ImageError');

            DivErrorMessage.style.display = 'block';
            ImageError.style.display = 'block';
            ImageError.style.visibility = 'visible';
            LabelErrorMessage.innerText = strErrorMessage;
            $("[id$=TextBoxOTP]").val('');
            PasswordInput();
            return false;

        }
        catch (err) {
            return false;
        }
    }

    function doKeyPress() {
        if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode == 8)) {
            event.returnValue = true;
        }
        else {
            event.returnValue = false;
        }
    }

    function BeforeUpdate() {
        try {
            fnShow();
            var TextBoxPassword = document.getElementById('<%=TextBoxPassword.ClientID%>') || '';
            var TextBoxConfirmPassword = document.getElementById('<%=TextBoxConfirmPassword.ClientID%>') || '';
            var AuthenticationType = document.getElementById('<%=HiddenAuthenticationType.ClientID%>') || '';
            var LabelErrorMessage = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>LabelErrorMessage');
            var DivErrorMessage = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>DivErrorMessage');
            var ImageError = document.getElementById('<%=this.ClientID+this.ClientIDSeparator%>ImageError');
            //Code to clear Error Messages.
            LabelErrorMessage.innerText = '';
            ImageError.style.visibility = 'hidden';
            ImageError.style.display = 'none';
            if (document.getElementById('<%=TextBoxFirstName.ClientID%>').value == '') {
                DivErrorMessage.style.display = 'block';
                ImageError.style.display = 'block';
                ImageError.style.visibility = 'visible';
                LabelErrorMessage.innerText = 'Please enter First Name.';
                return false;
            }
            if (document.getElementById('<%=TextBoxLastName.ClientID%>').value == '') {
                DivErrorMessage.style.display = 'block';
                ImageError.style.display = 'block';
                ImageError.style.visibility = 'visible';
                LabelErrorMessage.innerText = 'Please enter Last Name.';
                return false;
            }
            if (document.getElementById('<%=TextBoxUserName.ClientID%>').value == '') {
                DivErrorMessage.style.display = 'block';
                ImageError.style.display = 'block';
                ImageError.style.visibility = 'visible';
                LabelErrorMessage.innerText = 'Please enter User Name.';
                return false;
            }
            if (($("[id$=TextBoxPassword]").val() == '' || $("[id$=TextBoxPassword]").val() == '**********') && AuthenticationType.value != "A") {
                DivErrorMessage.style.display = 'block';
                ImageError.style.display = 'block';
                ImageError.style.visibility = 'visible';
                LabelErrorMessage.innerText = 'Please enter Password.';
                return false;
            }
            if ((TextBoxConfirmPassword.value == '' || TextBoxConfirmPassword.value == '**********') && AuthenticationType.value != "A") {
                DivErrorMessage.style.display = 'block';
                ImageError.style.display = 'block';
                ImageError.style.visibility = 'visible';
                LabelErrorMessage.innerText = 'Please enter Confirm Password.';
                return false;
            }
            if (TextBoxPassword.value != TextBoxConfirmPassword.value) {
                document.getElementById('<%=TextBoxPassword.ClientID%>').focus();
                DivErrorMessage.style.display = 'block';
                ImageError.style.display = 'block';
                ImageError.style.visibility = 'visible';
                LabelErrorMessage.innerText = 'Confirm Password does not match Password.';
                return false;
            }
            if ($("[id$=TextBoxOTP]").val() != '') {
                if ($("[id$=TextBoxDeviceName]").val() == '') {
                    DivErrorMessage.style.display = 'block';
                    ImageError.style.display = 'block';
                    ImageError.style.visibility = 'visible';
                    LabelErrorMessage.innerText = 'Please enter Device Name.';
                    return false;
                }
                if ($("[id$=TextBoxDevicePassword]").val() == '' || $("[id$=TextBoxDevicePassword]").val() == '**********') {
                    DivErrorMessage.style.display = 'block';
                    ImageError.style.display = 'block';
                    ImageError.style.visibility = 'visible';
                    LabelErrorMessage.innerText = 'Please enter Device Password.';
                    return false;
                }

            }
            if (document.getElementById('<%=HiddenSecurityQuestions.ClientID%>').value > 0) {
                if (CheckAnswerExists('<%=this.ClientID+this.ClientIDSeparator%>tableSecrityQuestions') == false) {
                    DivErrorMessage.style.display = 'block';
                    ImageError.style.display = 'block';
                    ImageError.style.visibility = 'visible';
                    LabelErrorMessage.innerText = 'Please enter Security Answer for selected Questions.';
                    return false;
                }
                //Code added by Loveena in ref to Task#2595 to enter unique answers
                if (CheckSecurityAnswerExists('<%=this.ClientID+this.ClientIDSeparator%>tableSecrityQuestions') == false) {
                    DivErrorMessage.style.display = 'block';
                    ImageError.style.display = 'block';
                    ImageError.style.visibility = 'visible';
                    LabelErrorMessage.innerText = 'Enter different Security Answers.';
                    return false;
                }
                FillSecurityQuestions();
                CheckUserAlreadyExists();
            }
            else {
                CheckUserAlreadyExists();
            }
        }
        catch (err) {

        }
    }

    function CheckUserAlreadyExists() {

        try {
            CheckUserNameExists(document.getElementById('<%=TextBoxUserName.ClientID%>').value);
        }
        catch (ex) {
        }
    }
    function DeleteMessage() {
        try {
            if (confirm('Are you sure to Delete this User') == true) {
                return true;
            }
            else {
                return false;
            }
        }
        catch (err) {
            return false;
        }
    }

    function GetFormatedPhoneNumber() {
        try {
            var PhoneNumberValue = document.getElementById('<%=TextBoxPhone.ClientID %>').value;
            GetUnformatedFormatedPhone(PhoneNumberValue, '<%=TextBoxPhone.ClientID %>');

        }
        catch (err) {
        }
    }
    function GetFormatedFaxNumber() {
        try {
            var FaxNumberValue = document.getElementById('<%=TextBoxFaxNumber.ClientID %>').value;
            GetUnformatedFormatedPhone(FaxNumberValue, '<%=TextBoxFaxNumber.ClientID %>');
        }
        catch (err) {
        }
    }
    function PasswordInput() {
        try {
            //Modfied in ref to Task#2655
            document.getElementById('<%=TextBoxPassword.ClientID%>').value = document.getElementById('<%=HiddenPassword.ClientID%>').value;
            document.getElementById('<%=TextBoxConfirmPassword.ClientID%>').value = document.getElementById('<%=HiddenPassword.ClientID%>').value;
            $("[id$=TextBoxDevicePassword]").val($("[id$=HiddenDevicePassword]").val());
        }
        catch (err) {
        }
    }

    //Added in ref to Task#2655
    function PasswordInputString() {
        try {
            document.getElementById('<%=TextBoxPassword.ClientID%>').value = "**********";
            document.getElementById('<%=TextBoxConfirmPassword.ClientID%>').value = "**********";
        }
        catch (err) {
        }
    }

    function SecurityAnswersInput(count) {
        try {
            for (var loopCount = 0; loopCount < count; loopCount++) {
                //Modified in ref to Task#2655
                document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxSecurityAnswer' + loopCount).value = "**********";
            }
        }
        catch (ex) {
        }
    }
    //Added in ref to Task#2655.
    function RemovePassword(index) {
        try {

            document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxSecurityAnswer' + index).value = "";
        }
        catch (ex) {
        }
    }
    //Added in ref to Task#2655
    function AddPassword(index) {
        try {
            if (document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxSecurityAnswer' + index).value == "")
                document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxSecurityAnswer' + index).value = "**********";
            else if (document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxSecurityAnswer' + index).value != "**********") {
                document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxSecurityAnswer' + index).value = document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxSecurityAnswer' + index).value;
                document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_hiddenStaffSecurityAnswerId' + index).value = document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxSecurityAnswer' + index).value;
            }
        }
        catch (ex) {
        }
    }

    //Added in ref to Task#2655
    function AddUserPassword() {
        try {
            if (document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxPassword').value == "")
                document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxPassword').value = "**********";
            else if (document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxPassword').value != "**********") {
                document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxPassword').value = document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxPassword').value;
                document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_HiddenPassword').value = document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxPassword').value;
            }
        }
        catch (ex) {
        }
    }

    //Added in ref to Task#2655.
    function RemoveUserPassword() {
        try {
            document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxPassword').value = "";
        }
        catch (ex) {
        }
    }

    //Added in ref to Task#2655
    function AddConfirmPassword() {
        try {
            if (document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxConfirmPassword').value == "")
                document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxConfirmPassword').value = "**********";
            else if (document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxConfirmPassword').value != "**********") {
                document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxConfirmPassword').value = document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxConfirmPassword').value;
                document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_HiddenConfirmPassword').value = document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxConfirmPassword').value;
            }
        }
        catch (ex) {
        }
    }

    //Added in ref to Task#2655.
    function RemoveConfirmPassword() {
        try {

            document.getElementById('Control_ASP.usercontrols_userpreferences_ascx_TextBoxConfirmPassword').value = "";
        }
        catch (ex) {
        }
    }

    function OpenStartPage() {
        //Made changes  by Pradeep as per task#3056 Start Over here
        var SessionVar = document.getElementById("HiddenFieldRedirect").value;
        if (SessionVar == "Y") {
            document.getElementById("HiddenFieldRedirect").value = "";
            redirectToUserManagementPage();
        }
        else {
            document.getElementById("HiddenFieldRedirect").value = "";
            redirectToStartPage();
        }
        //Made changes Written by Pradeep as per task#3056 End Over here
    }

    function OpenPermissionsList() {
        fnShowParda(350, 55);
        ShowUserPermissionsDiv();
    }
    function fnShowParda(progMsgLeft, progMsgTop) {
        var objParda = document.getElementById("Parda");
        var objdvProgress = document.getElementById("dvProgress");
        objParda.style.width = document.body.offsetWidth - 2;
        objParda.style.height = document.body.offsetHeight - 20;
        objParda.style.display = '';

    }
    function fnHideParda() {
        var objParda = document.getElementById("Parda"); //alert(objParda.id);
        objParda.style.display = 'none';
    }
    function onDeleteClick(sender, e) {
        try {
            //document.getElementById('<%=HiddenDeleteStaffPermissionId.ClientID%>').value=e.StaffPermissionId;
            Delete_Permission(e);
        }
        catch (err) {
        }
    }
    function EnableDisableDropDownList() {
        try {
            var DropDownListPasswordExpires = document.getElementById('<%=DropDownListPasswordExpires.ClientID%>');
            if (document.getElementById('<%=CheckBoxPasswordExpires.ClientID%>').checked == true) {
                document.getElementById('<%=HiddenPasswordExpires.ClientID%>').value = $get('<%=DropDownListPasswordExpires.ClientID %>').selectedIndex;
                document.getElementById('<%=HiddenPasswordExpiresSelectedValue.ClientID%>').value = document.getElementById('<%=DropDownListPasswordExpires.ClientID %>').value;
                DropDownListPasswordExpires.disabled = true;

            }
            if (document.getElementById('<%=CheckBoxPasswordExpires.ClientID%>').checked == false) {
                document.getElementById('<%=HiddenPasswordExpires.ClientID%>').value = ""
                document.getElementById('<%=HiddenPasswordExpiresSelectedValue.ClientID%>').value = ""
                DropDownListPasswordExpires.disabled = false;
            }
        }
        catch (err) {
        }
    }

    function RefreshParentWindow() {
        try {
            GetPermissionsList('<%=PanelPermissionsList.ClientID%>', '<%=HiddenStaffPermissionId.ClientID%>');
        }
        catch (e) {
        }
    }

    function FillSecurityQuestions() {
        FillSecurityQuestion('<%=this.ClientID+this.ClientIDSeparator%>tableSecrityQuestions');
    }

    function DisableRegisterButton() {
        var _buttonRegister = document.getElementById('<%=ButtonRegister.ClientID %>');
        if (_buttonRegister) _buttonRegister.disabled = true;
    }
</script>

<a id="anchorId" runat="server" onclick="return true" onserverclick="PermissionsList"></a><a id="anchorUpdate" runat="server" onclick="return true" onserverclick="ButtonUpdate_Click"></a>
<input type="hidden" id="HiddenDeleteStaffPermissionId" runat="server" />
<div id="Parda" style="display: none; position: absolute; top: 0; left: 0; width: 300px; background-color: #ffffff; border: 1px solid #cccc99; filter: Alpha(Opacity=0)">
</div>
<div id="dvProgress" style="display: none; right: inherit; position: absolute; top: 47px; left: 0; width: 224px"
    class="progress">
    <font size="Medium" color="#1c5b94"><b><i>Communicating with Server...</i></b></font>
    <img src="App_Themes/Includes/Images/Progress.gif" title="Progress" />
</div>
<div>
    <table id="TableMain" border="0" cellpadding="0" cellspacing="0" width="100%" style="height: 550px">
        <tr>
            <td style="height: 38px">
                <table id="TableTitle" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td style="width: 30%">
                            <asp:Label ID="Label1" runat="server" Visible="true" CssClass="TittleBarBase" Text="User Preferences"></asp:Label>
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
                        <td colspan="3" style="height: 1pt; border-bottom: #5b0000 1px solid;"></td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 98%" colspan="3">
                            <asp:Button ID="ButtonDefault" runat="server" Text="Default" Width="0px" OnClientClick="return false;"
                                TabIndex="0" Visible="false" />
                            <asp:Button ID="ButtonDelete" runat="server" Text="Delete" CssClass="ButtonWeb" OnClick="ButtonDelete_Click"
                                OnClientClick="return DeleteMessage();" Width="79px" TabIndex="30" />
                            <input type="button" id="ButtonUpdate" value="Update" tabindex="31" class="ButtonWeb"
                                style="width: 79px; height: 24px;" onclick="BeforeUpdate(); return false;"
                                runat="server" />
                            <asp:Button ID="ButtonClose" runat="server" Text="Close" CssClass="ButtonWeb" Width="79px"
                                OnClientClick="OpenStartPage();return false;" TabIndex="32" />
                        </td>
                    </tr>
                </table>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="bottom">
                            <asp:Image ID="ImageError" runat="server" ImageUrl="~/App_Themes/Includes/Images/error.gif"
                                Style="display: none; vertical-align: middle" />
                        </td>
                        <td valign="bottom">&nbsp;
                            <asp:Label ID="LabelErrorMessage" runat="server" CssClass="redTextError" Height="18px"
                                Style="vertical-align: middle"></asp:Label>
                        </td>
                        <td valign="bottom">
                            <div id="DivErrorMessage" runat="server" style="display: none; width: 22px; height: 12px">
                            </div>
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
            <td valign="top" style="height: 50px;">
                <asp:Panel runat="server" Width="100%" ID="TableGeneral">
                    <table border="0" cellpadding="0" cellspacing="0" width="98%" style="border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid; border-left: #dee7ef 3px solid; border-bottom: #dee7ef 3px solid;">
                        <tr style="vertical-align: top">
                            <td valign="top" nowrap="nowrap" style="width: 290px">
                                <table id="Table1" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <UI:Heading ID="Heading1" runat="server" HeadingText="General" />
                                        </td>
                                        <td></td>
                                        <td>
                                            <asp:CheckBoxList ID="CheckBoxListActive" runat="server" RepeatDirection="Horizontal"
                                                Style="font-weight: normal; font-size: 8.25pt; color: black; font-family: Microsoft Sans Serif; text-align: center"
                                                Width="50px" TabIndex="0">
                                                <asp:ListItem Text="Active" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Prescriber" Value="1" Enabled="false"></asp:ListItem>

                                            </asp:CheckBoxList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="labelFont" style="height: 19px">
                                            <asp:Label ID="LabelFirstName" class="Label" runat="server" Text="First Name"></asp:Label>
                                        </td>
                                        <td style="width: 10px; height: 19px;"></td>
                                        <td style="height: 19px">
                                            <asp:TextBox ID="TextBoxFirstName" runat="server" CssClass="TextBox" Width="170px"
                                                MaxLength="30" TabIndex="1"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="labelFont">
                                            <asp:Label ID="LabelLastName" class="Label" runat="server" Text="Last Name"></asp:Label>
                                        </td>
                                        <td style="width: 10px"></td>
                                        <td>
                                            <asp:TextBox ID="TextBoxLastName" runat="server" CssClass="TextBox" Width="170px"
                                                MaxLength="30" TabIndex="2"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="labelFont">
                                            <asp:Label ID="LabelPhone" class="Label" runat="server" Text="Phone Number"></asp:Label>
                                        </td>
                                        <td style="width: 10px"></td>
                                        <td>
                                            <asp:TextBox ID="TextBoxPhone" runat="server" CssClass="TextBox" Width="170px" TabIndex="3"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="labelFont">Fax Number
                                        </td>
                                        <td style="width: 10px">&nbsp;
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxFaxNumber" CssClass="Textbox" Width="170px" runat="server" TabIndex="4"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="labelFont">
                                            <asp:Label ID="LabelEmail" runat="server" class="Label" Text="Email"></asp:Label>
                                        </td>
                                        <td style="width: 10px"></td>
                                        <td>
                                            <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="TextBox" TabIndex="5" Width="170px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <%--Anuj--%>
                                        <td class="labelFont">
                                            <asp:Label ID="LabelUserName" class="Label" runat="server" Text="User Name"></asp:Label>
                                        </td>
                                        <td style="width: 10px"></td>
                                        <td style="width: 171px">
                                            <asp:TextBox ID="TextBoxUserName" runat="server" CssClass="TextBox" Width="170px"
                                                MaxLength="30" TabIndex="6"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td valign="top" class="labelFont">
                                            <asp:Label ID="LabelAddress" class="Label" runat="server" Text="Address"></asp:Label>
                                        </td>
                                        <td style="width: 10px"></td>
                                        <td>
                                            <asp:TextBox ID="TextBoxAddress" runat="server" EnableTheming="false" Font-Names="Microsoft Sans Serif"
                                                Font-Size="8.50pt" Width="170px" TextMode="MultiLine" Height="50px" TabIndex="7"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="labelFont" valign="top">
                                            <asp:Label ID="LabelDateCreated" class="Label" runat="server" Text="Date Created"></asp:Label>
                                        </td>
                                        <td style="width: 10px"></td>
                                        <td>
                                            <asp:Label ID="LabelDate" class="Label" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px"></td>
                                    </tr>
                                    <tr>
                                        <td class="labelFont" valign="top">
                                            <asp:Label ID="LabelLastVisit" class="Label" runat="server" Text="Last Visit"></asp:Label>
                                        </td>
                                        <td style="width: 10px"></td>
                                        <td>
                                            <asp:Label ID="LabelVisit" class="Label" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                <%-- Start By Pradeep as per task#23--%>
                                <table cellpadding="0" cellspacing="0" width="100%" border="0">
                                    <tr>
                                        <td colspan="3" style="height: 2px"></td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 245px">
                                            <table id="TableProfessional" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <UI:Heading ID="Heading2" runat="server" HeadingText="Professional" />
                                                    </td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td class="labelFont">
                                                        <asp:Label ID="LabelDegree" class="Label" runat="server" Text="Degree"></asp:Label>
                                                    </td>
                                                    <td style="width: 10px"></td>
                                                    <td>
                                                        <asp:DropDownList ID="DropDownListDegree" runat="server" Width="130px" TabIndex="8">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="labelFont">
                                                        <asp:Label ID="LabelSigning" class="Label" runat="server" Text="Signing Suffix"></asp:Label>
                                                    </td>
                                                    <td style="width: 10px"></td>
                                                    <td>
                                                        <asp:TextBox ID="TextBoxSigning" runat="server" CssClass="TextBox" Width="130px"
                                                            MaxLength="32" TabIndex="9"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="labelFont">
                                                        <asp:Label ID="LabelLicense" class="Label" runat="server" Text="License #"></asp:Label>
                                                    </td>
                                                    <td style="width: 10px"></td>
                                                    <td>
                                                        <asp:TextBox ID="TextBoxLicense" runat="server" CssClass="TextBox" Width="130px"
                                                            MaxLength="25" TabIndex="10" Enabled="false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="labelFont">
                                                        <asp:Label ID="LabelDEA" class="Label" runat="server" Text="DEA Number"></asp:Label>
                                                    </td>
                                                    <td style="width: 10px"></td>
                                                    <td>
                                                        <asp:TextBox ID="TextBoxDEA" runat="server" CssClass="TextBox" Width="130px" MaxLength="30"
                                                            TabIndex="11" Enabled="false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="labelFont">
                                                        <asp:Label ID="LabelNPI" class="Label" runat="server" Text="NPI"></asp:Label>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <asp:TextBox ID="TextBoxNPI" runat="server" CssClass="TextBox" Width="130px" MaxLength="10"
                                                            TabIndex="12" Enabled="false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="labelFont">
                                                        <asp:Label ID="LabelNADEA" class="Label" runat="server" Text="NA DEA"></asp:Label>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <asp:TextBox ID="TextBoxNADEA" runat="server" CssClass="TextBox" Width="130px" MaxLength="10"
                                                            TabIndex="12" Enabled="false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="width: 5px"></td>
                                        <td valign="top" align="left">
                                            <table id="TableSureScripts" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td>
                                                        <UI:Heading ID="Heading6" runat="server" HeadingText="SureScripts" />
                                                    </td>
                                                    <td style="width: 5px"></td>
                                                    <td align="left"></td>
                                                </tr>
                                                <tr>
                                                    <td class="labelFont" style="width: 95px">
                                                        <asp:Label ID="LabelActiveStartTime" class="Label" runat="server" Text="Active Start Time"></asp:Label>
                                                    </td>
                                                    <td style="width: 5px" align="left"></td>
                                                    <td align="left">
                                                        <asp:TextBox ID="TextBoxActiveStartTime" runat="server" CssClass="TextBox" Width="107px"
                                                            TabIndex="13" onchange="DisableRegisterButton()"></asp:TextBox>&nbsp;<img id="Img2" src="App_Themes/Includes/Images/calender_White.jpg" onclick="CalShow( this, '<%=TextBoxActiveStartTime.ClientID%>')"
                                                                onmouseover="CalShow( this, '<%=TextBoxActiveStartTime.ClientID%>')" alt="" align="middle" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style1" align="left">
                                                        <asp:Label ID="LabelActiveEndTime" class="Label" runat="server" Text="Active End Time"></asp:Label>
                                                    </td>
                                                    <td align="left" class="auto-style2"></td>
                                                    <td align="left" class="auto-style1">
                                                        <asp:TextBox ID="TextBoxActiveEndTime" runat="server" CssClass="TextBox" Width="107px"
                                                            TabIndex="14" onchange="DisableRegisterButton()"></asp:TextBox>&nbsp;<img id="Img1" src="App_Themes/Includes/Images/calender_White.jpg" onclick="CalShow( this, '<%=TextBoxActiveEndTime.ClientID%>')"
                                                                onmouseover="CalShow( this, '<%=TextBoxActiveEndTime.ClientID%>')" alt="" align="middle" />
                                                    </td>
                                                </tr>
                                                <tr valign="top">
                                                    <td class="labelFont" align="left" valign="top">
                                                        <asp:Label ID="LabelServiceLevel" class="Label" runat="server" Text="Service Level"></asp:Label>
                                                    </td>
                                                    <td style="width: 5px" align="left" valign="top"></td>
                                                    <td align="left" valign="top">
                                                        <asp:DropDownList ID="DropDownListServiceLevel" runat="server" Width="135px"
                                                            Style="vertical-align: top" TabIndex="15" onchange="DisableRegisterButton()">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="labelFont" align="left">
                                                        <asp:Label ID="LabelSureScriptsPrescriberId" class="Label" runat="server" Text="Prescriber Id (SPI)"></asp:Label>
                                                    </td>
                                                    <td align="left"></td>
                                                    <td align="left">
                                                        <asp:TextBox ID="TextBoxSureScriptsPrescriberId" ReadOnly="true" runat="server" CssClass="TextBox"
                                                            Width="130px" MaxLength="10" TabIndex="16"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left"></td>
                                                    <td align="left"></td>
                                                    <td align="right">
                                                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                            <tr>
                                                                <td align="right" style="width: 135px">
                                                                    <input type="button" id="ButtonRegister" runat="server" value="Register" class="ButtonWeb" disabled="disabled" tabindex="17" />
                                                                </td>
                                                                <td></td>
                                                            </tr>
                                                        </table>

                                                    </td>
                                                </tr>

                                            </table>
                                            <span id="LabelRegisterSpan" class="Label">
                                                <asp:Label runat="server" ID="LabelRegister" CssClass="Label" Visible="False">SureScripts will be updated when the staff record is updated</asp:Label>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="height: 2px"></td>
                                    </tr>
                                    <tr>
                                        <td valign="top" colspan="3">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" id="tableLocation"
                                                runat="server">
                                                <tr>
                                                    <td style="width: 85px" align="left">
                                                        <UI:Heading ID="Heading7" runat="server" HeadingText="Locations" />
                                                    </td>
                                                    <td style="width: 404px" align="right">
                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td style="height: 2px" align="right">
                                                                    <asp:Image ID="ImageRegisterError" runat="server" ImageUrl="~/App_Themes/Includes/Images/error.gif"
                                                                        Style="display: none; vertical-align: middle" />
                                                                </td>
                                                                <td align="right">
                                                                    <asp:Label ID="LabelRegisterError" runat="server" CssClass="redTextError" Height="18px"
                                                                        Style="vertical-align: middle; display: none;"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" style="width: 118px"></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid; border-left: #dee7ef 3px solid; border-bottom: #dee7ef 3px solid;">
                                                            <tr>
                                                                <td>
                                                                    <div style="height: 80px;">
                                                                        <asp:Panel ID="PanelUserLocationList" runat="server" Style="overflow-y: auto; overflow-x: hidden;"
                                                                            BorderStyle="None" Height="80px" Width="100%">
                                                                        </asp:Panel>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                    </table>
                </asp:Panel>
                <%-- Start By Pradeep as per task#?--%>
            </td>
        </tr>

        <tr>
            <td style="height: 10px"></td>
        </tr>
        <tr>
            <td valign="top">
                <table id="Table4" border="0" cellpadding="0" cellspacing="0" width="98%" style="border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid; border-left: #dee7ef 3px solid; border-bottom: #dee7ef 3px solid;">
                    <tr>
                        <td valign="top" align="left" style="width: 290px">
                            <table id="Table2" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <UI:Heading ID="Heading3" runat="server" HeadingText="Account" />
                                    </td>
                                    <td></td>
                                    <td style="width: 171px"></td>
                                </tr>
                                <tr>
                                    <%--<td class="labelFont">
                                        <asp:Label ID="LabelUserName" class="Label" runat="server" Text="User Name"></asp:Label>
                                    </td>
                                    <td style="width: 10px">
                                    </td>
                                    <td style="width: 171px">
                                        <asp:TextBox ID="TextBoxUserName" runat="server" CssClass="TextBox" Width="170px"
                                            MaxLength="30" TabIndex="11"></asp:TextBox>
                                    </td>--%>
                                </tr>
                                <tr>
                                    <td class="labelFont">
                                        <asp:Label ID="LabelPassword" class="Label" runat="server" Text="Password"></asp:Label>
                                    </td>
                                    <td style="width: 10px"></td>
                                    <td style="width: 171px">
                                        <asp:TextBox ID="TextBoxPassword" runat="server" CssClass="TextBox" Width="170px"
                                            MaxLength="30" TextMode="Password" TabIndex="18"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="labelFont">
                                        <asp:Label ID="LabelConfirmPassword" class="Label" runat="server" Text="Confirm Password"></asp:Label>
                                    </td>
                                    <td style="width: 10px"></td>
                                    <td style="width: 171px">
                                        <asp:TextBox ID="TextBoxConfirmPassword" runat="server" CssClass="TextBox" Width="170px"
                                            TextMode="Password" MaxLength="30" TabIndex="19"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr id="trPasswordExpires" runat="server">
                                    <td class="labelFont">
                                        <asp:Label ID="LabelExpires" runat="server" class="Label" Text="Expires"></asp:Label>
                                    </td>
                                    <td style="width: 10px"></td>
                                    <td style="width: 171px">
                                        <asp:CheckBox ID="CheckBoxPasswordExpires" class="Label" runat="server" Text="Password Expires Next Login"
                                            Width="170px" TabIndex="20" />
                                    </td>
                                </tr>
                                <tr id="trDropDownPasswordExpires" runat="server">
                                    <td class="labelFont"></td>
                                    <td style="width: 10px"></td>
                                    <td style="width: 171px">
                                        <asp:DropDownList ID="DropDownListPasswordExpires" runat="server" Width="171px"
                                            TabIndex="21">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 5px;"></td>
                        <td valign="top" align="left">
                            <table id="Table3" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <UI:Heading ID="Heading4" runat="server" HeadingText="Preferences" />
                                    </td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <%--Start Code Comented By Pradeep as per task#23--%>
                                <%--<tr>
                                    <td class="labelFont">
                                        <asp:Label ID="LabelDefaultLocation" class="Label" runat="server" Text="Default Location"></asp:Label>
                                    </td>
                                    <td style="width: 10px">
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownListDefaultLocation" runat="server" Width="170px" TabIndex="16">
                                        </asp:DropDownList>
                                    </td>
                                </tr>--%>
                                <%--End code Comented By Pradeep as per task#23--%>
                                <tr>
                                    <td class="labelFont">
                                        <asp:Label ID="Labeldays" class="Label" runat="server" Text="Medication Days Default"></asp:Label>
                                    </td>
                                    <td style="width: 10px"></td>
                                    <td>
                                        <asp:TextBox ID="TextBoxMedicationDays" runat="server" CssClass="TextBox" Width="68px"
                                            MaxLength="5" TabIndex="22"></asp:TextBox>
                                    </td>
                                </tr>
                                <%--Start Made changes by Pradeep as per task#2639--%>
                                <tr>
                                    <td class="labelFont">
                                        <asp:Label ID="LabelDefaultPrescribingQuantity" class="Label" runat="server" Text="Default Prescribing Quantity"></asp:Label>
                                    </td>
                                    <td style="width: 10px"></td>
                                    <td>
                                        <asp:TextBox ID="TextBoxDefaultPrescribingQuantity" runat="server" CssClass="TextBox"
                                            Width="68px" MaxLength="5" TabIndex="23"></asp:TextBox>
                                    </td>
                                </tr>
                                <%--End Made changes by Pradeep as per task#2639--%>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 10px"></td>
        </tr>

        <tr>
            <td valign="top">
                <table id="Table10" border="0" cellpadding="0" cellspacing="0" width="98%" style="border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid; border-left: #dee7ef 3px solid; border-bottom: #dee7ef 3px solid;">

                    <tr>
                        <td id="TablePermissions" style="width: 40%;" runat="server">
                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                <tr>
                                    <td>
                                        <UI:Heading ID="Heading5" runat="server" HeadingText="Permissions" />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <table border="0" cellpadding="0" cellspacing="0" style="border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid; border-left: #dee7ef 3px solid; border-bottom: #dee7ef 3px solid; width: 98%;"
                                            id="Permissions" runat="server">
                                            <tr>
                                                <td valign="top">
                                                    <table id="Table6" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td class="labelFont" nowrap="nowrap">Permissions that a Staff has
                                                            </td>
                                                            <td>
                                                                <input type="button" align="right" class="ButtonWeb" onclick="OpenPermissionsList();"
                                                                    value="Add Permissions..." tabindex="24" />
                                                            </td>
                                                        </tr>
                                                        <tr id="TrSecurityQuestions" runat="server">
                                                            <td valign="top" colspan="2">
                                                                <div id="DivPermissionsList" style="overflow-y: auto; overflow-x: hidden; height: 100px; width: 97%;">
                                                                    <asp:Panel ID="PanelPermissionsList" runat="server" BorderStyle="None" Width="100%"
                                                                        Height="100px">
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
                            </table>
                        </td>
                        <td style="width: 50%;">
                            <table id="tableDeviceRegistration" runat="server" cellpadding="0" cellspacing="0" border="0" width="70%">
                                <tr>
                                    <td>
                                        <UI:Heading ID="DeviceRegistration" runat="server" HeadingText="EPCS Device Registration" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="labelFont">
                                        <asp:Label ID="LabelDeviceName" class="Label" runat="server" Text="Device Name"></asp:Label>
                                    </td>
                                    <td style="width: 10px"></td>
                                    <td>
                                        <asp:TextBox ID="TextBoxDeviceName" runat="server" CssClass="TextBox" Width="130px"
                                            MaxLength="32" TabIndex="25"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 2px"></td>
                                </tr>                                
                                <tr>
                                    <td class="labelFont">
                                        <asp:Label ID="LabelDeviceSerialNum" class="Label" runat="server" Text="Device Serial #"></asp:Label>
                                    </td>
                                    <td style="width: 10px"></td>
                                    <td>
                                        <asp:TextBox ID="TextBoxDeviceSerialNum" runat="server" CssClass="TextBox" Width="130px"
                                            MaxLength="32" TabIndex="26"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 2px"></td>
                                </tr>
                                <tr>
                                    <td class="labelFont">
                                        <asp:Label ID="LabelDeviceEmail" class="Label" runat="server" Text="Device Username"></asp:Label>
                                    </td>
                                    <td style="width: 10px"></td>
                                    <td>
                                        <asp:TextBox ID="TextBoxDeviceUsername" runat="server" CssClass="TextBox" Width="130px"
                                            MaxLength="100" TabIndex="27"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 2px"></td>
                                </tr>
                                <tr>
                                    <td class="labelFont">
                                        <asp:Label ID="LabelDevicePassword" class="Label" runat="server" Text="Device Password"></asp:Label>
                                    </td>
                                    <td style="width: 10px"></td>
                                    <td>
                                        <asp:TextBox ID="TextBoxDevicePassword" runat="server" CssClass="TextBox" Width="130px"
                                            MaxLength="30" TextMode="Password" TabIndex="28"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 2px"></td>
                                </tr>
                                <tr>
                                    <td class="labelFont">
                                        <asp:Label ID="LabelOTP" class="Label" runat="server" Text="One Time Password (OTP)"></asp:Label>
                                    </td>
                                    <td style="width: 10px"></td>
                                    <td>
                                        <asp:TextBox ID="TextBoxOTP" runat="server" CssClass="TextBox" Width="130px" Enabled="true"
                                            MaxLength="30" TabIndex="29"></asp:TextBox>
                                    </td>
                                    <td class="labelFont">
                                        <asp:Label ID="Label2" class="Label" runat="server" Text="Authenticated"></asp:Label>
                                    </td>
                                    <td style="width: 10px"></td>
                                    <td>
                                        <asp:Label ID="LabelAuthenticated" class="Label" runat="server" Text="No"></asp:Label>
                                    </td>
                                    <td style="width: 10px">
                                        <asp:Image ID="Devicesuccessimage" runat="server" ImageUrl="~/App_Themes/Includes/Images/Yes.png" Visible="False" />

                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 2px"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>


        <tr>
            <td style="height: 10px"></td>
        </tr>
        <tr id="PanelSecurityQuestions" runat="server">
            <td>
                <table id="Table5" border="0" cellpadding="0" cellspacing="0" style="border-right: #dee7ef 3px solid; border-top: #dee7ef 3px solid; border-left: #dee7ef 3px solid; border-bottom: #dee7ef 3px solid; width: 98%;"
                    runat="server">
                    <tr>
                        <td id="tdSecurityQuestions" runat="server" valign="top">
                            <!-- increase the width of table for task #2635 add my mohit nov-18-2009   -->
                            <%--<table id="Table8" runat="server" border="0" cellpadding="0" cellspacing="0" style="width: 50%">--%>
                            <table id="Table8" border="0" cellpadding="0" cellspacing="0" style="width: 100%" runat="server">
                                <tr>
                                    <td style="width: 265px">
                                        <UI:Heading ID="Heading8" runat="server" HeadingText="Security Questions" />
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td>&nbsp;
                                    </td>
                                </tr>
                                <tr id="TrPrescriberSecurityQuestions" runat="server" style="display: none">
                                    <td class="labelFont" style="width: 114px" nowrap="nowrap">
                                        <asp:Label ID="LabelSecurityQuestions" runat="server" Text="Number of Security Questions required for Prescribes:-"
                                            Width="280px"></asp:Label>
                                    </td>
                                    <td></td>
                                    <td>
                                        <asp:Label class="Label" ID="LabelNumberofPrescrioberSecurityQuestions" runat="server"
                                            Width="100%"></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr id="TrSecurityQuestionsAnswered" runat="server" style="display: none">
                                    <td class="labelFont" style="width: 114px" nowrap="nowrap">
                                        <asp:Label ID="LabelPrescriberSecurityQuestions" runat="server" Text="Number Security Questions answered by staff:-"
                                            Width="280px"></asp:Label>
                                    </td>
                                    <td></td>
                                    <td>
                                        <asp:Label class="Label" ID="LabelNumberofSecurityQuestionsAnswered" runat="server"
                                            Width="100%"></asp:Label>
                                    </td>
                                    <td>&nbsp;
                                    </td>
                                </tr>
                                <tr id="TrSecurity" runat="server">
                                    <td style="width: 100%">
                                        <div id="PlaceHolder" runat="server" style="overflow-x: hidden; overflow-y: auto; height: 120px; width: 100%;">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <%--<td id="tdSpace" runat="server">&nbsp;
                        </td>--%>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<input id="HiddenPassword" type="hidden" runat="server" />
<input id="HiddenDevicePassword" type="hidden" runat="server" />
<input id="HiddenAuthenticationType" type="hidden" runat="server" />
<input id="HiddenStaffPermissionId" type="hidden" runat="server" />
<input id="HiddenPasswordExpires" type="hidden" runat="server" />
<input id="HiddenPasswordExpiresSelectedValue" type="hidden" runat="server" />
<input id="HiddenSecurityQuestions" type="hidden" runat="server" />
<input id="HiddenCheckUserExists" type="hidden" runat="server" value="true" />
<input id="HiddenSecurityAnswers" type="hidden" runat="server" />
<input id="HiddenIsAdmin" type="hidden" runat="server" />
<input id="HiddenIDGenerated" type="hidden" runat="server" />
<input id="HiddenSureScriptPrescriberId" type="hidden" runat="server" />
<input id="HiddenSureScriptLocationId" type="hidden" runat="server" />
