<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Heading.ascx.cs" Inherits="Streamline.SmartClient.UI.UserControls_Heading" %>
<asp:ScriptManagerProxy runat="server" ID="SMP1">
    <Scripts>
        <asp:ScriptReference Path="~/App_Themes/Includes/JS/MedicationOrderDetails.js?rel=3_5_x_4_1" NotifyScriptLoaded="true" />
       
    </Scripts>
</asp:ScriptManagerProxy>
 <table cellpadding="0" cellspacing="0" border="0"    >
   <tr  >
      <td   class="LeftHeading" style="background-repeat: no-repeat">
      
         
      
      </td>
      <td class="CenterHeading" style="background-repeat: repeat-x">
         <asp:Label ID="labelText"   runat="server"  Font-Bold="True" Font-Names="Arial" Font-Size="8.5pt"  ></asp:Label>  
      
      </td>
      <td  class="RightHeading" style="background-repeat: no-repeat">
       
      </td>
      <td></td>
   
   </tr>

</table>

