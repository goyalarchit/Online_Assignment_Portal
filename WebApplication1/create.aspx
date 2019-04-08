<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="WebApplication1.create" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 107px;
        }
        .auto-style2 {
            width: 1257px;
        }
        .auto-style3 {
            width: 220px;
        }
        .auto-style5 {
            width: 580px;
        }
        .auto-style6 {
            width: 604px;
        }
        .auto-style7 {
            width: 600px;
        }
        .auto-style8 {
            width: 715px;
        }
        .auto-style9 {
            width: 540px;
        }
        .auto-style10 {
            width: 600px;
            height: 26px;
        }
        .auto-style11 {
            width: 220px;
            height: 26px;
        }
        .auto-style12 {
            width: 540px;
            height: 26px;
        }
        .auto-style13 {
            width: 715px;
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width:100%;">
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td>
                    <asp:LinkButton ID="LinkButton1" runat="server">Logout</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            </table>
            <table class="auto-style2">
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style9">PLEASE REGISTER TO CONTINUE</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style9">
                    &nbsp;</td>
                <td class="auto-style8">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3">ASSIGNMENT TITLE</td>
                <td class="auto-style9">
                    <asp:TextBox ID="Tbox_Title" runat="server" Width="280px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:Label ID="lbl_title" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3">SUBJECT</td>
                <td class="auto-style9">
                    <asp:TextBox ID="Tbox_sub" runat="server" Width="280px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:Label ID="lbl_subject" runat="server"></asp:Label>
                </td>
            </tr>
                <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3">SUBJECT CODE</td>
                <td class="auto-style9">
                    <asp:TextBox ID="Tbox_scode" runat="server" CssClass="auto-style1" Width="280px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:Label ID="lbl_scode" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3">DESCRIPTION</td>
                <td class="auto-style9">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
                <td class="auto-style8">
                    <asp:Label ID="lbl_upload" runat="server"></asp:Label>
                </td>
                </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3">COURSE</td>
                <td class="auto-style9">
                    <asp:DropDownList ID="ddl_course" runat="server" AutoPostBack="True" OnSelectedIndexChanged="populate_branch">
                    </asp:DropDownList>
                </td>
                <td class="auto-style8">
                    <asp:Label ID="lbl_course" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3">BRANCH</td>
                <td class="auto-style9">
                    <asp:DropDownList ID="ddl_branch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="populate_specialization">
                    </asp:DropDownList>
                </td>
                <td class="auto-style8">
                    <asp:Label ID="lbl_branch" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style11">SPECIALIZATION</td>
                <td class="auto-style12">
                    <asp:DropDownList ID="ddl_spl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="populate_class">
                    </asp:DropDownList>
                </td>
                <td class="auto-style13">
                    <asp:Label ID="lbl_spl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3">SEMESTER</td>
                <td class="auto-style9">
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
                <td class="auto-style8">
                    <asp:Label ID="lbl_sem" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3">CLASS</td>
                <td class="auto-style9">
                    <asp:DropDownList ID="ddl_class" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td class="auto-style8">
                    <asp:Label ID="lbl_class" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3">DEADLINE</td>
                <td class="auto-style9">
                    <asp:TextBox ID="Tbox_deadline" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="25px" ImageUrl="~/IMAGES/calender.png" OnClick="ImageButton1_Click" Width="21px" />
                </td>
                <td class="auto-style8">
                    <asp:Label ID="lbl_deadline" runat="server"></asp:Label>
                    <br />
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" ShowGridLines="True" Width="220px">
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                    </asp:Calendar>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3">MAXIMUM MARKS</td>
                <td class="auto-style9">
                    <asp:TextBox ID="Tbox_marks" runat="server" Height="16px" Width="284px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:Label ID="lbl_marks" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style9">
                    <asp:Label ID="lbl_common" runat="server"></asp:Label>
                </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
                </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton1_Click">Go Back To DashBoard</asp:LinkButton>
                </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
