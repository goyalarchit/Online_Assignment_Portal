<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register1" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="register" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box">
        <div class="box-top">
        </div>
        <div class="box-in">
            <h2>Select User Type</h2>
            <table class="auto-style2">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Student" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Teacher" />
                    </td>
                </tr>
            </table>

            <br />
        </div>
    </div>
    <div>
    </div>
    <div>
    </div>
</asp:Content>
