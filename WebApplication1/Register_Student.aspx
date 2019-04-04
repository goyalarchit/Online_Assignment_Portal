<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register_Student.aspx.cs" Inherits="WebApplication1.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-bottom: 7px;
        }
        .auto-style2 {
            height: 26px;
        }
        .auto-style3 {
            margin-bottom: 7px;
            height: 26px;
        }
    </style>
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
                <td class="auto-style3">ROLL NUMBER</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox5" runat="server" Width="280px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">COURSE</td>
                <td class="auto-style1">
                    <asp:DropDownList ID="ddl_course" runat="server" AutoPostBack="True" OnSelectedIndexChanged="populate_branch">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">BRANCH</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddl_branch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="populate_specialization">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">SPECIALIZATION</td>
                <td class="auto-style1">
                    <asp:DropDownList ID="ddl_spl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="populate_class">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">SEMESTER</td>
                <td class="auto-style1">
                    <asp:DropDownList ID="ddl_sem" runat="server" AutoPostBack="True">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">CLASS</td>
                <td class="auto-style1">
                    <asp:DropDownList ID="ddl_class" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
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
