<%@ Page Language="C#" AutoEventWireup="true" CodeFile="YesNo.aspx.cs" Inherits="YesNo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <base target="_self" />
    <title>Medication</title>
    <link href="App_Themes/Includes/Style/Common.css?rel=3_5_x_4_1" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function yesClicked() {
            window.returnValue = 'Y'; 
            window.close();
            closeDialogWithReturnValue("Y");
        }

        function noOrCancelClicked() {
            window.returnValue = 'N';
            window.close();
            closeDialogWithReturnValue("N");
        }

        function closeDialogWithReturnValue(returnValue) {
            if (parent.document.getElementById('dialog-body') && parent.document.getElementById('dialog-body').contentWindow && parent.document.getElementById('dialog-body').contentWindow.returnValue) {
                parent.document.getElementById('dialog-body').contentWindow.returnValue = returnValue;
            }
            if (parent.document.getElementById('dialog-close'))
                parent.document.getElementById('dialog-close').click();
        }
    </script>
</head>
<body bgcolor="#F0F0F0">
    <form id="form1" runat="server">
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="250px">
            <tr>
                <td valign="top" align="left" class="" style="Width:250px;">                                
                    <table align="center" class="" width="250px">
                        <tr>
                            <td colspan="3" style="height:15px;">                               
                            </td>
                        </tr>
                        <tr>
                           <%--<td colspan="3" nowrap class="labelFont">--%>
                           <td colspan="3" align="left"  class="Alerts" style="Width:250px;">
                                    <span id="SpanConfirm" runat="server" class="Label" style="text-align: left; Width: 250px;"></span>
                            </td>
                        </tr>
                        <tr>
                             <td colspan="3" style="height:20px;">                               
                            </td>
                        </tr>
                        <tr>
                           <td align="center" nowrap="nowrap" class="">
                                <input type="button" size="10" id="ButtonYes" onclick="javascript: yesClicked();"  style="font-family:MS Sans Serif; font-size:8.25pt; height:24px; width:70px" value="Yes" runat="server" />
                                &nbsp;
                                <input type="button" id="ButtonNo" value="No" onclick="javascript: noOrCancelClicked();" runat="server" style="font-family:MS Sans Serif; font-size:8.25pt; height:24px; width:70px" />                                                                
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>