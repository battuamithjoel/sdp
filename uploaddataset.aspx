<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="uploaddataset.aspx.cs" Inherits="uploaddataset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <table style="width: 644px; height: 76px">
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="Upload Dataset"></asp:Label>
        </td>
        <td>
            <asp:FileUpload ID="FileUpload1" runat="server" Font-Bold="True" 
                Font-Names="Cambria" />
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" ErrorMessage="select file" ForeColor="Red" ValidationGroup="nutri"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Upload" Font-Bold="True" 
                Font-Names="Cambria" onclick="Button1_Click" ValidationGroup="nutri" />
        </td>
        <td>
            <asp:Button ID="Button2" runat="server" Text="Cancel" Font-Bold="True" 
                Font-Names="Cambria" />
        &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblack" runat="server" ForeColor="Red" Text="Uploaded Successfully!!!" Visible="False"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>

