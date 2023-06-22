<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.Master" AutoEventWireup="true" CodeBehind="studmag.aspx.cs" Inherits="books_management_system.teacher.studmag" %>
<%@ MasterType TypeName="books_management_system.teacher.Teach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        搜索学生：<asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True"></asp:TextBox>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="学号" DataSourceID="StudentTable" ForeColor="#333333" GridLines="None" style="text-align: center" Width="100%" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="学号" HeaderText="学号" ReadOnly="True" SortExpression="学号" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="性别" HeaderText="性别" SortExpression="性别" />
                <asp:BoundField DataField="专业" HeaderText="专业" SortExpression="专业" />
                <asp:BoundField DataField="学院" HeaderText="学院" SortExpression="学院" />
                <asp:BoundField DataField="密码" HeaderText="密码" SortExpression="密码" />
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
        <asp:SqlDataSource ID="StudentTable" runat="server" ConnectionString="<%$ ConnectionStrings:BookManageConnectionString %>" DeleteCommand="DELETE FROM [Student] WHERE [学号] = @学号" InsertCommand="INSERT INTO [Student] ([学号], [姓名], [性别], [专业], [学院], [密码]) VALUES (@学号, @姓名, @性别, @专业, @学院, @密码)" SelectCommand="SELECT * FROM [Student] WHERE (([学号] LIKE '%' + @学号 + '%') OR ([姓名] LIKE '%' + @姓名 + '%'))" UpdateCommand="UPDATE [Student] SET [姓名] = @姓名, [性别] = @性别, [专业] = @专业, [学院] = @学院, [密码] = @密码 WHERE [学号] = @学号">
            <DeleteParameters>
                <asp:Parameter Name="学号" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="学号" Type="String" />
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="性别" Type="String" />
                <asp:Parameter Name="专业" Type="String" />
                <asp:Parameter Name="学院" Type="String" />
                <asp:Parameter Name="密码" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" DefaultValue="%" Name="学号" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtSearch" DefaultValue="%" Name="姓名" PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="性别" Type="String" />
                <asp:Parameter Name="专业" Type="String" />
                <asp:Parameter Name="学院" Type="String" />
                <asp:Parameter Name="密码" Type="String" />
                <asp:Parameter Name="学号" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="学号" DataSourceID="StudentTable" DefaultMode="Insert" CellPadding="4" ForeColor="#333333">
            <EditItemTemplate>
                学号:
                <asp:Label ID="学号Label1" runat="server" Text='<%# Eval("学号") %>' />
                <br />
                姓名:
                <asp:TextBox ID="姓名TextBox" runat="server" Text='<%# Bind("姓名") %>' />
                <br />
                性别:
                <asp:TextBox ID="性别TextBox" runat="server" Text='<%# Bind("性别") %>' />
                <br />
                专业:
                <asp:TextBox ID="专业TextBox" runat="server" Text='<%# Bind("专业") %>' />
                <br />
                学院:
                <asp:TextBox ID="学院TextBox" runat="server" Text='<%# Bind("学院") %>' />
                <br />
                密码:
                <asp:TextBox ID="密码TextBox" runat="server" Text='<%# Bind("密码") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                学号:&nbsp;<asp:TextBox ID="学号TextBox" runat="server" Text='<%# Bind("学号") %>' />
                <br />
                姓名:&nbsp;<asp:TextBox ID="姓名TextBox" runat="server" Text='<%# Bind("姓名") %>' />
                <br />
                性别:&nbsp;<asp:TextBox ID="性别TextBox" runat="server" Text='<%# Bind("性别") %>' />
                <br />
                专业:&nbsp;<asp:TextBox ID="专业TextBox" runat="server" Text='<%# Bind("专业") %>' />
                <br />
                学院:&nbsp;<asp:TextBox ID="学院TextBox" runat="server" Text='<%# Bind("学院") %>' />
                <br />
                密码: <asp:TextBox ID="密码TextBox" runat="server" Text='<%# Bind("密码") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                学号:
                <asp:Label ID="学号Label" runat="server" Text='<%# Eval("学号") %>' />
                <br />
                姓名:
                <asp:Label ID="姓名Label" runat="server" Text='<%# Bind("姓名") %>' />
                <br />
                性别:
                <asp:Label ID="性别Label" runat="server" Text='<%# Bind("性别") %>' />
                <br />
                专业:
                <asp:Label ID="专业Label" runat="server" Text='<%# Bind("专业") %>' />
                <br />
                学院:
                <asp:Label ID="学院Label" runat="server" Text='<%# Bind("学院") %>' />
                <br />
                密码:
                <asp:Label ID="密码Label" runat="server" Text='<%# Bind("密码") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新建" />
            </ItemTemplate>
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:FormView>
    </p>
</asp:Content>
