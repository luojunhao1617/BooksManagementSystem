<%@ Page Title="" Language="C#" MasterPageFile="~/student/Stud.Master" AutoEventWireup="true" CodeBehind="changePwd.aspx.cs" Inherits="books_management_system.student.changePwd" %>

<%@ MasterType TypeName="books_management_system.student.Stud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        &nbsp;旧 密 码：<asp:TextBox ID="txtOldPwd" runat="server" TextMode="Password"></asp:TextBox>
    </p>
    <p>
        &nbsp;新 密 码：<asp:TextBox ID="txtNewPwd1" runat="server" TextMode="Password"></asp:TextBox>
    </p>
    <p>
        确认密码：<asp:TextBox ID="txtNewPwd2" runat="server" TextMode="Password"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="lbMsg" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        <asp:Button ID="confirm" runat="server" Text="确认修改" OnClick="confirm_Click" />
    </p>
</asp:Content>
