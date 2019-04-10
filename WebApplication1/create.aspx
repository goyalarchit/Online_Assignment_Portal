<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="WebApplication1.create" MasterPageFile="~/Site2.Master" %>
<asp:Content ID="teacher_detail" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="view" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="box">
        <div class="box-top">
        </div>
        <div class="box-in" style="overflow: scroll; width: 668px;">
            <h2>Create Assignment</h2>

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
            </table>
            <br />
            <h4>&nbsp;</h4>

        </div>
    </div>
    <div>
    </div>


    <div>
    </div>

</asp:Content>
    
