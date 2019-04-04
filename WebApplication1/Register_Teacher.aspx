<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register_Teacher.aspx.cs" Inherits="WebApplication1.Register_Teacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">PLEASE REGISTER TO CONTINUE</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">NAME</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox4" runat="server" Width="280px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">EMPLOYEE NUMBER</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox5" runat="server" Width="280px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">SAP ID</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="284px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">PASSWORD</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox2" runat="server" Height="16px" Width="284px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">CONFIRM PASSWORD</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style1" TextMode="Password" Width="280px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Already Registered Login Here</asp:LinkButton>
                </td>
            </tr>
        </table>
    

    </div>
    </form>
</body>
</html>
