<%@ Page Title="" Language="C#" MasterPageFile="~/student/Stud.Master" AutoEventWireup="true" CodeBehind="borrow.aspx.cs" Inherits="books_management_system.student.borrow" %>

<%@ MasterType TypeName="books_management_system.student.Stud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        我的书单：
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" Style="text-align: center" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="no" HeaderText="编号" />
                <asp:BoundField DataField="name" HeaderText="书名" />
                <asp:BoundField DataField="author" HeaderText="作者" />
                <asp:BoundField DataField="ver" HeaderText="版本" HtmlEncode="False" />
                <asp:BoundField DataField="press" HeaderText="出版社" />
                <asp:BoundField DataField="stock" HeaderText="库存" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument="<%# Container.DataItemIndex %>" CommandName="Borrow" Text="借书" OnClientClick="javascript:return confirm('是否借阅？')"></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandArgument="<%# Container.DataItemIndex %>" CommandName="Del" Text="删除" OnClientClick="javascript:return confirm('确认从书单中删除吗？')"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </p>
    <p>
        <asp:Label ID="lbMsg" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        我的借书：
    </p>
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="编号" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%" Style="text-align: center" OnRowCommand="GridView2_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="编号" HeaderText="编号" ReadOnly="True" SortExpression="编号" />
                <asp:BoundField DataField="书名" HeaderText="书名" SortExpression="书名" />
                <asp:BoundField DataField="作者" HeaderText="作者" SortExpression="作者" />
                <asp:BoundField DataField="版本" HeaderText="版本" SortExpression="版本" />
                <asp:BoundField DataField="出版社" HeaderText="出版社" SortExpression="出版社" />
                <asp:BoundField DataField="借书日期" HeaderText="借书日期" SortExpression="借书日期" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="还书日期" HeaderText="还书日期" SortExpression="还书日期" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="是否超期" HeaderText="是否超期" SortExpression="是否超期" ReadOnly="True" />
                <asp:CommandField SelectText="还书" ShowSelectButton="True"/>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookManagementConStr %>" SelectCommand="SELECT [编号], [书名], [作者], [版本], [出版社], [借书日期], [还书日期], [是否超期] FROM [jieyuanxinxi] WHERE ([学号] = @学号)">
            <SelectParameters>
                <asp:SessionParameter Name="学号" SessionField="uid" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>

</asp:Content>
