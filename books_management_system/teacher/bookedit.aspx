<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.Master" AutoEventWireup="true" CodeBehind="bookedit.aspx.cs" Inherits="books_management_system.teacher.bookedit" %>
<%@ MasterType TypeName="books_management_system.teacher.Teach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        关键字：<asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
        <asp:Button ID="btnsearch" runat="server" Text="查找" />
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="编号" DataSourceID="BookTable" ForeColor="#333333" GridLines="None" style="text-align: center" Width="100%" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="编号" HeaderText="编号" ReadOnly="True" SortExpression="编号" />
                <asp:BoundField DataField="书名" HeaderText="书名" SortExpression="书名" />
                <asp:BoundField DataField="作者" HeaderText="作者" SortExpression="作者" />
                <asp:BoundField DataField="版本" HeaderText="版本" SortExpression="版本" />
                <asp:BoundField DataField="出版社" HeaderText="出版社" SortExpression="出版社" />
                <asp:BoundField DataField="库存" HeaderText="库存" SortExpression="库存" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除"></asp:LinkButton>
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
        <asp:SqlDataSource ID="BookTable" runat="server" ConnectionString="<%$ ConnectionStrings:BookManageConnectionString %>" DeleteCommand="DELETE FROM [Book] WHERE [编号] = @编号" InsertCommand="INSERT INTO [Book] ([编号], [书名], [作者], [版本], [出版社], [库存]) VALUES (@编号, @书名, @作者, @版本, @出版社, @库存)" SelectCommand="SELECT * FROM [Book] WHERE (([书名] LIKE '%' + @书名 + '%') OR ([作者] LIKE '%' + @作者 + '%') OR ([出版社] LIKE '%' + @出版社 + '%'))" UpdateCommand="UPDATE [Book] SET [书名] = @书名, [作者] = @作者, [版本] = @版本, [出版社] = @出版社, [库存] = @库存 WHERE [编号] = @编号" ProviderName="<%$ ConnectionStrings:BookManageConnectionString.ProviderName %>">
            <DeleteParameters>
                <asp:Parameter Name="编号" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="编号" Type="String" />
                <asp:Parameter Name="书名" Type="String" />
                <asp:Parameter Name="作者" Type="String" />
                <asp:Parameter Name="版本" Type="String" />
                <asp:Parameter Name="出版社" Type="String" />
                <asp:Parameter Name="库存" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" DefaultValue="%" Name="书名" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtSearch" DefaultValue="%" Name="作者" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtSearch" DefaultValue="%" Name="出版社" PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="书名" Type="String" />
                <asp:Parameter Name="作者" Type="String" />
                <asp:Parameter Name="版本" Type="String" />
                <asp:Parameter Name="出版社" Type="String" />
                <asp:Parameter Name="库存" Type="Int32" />
                <asp:Parameter Name="编号" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="编号" DataSourceID="BookTable" DefaultMode="Insert" Width="996px" CellPadding="4" ForeColor="#333333">
            <EditItemTemplate>
                编号:
                <asp:Label ID="编号Label1" runat="server" Text='<%# Eval("编号") %>' />
                <br />
                书名:
                <asp:TextBox ID="书名TextBox" runat="server" Text='<%# Bind("书名") %>' />
                <br />
                作者:
                <asp:TextBox ID="作者TextBox" runat="server" Text='<%# Bind("作者") %>' />
                <br />
                版本:
                <asp:TextBox ID="版本TextBox" runat="server" Text='<%# Bind("版本") %>' />
                <br />
                出版社:
                <asp:TextBox ID="出版社TextBox" runat="server" Text='<%# Bind("出版社") %>' />
                <br />
                库存:
                <asp:TextBox ID="库存TextBox" runat="server" Text='<%# Bind("库存") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                编号:
                <asp:TextBox ID="编号TextBox" runat="server" Text='<%# Bind("编号") %>' />
                <br />
                书名:&nbsp;<asp:TextBox ID="书名TextBox" runat="server" Text='<%# Bind("书名") %>' />
                <br />
                作者:&nbsp;<asp:TextBox ID="作者TextBox" runat="server" Text='<%# Bind("作者") %>' />
                <br />
                版本:&nbsp;<asp:TextBox ID="版本TextBox" runat="server" Text='<%# Bind("版本") %>' />
                <br />
                出版社:&nbsp;<asp:TextBox ID="出版社TextBox" runat="server" Text='<%# Bind("出版社") %>' />
                <br />
                库存:&nbsp;<asp:TextBox ID="库存TextBox" runat="server" Text='<%# Bind("库存") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                编号:
                <asp:Label ID="编号Label" runat="server" Text='<%# Eval("编号") %>' />
                <br />
                书名:
                <asp:Label ID="书名Label" runat="server" Text='<%# Bind("书名") %>' />
                <br />
                作者:
                <asp:Label ID="作者Label" runat="server" Text='<%# Bind("作者") %>' />
                <br />
                版本:
                <asp:Label ID="版本Label" runat="server" Text='<%# Bind("版本") %>' />
                <br />
                出版社:
                <asp:Label ID="出版社Label" runat="server" Text='<%# Bind("出版社") %>' />
                <br />
                库存:
                <asp:Label ID="库存Label" runat="server" Text='<%# Bind("库存") %>' />
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
