<%@ Page Title="" Language="C#" MasterPageFile="~/student/Stud.Master" AutoEventWireup="true" CodeBehind="query.aspx.cs" Inherits="books_management_system.student.query" %>
<%@ MasterType TypeName="books_management_system.student.Stud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        关键字搜索：<asp:TextBox ID="BookSearch" runat="server" placeholder="书名/作者/出版社"></asp:TextBox>
        <asp:Button ID="BtnSearch" runat="server" Text="查找" />
    </p>
    <p>
        <asp:Label ID="lbMsg" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="编号" DataSourceID="SqlDataSource1" EmptyDataText="请输入关键字进行查找~" ForeColor="Black" GridLines="None" style="text-align: center" Width="100%" BorderColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="编号" HeaderText="编号" ReadOnly="True" SortExpression="编号" />
                <asp:BoundField DataField="书名" HeaderText="书名" SortExpression="书名" />
                <asp:BoundField DataField="作者" HeaderText="作者" SortExpression="作者" />
                <asp:BoundField DataField="版本" HeaderText="版本" SortExpression="版本" />
                <asp:BoundField DataField="出版社" HeaderText="出版社" SortExpression="出版社" />
                <asp:BoundField DataField="库存" HeaderText="库存" SortExpression="库存" />
                <asp:CommandField SelectText="加入书单" ShowSelectButton="True" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookManagementConStr %>" SelectCommand="SELECT * FROM [Book] WHERE (([书名] LIKE '%' + @书名 + '%') OR ([作者] LIKE '%' + @作者 + '%') OR ([出版社] LIKE '%' + @出版社 + '%'))">
            <SelectParameters>
                <asp:ControlParameter ControlID="BookSearch" Name="书名" PropertyName="Text" />
                <asp:ControlParameter ControlID="BookSearch" Name="作者" PropertyName="Text" />
                <asp:ControlParameter ControlID="BookSearch" Name="出版社" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>