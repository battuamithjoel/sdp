<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="viewdataset.aspx.cs" Inherits="viewdataset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" Width="906px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                        <asp:BoundField DataField="Productid" HeaderText="Productid" SortExpression="Productid" />
                        <asp:BoundField DataField="Productname" HeaderText="Productname" SortExpression="Productname" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [datasetdet]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

