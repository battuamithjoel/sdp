<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="changepwd.aspx.cs" Inherits="changepwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .auto-style1 {
            width: 197px;
        }
        .auto-style2 {
            width: 155px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table style="height: 155px; width: 578px">
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label1" runat="server" Text="Old Password"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtold" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td class="auto-style1">
                <asp:Label ID="Label2" runat="server" Text="New Password"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtnew" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td class="auto-style1">
                <asp:Label ID="Label3" runat="server" Text="Retype Password"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtretype" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td class="auto-style1">
                <asp:Button ID="Button1" runat="server" Text="Change Password" Font-Bold="True" Font-Names="Cambria" OnClick="Button1_Click" />
            </td>
            <td class="auto-style2">
                <asp:Button ID="Button2" runat="server" Text="Cancel" Font-Bold="True" Font-Names="Cambria" />
            </td>
             <td>
                 <asp:Label ID="lblack" Visible="False" runat="server" Text="Label" ForeColor="#CC0000"></asp:Label>
             </td>
        </tr>
    </table>
</asp:Content>

