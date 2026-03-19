<%@ Page Language="C#" AutoEventWireup="true" CodeFile="usersignup.aspx.cs" Inherits="usersignup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="nutri.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 252px;
        }
        .auto-style2 {
            width: 37px;
        }
        .auto-style3 {
            width: 140px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="width: 1340px; background-image: url('Projpic/header.jpg'); height: 90px; color: #FFFFFF; font-size: x-large; font-weight: bold;">
            <tr>
                <td align="center">
                   
               Efficient Utility Mining for Nutrition Calculation</td>
            </tr>
        </table>
        <table style="width: 1340px; height: 15px; font-size: x-large; background-color: #FF9900; color: #000000; background-image: url('Projpic/subheader.png');">
            <tr>
                <td align="center">
                   
                </td>
            </tr>
        </table>
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/index.aspx">Back to home</asp:HyperLink>
        </div>
        <center>
            <br />
            <br />
            <table style="width: 756px; height: 400px;">
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="188px" ImageUrl="~/Projpic/signup.png" Width="184px"></asp:Image>
                    </td>
                    <td class="auto-style2"></td>
                    <td>
                        <fieldset style="height: 346px; width: 466px">
                            <legend>
                                Usersignup
                            </legend>
                            <table style="height: 309px; width: 433px; text-align: justify;">
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                                    </td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname" ErrorMessage="*" ForeColor="Red" ValidationGroup="nutri"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                 <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="Label2" runat="server" Text="Gender"></asp:Label>
                                    </td>
                                    <td class="auto-style1">
                                       <asp:RadioButton ID="RadioButton1" runat="server" Text="Male" Checked="true" GroupName="gender"></asp:RadioButton>
                                        <asp:RadioButton ID="RadioButton2" runat="server" Text="Female" GroupName="gender"></asp:RadioButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="Label7" runat="server" Text="Age"></asp:Label>
                                    </td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="txtage" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtage" ErrorMessage="*" ForeColor="Red" ValidationGroup="nutri"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                 <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="Label3" runat="server" Text="Phone Num"></asp:Label>
                                    </td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="txtphone" runat="server" MaxLength="10"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtphone" ErrorMessage="*" ForeColor="Red" ValidationGroup="nutri"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                 <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label>
                                    </td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtemail" ErrorMessage="*" ForeColor="Red" ValidationGroup="nutri"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="invalid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="nutri"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <%--  <tr>
                                    <td>
                                        
                                    </td>
                                    <td class="auto-style1">
                                        <asp:Button ID="Button3" runat="server" Text="Generate Username & Password" Font-Bold="True" Font-Names="Cambria" ForeColor="#FF3300" Height="32px" OnClick="Button3_Click" Width="230px"></asp:Button>
                                    </td>
                                </tr>--%>
                                 <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="Label5" runat="server" Text="Username"></asp:Label>
                                    </td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="txtusername" runat="server" AutoPostBack="True" OnTextChanged="txtusername_TextChanged"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtusername" ErrorMessage="*" ForeColor="Red" ValidationGroup="nutri"></asp:RequiredFieldValidator>
                                        <asp:Label ID="lblack" runat="server" ForeColor="Red" Text="Username Exists" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                 <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="Label6" runat="server" Text="Password"></asp:Label>
                                    </td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtpassword" ErrorMessage="*" ForeColor="Red" ValidationGroup="nutri"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                 <tr>
                                    <td class="auto-style3">
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="Button1" runat="server" Text="Save" Font-Bold="True" Font-Names="Cambria" OnClick="Button1_Click" Width="65px" ValidationGroup="nutri"></asp:Button>
                                    </td>
                                    <td class="auto-style1">
                                       &nbsp;&nbsp;&nbsp;
                                       <asp:Button ID="Button2" runat="server" Text="Cancel" Font-Bold="True" Font-Names="Cambria"></asp:Button>
                                    &nbsp;&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </center>
    </div>
    </form>
</body>
</html>
