<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" CodeFile="suggestion.aspx.cs" Inherits="suggestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style1 {
        height: 25px;
    }
        .auto-style2 {
            width: 105px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 413px">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Welcome"></asp:Label>
                &nbsp;<asp:Label ID="lbluser" runat="server" Text="Label"></asp:Label>
            </td>
       
            <td>
                Your BMI&nbsp;
                <asp:Label ID="lblbmi" runat="server" Text="0" ForeColor="Red"></asp:Label>
              
                &nbsp;&nbsp;&nbsp;
              
                <asp:Label ID="lblweightcal" runat="server" BackColor="#CCCCCC" Font-Size="Medium" Text="......."></asp:Label>
            </td>
        </tr>
         <tr>
             <td></td>
            <td class="auto-style3">
                <asp:Label ID="Label12" runat="server" Text="Your Age"></asp:Label>
           
                &nbsp;&nbsp;&nbsp;
           
                <asp:Label ID="lblage" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        </table>
    <table>
        <tr>
            <td class="auto-style1">

            </td>
        </tr>
        <tr>
            <td>
                Daily Total Calories
                :</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="934px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="cdate" HeaderText="Date" SortExpression="cdate" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [Calories], [Protein], [Carbohydrates], [Potassium], [Iron], [Calcium], [VitaminA], [VitaminB6], [VitaminC], [cdate] FROM [totcal] WHERE ([uname] = @uname)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lbluser" Name="uname" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
          <tr>
            <td class="auto-style1">

            </td>
        </tr>
        <tr>
            <td>
                Insufficient List
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Width="934px">
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [insuffi] WHERE ([uname] = @uname)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lbluser" Name="uname" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>

    <table>
        <tr>
            <td>
                &nbsp;<asp:Label ID="lbldate" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:Panel ID="Panel1" runat="server" Visible="false" Height="332px">
        <div style="height: 22px">
            INSUFFICIENCY DISEASES:
        </div>
        <table style="height: 296px; width: 433px">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Protein"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblprotein" runat="server" Text="......"></asp:Label>
                </td>
            </tr>
             <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Carbohydrates"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblcarbo" runat="server" Text="......"></asp:Label>
                </td>
            </tr>
             <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="Potassium"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblpotassium" runat="server" Text="......"></asp:Label>
                </td>
            </tr>
             <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label5" runat="server" Text="Iron"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lbliron" runat="server" Text="......"></asp:Label>
                </td>
            </tr>
             <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label6" runat="server" Text="Calcium"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblcalcium" runat="server" Text="......"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label7" runat="server" Text="Vitamin A"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblvitA" runat="server" Text="......"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label8" runat="server" Text="Vitamin B6"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblvitB6" runat="server" Text="......"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label9" runat="server" Text="Vitamin C"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblvitC" runat="server" Text="......"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

