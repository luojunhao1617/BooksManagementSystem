<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="books_management_system.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>图书管理系统</title>
    <style type="text/css">
        body {
            width: 1000px;
            margin-left: auto;
            margin-right: auto;
            height: 400px;
        }

        .auto-style1 {
            font-size: xx-large;
            color: #FFFFFF;
            text-align: left;
            background-color: #0066FF;
        }

        .auto-style2 {
            font-family: 华文宋体;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2 class="auto-style1">
                <asp:Image ID="Logo" runat="server" Height="70px" ImageUrl="~/Image/logo.png" Style="text-align: left" Width="311px" />
                &nbsp;&nbsp;&nbsp; <span class="auto-style2">图书管理系统</span></h2>
            <hr style="height: 4px; color: #000000; background-color: #000000" />
            <p style="height: 40px; margin-top: 31px">
                用&nbsp;&nbsp; 户：<asp:TextBox ID="txtUid" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            </p>
            <p style="height: 31px">
                密&nbsp;&nbsp; 码：<asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
            </p>
            <p style="height: 34px">
                <asp:RadioButtonList ID="rlbRole" runat="server" RepeatDirection="Horizontal" Width="250px">
                    <asp:ListItem>学生</asp:ListItem>
                    <asp:ListItem>教师</asp:ListItem>
                </asp:RadioButtonList>
            </p>
            <p style="height: 34px">
                <asp:Label ID="lbMsg" runat="server" ForeColor="Red"></asp:Label>
            </p>
            <p style="height: 50px">
                <asp:Button ID="BtnLogin" runat="server" Font-Bold="False" Font-Size="Medium" Height="30px" OnClick="Button1_Click" Style="margin-bottom: 0px" Text="登 录" Width="90px" />
            </p>
        </div>
    </form>
</body>
</html>
