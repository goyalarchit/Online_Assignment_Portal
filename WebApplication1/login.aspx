<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.login" MasterPageFile="~/Site1.Master" %>
<asp:Content ID="login" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box">
        <div class="box-top">
        </div>
        <div class="box-in">
            <h2> Login To Continue</h2>
            <table class="auto-style2">
            <tr>
                <td class="auto-style3">SAP ID</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox1" runat="server" Height="22px" Width="284px" Font-Size="Medium"></asp:TextBox>
                </td>
                <td style="width: 223px">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">PASSWORD</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox2" runat="server" Height="22px" Width="284px" TextMode="Password" Font-Size="Medium"></asp:TextBox>
                </td>
                <td style="width: 223px">
                    <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="RadioButton1" runat="server" GroupName="UserType" Text="Student" Font-Size="Small" ForeColor="Black" Height="20px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="UserType" Text="Teacher" Font-Size="Small" ForeColor="Black" Height="20px" />
                </td>
                <td style="width: 223px">
                    <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">
                    <div ></div>
                </td>
                <td style="width: 223px">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" /></td>
                <td style="width: 223px">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                <td style="width: 223px">&nbsp;</td>
            </tr>
        </table>

            <br />
            <h4 >
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ForeColor="Red" >New User? Register Here</asp:LinkButton>
                </h4>
            
        </div>
    </div>
    <div>
    
         
    </div>
</asp:Content>

