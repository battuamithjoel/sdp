<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" CodeFile="caloriecalculator.aspx.cs" Inherits="caloriecalculator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 36px;
            width: 128px;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            width: 128px;
        }
        .auto-style4 {
            width: 128px;
            height: 29px;
        }
        .auto-style5 {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="height: 326px; width: 768px">
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label12" runat="server" Text="Your Age"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblage" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="color: #FF0000" class="auto-style4">
                Daily Activity
            </td>
            <td class="auto-style5">
                <asp:Label ID="Label5" runat="server" Text="Workout Hours" Width="139px"></asp:Label>
                <asp:TextBox ID="txtworkout" runat="server" AutoPostBack="True" OnTextChanged="txtworkout_TextChanged" Width="45px"></asp:TextBox>
                Hrs&nbsp;&nbsp;
                <asp:Label ID="lblworkoutmins" runat="server" Text="0"></asp:Label>&nbsp;mins&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label14" runat="server" Text="Your Workout Mins"></asp:Label>
                :&nbsp;&nbsp;
                <asp:Label ID="lblwork" runat="server" ForeColor="Red" Text="........"></asp:Label>
&nbsp;mins&nbsp;&nbsp;


            </td>
        </tr>
        <tr>
            <td class="auto-style3">

            </td>
             <td>
                <asp:Label ID="Label6" runat="server" Text="Sleeping Hours" Width="139px"></asp:Label>
                <asp:TextBox ID="txtsleeping" runat="server" AutoPostBack="True" OnTextChanged="txtsleeping_TextChanged" Width="45px"></asp:TextBox>
                 Hrs&nbsp;&nbsp;
                 <asp:Label ID="lblsleepmins" runat="server" Text="0"></asp:Label>
&nbsp;mins&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Label ID="lblworkoutack" runat="server" ForeColor="Red" Text="......."></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
         <td>
                <asp:Label ID="Label7" runat="server" Text="Rest Hours" Width="139px"></asp:Label>
                <asp:TextBox ID="txtrest" runat="server" AutoPostBack="True" OnTextChanged="txtrest_TextChanged" Width="45px"></asp:TextBox>
                Hrs&nbsp;&nbsp;
                <asp:Label ID="lblrestmins" runat="server" Text="0"></asp:Label>
&nbsp;mins</td>
            </tr>
        <tr>
            <td class="auto-style3"></td>
         <td>
                <asp:Label ID="Label8" runat="server" Text="Sitting Position Hours" Width="139px"></asp:Label>
                <asp:TextBox ID="txtsitting" runat="server" AutoPostBack="True" OnTextChanged="txtsitting_TextChanged" Width="45px"></asp:TextBox>
                Hrs&nbsp;&nbsp;
                <asp:Label ID="lblsittingmins" runat="server" Text="0"></asp:Label>
&nbsp;mins</td>
            </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label9" runat="server" Text="BMI"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label10" runat="server" Text="Height"></asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="txtheight" runat="server" Width="26px"></asp:TextBox>
                 mts&nbsp;&nbsp;&nbsp;
                 <asp:Label ID="Label11" runat="server" Text="Weight"></asp:Label>
                <asp:TextBox ID="txtweight" runat="server" Width="25px"></asp:TextBox>
                Kgs&nbsp;&nbsp;
                  <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Names="Cambria" Text="cal" OnClick="Button1_Click" Width="37px" />
                &nbsp; Your BMI:
                <asp:Label ID="lblbmi" runat="server" Text="0" ForeColor="Red"></asp:Label>
              
            &nbsp;&nbsp;
                <asp:Label ID="lblweightcal" runat="server" BackColor="#CCCCCC" Font-Size="Medium" Text="......."></asp:Label>
              
            </td>
        </tr>
        <tr>
            <td class="auto-style3">

            </td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Update" Font-Bold="True" Font-Names="Cambria" OnClick="Button2_Click" />
            &nbsp;<asp:Label ID="lblack0" runat="server" ForeColor="Red" Text="..." Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label13" runat="server" Text="Select Date"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtdate" runat="server" onfocus="showCalendarControl(this);" AutoPostBack="True" OnTextChanged="txtdate_TextChanged"></asp:TextBox>
                <asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Names="Cambria" OnClick="Button5_Click" Text="View" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label1" runat="server" Text="Select Meal"></asp:Label>
            </td>
            <td>
                <asp:RadioButton ID="RadioButton1" runat="server" Text="Breakfast" GroupName="meal" Checked="true" />
                <asp:RadioButton ID="RadioButton2" runat="server" Text="Lunch" GroupName="meal" />
                <asp:RadioButton ID="RadioButton3" runat="server" Text="Dinner" GroupName="meal" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label2" runat="server" Text="Select Category"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="dropcategory" runat="server" Font-Bold="True" Font-Names="Cambria" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="Category"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT DISTINCT [Category] FROM [datasetdet]"></asp:SqlDataSource>
            </td>
        </tr>
         <tr>
            <td class="auto-style3">
                <asp:Label ID="Label3" runat="server" Text="Select Item"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="dropitem" runat="server" Font-Bold="True" Font-Names="Cambria" DataSourceID="SqlDataSource2" DataTextField="Productname" DataValueField="Productname"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT DISTINCT [Productname] FROM [datasetdet] WHERE ([Category] = @Category)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dropcategory" Name="Category" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
         <tr>
            <td class="auto-style3">
                <asp:Label ID="Label4" runat="server" Text="Nos"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtnos" runat="server" Width="74px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Button ID="Button3" runat="server" Text="Save" Font-Bold="True" Font-Names="Cambria" OnClick="Button3_Click" Width="56px" />
            </td>
             <td>
                <asp:Button ID="Button4" runat="server" Text="Cancel" Font-Bold="True" Font-Names="Cambria" />
            &nbsp;&nbsp;
                 <asp:Label ID="lblack" runat="server" ForeColor="Red" Text="..." Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="1193px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="meal" HeaderText="Meal" SortExpression="meal" />
                        <asp:BoundField DataField="cdate" HeaderText="Date" SortExpression="cdate" />
                        <asp:BoundField DataField="ctime" HeaderText="Time" SortExpression="ctime" />
                        <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                        <asp:BoundField DataField="Productname" HeaderText="Productname" SortExpression="Productname" />
                        <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
                        <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories" />
                        <asp:BoundField DataField="Protein" HeaderText="Protein" SortExpression="Protein" />
                        <asp:BoundField DataField="Carbohydrates" HeaderText="Carbohydrates" SortExpression="Carbohydrates" />
                        <asp:BoundField DataField="Potassium" HeaderText="Potassium" SortExpression="Potassium" />
                        <asp:BoundField DataField="Iron" HeaderText="Iron" SortExpression="Iron" />
                        <asp:BoundField DataField="Calcium" HeaderText="Calcium" SortExpression="Calcium" />
                        <asp:BoundField DataField="VitaminA" HeaderText="VitaminA" SortExpression="VitaminA" />
                        <asp:BoundField DataField="VitaminB6" HeaderText="VitaminB6" SortExpression="VitaminB6" />
                        <asp:BoundField DataField="VitaminC" HeaderText="VitaminC" SortExpression="VitaminC" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [Category], [Productname], [Calories], [Protein], [Carbohydrates], [Potassium], [Iron], [Calcium], [VitaminA], [VitaminB6], [VitaminC], [quantity], [cdate], [ctime], [meal] FROM [caldata] WHERE (([uname] = @uname) AND ([cdate] = @cdate))">
                    <SelectParameters>
                        <asp:SessionParameter Name="uname" SessionField="user" Type="String" />
                         <asp:ControlParameter ControlID="txtdate" Name="cdate" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">

            </td>
        </tr>
        <tr>
            <td>
                Total Calories: </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" Width="967px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories" />
                        <asp:BoundField DataField="Protein" HeaderText="Protein" SortExpression="Protein" />
                        <asp:BoundField DataField="Carbohydrates" HeaderText="Carbohydrates" SortExpression="Carbohydrates" />
                        <asp:BoundField DataField="Potassium" HeaderText="Potassium" SortExpression="Potassium" />
                        <asp:BoundField DataField="Iron" HeaderText="Iron" SortExpression="Iron" />
                        <asp:BoundField DataField="Calcium" HeaderText="Calcium" SortExpression="Calcium" />
                        <asp:BoundField DataField="VitaminA" HeaderText="VitaminA" SortExpression="VitaminA" />
                        <asp:BoundField DataField="VitaminB6" HeaderText="VitaminB6" SortExpression="VitaminB6" />
                        <asp:BoundField DataField="VitaminC" HeaderText="VitaminC" SortExpression="VitaminC" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [totcal] WHERE (([uname] = @uname) AND ([cdate] = @cdate))">
                    <SelectParameters>
                        <asp:SessionParameter Name="uname" SessionField="user" Type="String" />
                         <asp:ControlParameter ControlID="txtdate" Name="cdate" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">

            </td>
        </tr>
       <%-- <tr>
            <td>
                Average Calories: </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource5" ForeColor="#333333" GridLines="None" Width="967px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories" />
                        <asp:BoundField DataField="Protein" HeaderText="Protein" SortExpression="Protein" />
                        <asp:BoundField DataField="Carbohydrates" HeaderText="Carbohydrates" SortExpression="Carbohydrates" />
                        <asp:BoundField DataField="Potassium" HeaderText="Potassium" SortExpression="Potassium" />
                        <asp:BoundField DataField="Iron" HeaderText="Iron" SortExpression="Iron" />
                        <asp:BoundField DataField="Calcium" HeaderText="Calcium" SortExpression="Calcium" />
                        <asp:BoundField DataField="VitaminA" HeaderText="VitaminA" SortExpression="VitaminA" />
                        <asp:BoundField DataField="VitaminB6" HeaderText="VitaminB6" SortExpression="VitaminB6" />
                        <asp:BoundField DataField="VitaminC" HeaderText="VitaminC" SortExpression="VitaminC" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [averagetab] WHERE (([uname] = @uname) AND ([cdate] = @cdate))">
                    <SelectParameters>
                        <asp:SessionParameter Name="uname" SessionField="user" Type="String" />
                        <asp:ControlParameter ControlID="txtdate" Name="cdate" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>--%>
    </table>
</asp:Content>

