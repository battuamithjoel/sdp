<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" CodeFile="caloriechart.aspx.cs" Inherits="caloriechart" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
                Calorie Chart:
            </td>
            <td>
                Protein Chart
            </td>
            <td>
                Carbohydrates
            </td>
            <td>
                Potassium
            </td>
             
        </tr>
        <tr>
            <td>
                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" BackColor="BlanchedAlmond" Width="276px">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="cdate" YValueMembers="Calories"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisY Title="Amount of Calorie Consumed">
                            </AxisY>
                            <AxisX Title="Date">
                            </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [Calories], [cdate] FROM [totcal] WHERE ([uname] = @uname)">
                    <SelectParameters>
                        <asp:SessionParameter Name="uname" SessionField="user" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:Chart ID="Chart2" runat="server" Width="276px" DataSourceID="SqlDataSource2" BackColor="NavajoWhite">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="cdate" YValueMembers="Protein"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisY Title="Amount of Protein Consumed">
                            </AxisY>
                            <AxisX Title="Date">
                            </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [Protein], [cdate] FROM [totcal] WHERE ([uname] = @uname)">
                    <SelectParameters>
                        <asp:SessionParameter Name="uname" SessionField="user" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
             <td>
                <asp:Chart ID="Chart3" runat="server" Width="276px" DataSourceID="SqlDataSource3" BackColor="MistyRose">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="cdate" YValueMembers="Carbohydrates"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisY Title="Amount of carbohydrates consumed">
                            </AxisY>
                            <AxisX Title="Date">
                            </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                 <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [Carbohydrates], [cdate] FROM [totcal] WHERE ([uname] = @uname)">
                     <SelectParameters>
                         <asp:SessionParameter Name="uname" SessionField="user" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
            </td>
             <td>
                <asp:Chart ID="Chart4" runat="server" Width="276px" DataSourceID="SqlDataSource4" BackColor="Silver">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="cdate" YValueMembers="Potassium"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisY Title="Amount of Potassium consumed">
                            </AxisY>
                            <AxisX Title="Date">
                            </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                 <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [Potassium], [cdate] FROM [totcal] WHERE ([uname] = @uname)">
                     <SelectParameters>
                         <asp:SessionParameter Name="uname" SessionField="user" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
            </td>
            
        </tr>
        <tr>
            <td>
                Iron</td>
             <td>
                 Calcium</td>
             <td>
                 Vitamin A</td>
             <td>
                 Vitamin B6</td>
        </tr>
        <tr>
            <td>
                <asp:Chart ID="Chart5" runat="server" DataSourceID="SqlDataSource5" BackColor="SpringGreen">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="cdate" YValueMembers="Iron"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisY Title="Amount of Iron Consumed">
                            </AxisY>
                            <AxisX Title="Date">
                            </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [Iron], [cdate] FROM [totcal] WHERE ([uname] = @uname)">
                    <SelectParameters>
                        <asp:SessionParameter Name="uname" SessionField="user" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:Chart ID="Chart6" runat="server" DataSourceID="SqlDataSource6" BackColor="PowderBlue">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="cdate" YValueMembers="Calcium"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisY Title="Amount of Calcium Consumed">
                            </AxisY>
                            <AxisX Title="Date">
                            </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [Calcium], [cdate] FROM [totcal] WHERE ([uname] = @uname)">
                    <SelectParameters>
                        <asp:SessionParameter Name="uname" SessionField="user" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
             <td>
                <asp:Chart ID="Chart7" runat="server" DataSourceID="SqlDataSource7" BackColor="LightSalmon">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="cdate" YValueMembers="VitaminA"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisY Title="Amount of Vitamin A Consumed">
                            </AxisY>
                            <AxisX Title="Date">
                            </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                 <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [VitaminA], [cdate] FROM [totcal] WHERE ([uname] = @uname)">
                     <SelectParameters>
                         <asp:SessionParameter Name="uname" SessionField="user" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
            </td>
             <td>
                <asp:Chart ID="Chart8" runat="server" DataSourceID="SqlDataSource8" BackColor="HotPink">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="cdate" YValueMembers="VitaminB6"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisY Title="Amount of Vitamin B6 Consumed">
                            </AxisY>
                            <AxisX Title="Date">
                            </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                 <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [VitaminB6], [cdate] FROM [totcal] WHERE ([uname] = @uname)">
                     <SelectParameters>
                         <asp:SessionParameter Name="uname" SessionField="user" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                Vitamin C
            </td>
        </tr>
        <tr>
            <td>
                <asp:Chart ID="Chart9" runat="server" BackColor="SlateGray" DataSourceID="SqlDataSource9">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="cdate" YValueMembers="VitaminC"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisY Title="Amount of Vitamin C Consumed">
                            </AxisY>
                            <AxisX Title="Date">
                            </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [VitaminC], [cdate] FROM [totcal] WHERE ([uname] = @uname)">
                    <SelectParameters>
                        <asp:SessionParameter Name="uname" SessionField="user" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

