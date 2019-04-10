<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register_Teacher.aspx.cs" Inherits="WebApplication1.Register_Teacher" MasterPageFile="~/Site1.Master"%>
<asp:Content ID="register_teacher" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="box">
        <div class="box-top">
        </div>
        <div class="box-in">
            <h2> Register To Continue</h2>
      <table class="auto-style2">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1" style="width: 245px">
                    &nbsp;</td>
                <td class="auto-style1" style="width: 157px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">NAME*</td>
                <td class="auto-style1" style="width: 245px">
                    <asp:TextBox ID="TextBox4" runat="server" Width="240px" Height="22px"></asp:TextBox>
                </td>
                <td class="auto-style1" style="width: 157px">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">EMPLOYEE NUMBER*</td>
                <td class="auto-style1" style="width: 245px">
                    <asp:TextBox ID="TextBox5" runat="server" Width="240px" Height="22px"></asp:TextBox>
                </td>
                <td class="auto-style1" style="width: 157px">
                    <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">SAP ID*</td>
                <td class="auto-style1" style="width: 245px">
                    <asp:TextBox ID="TextBox1" runat="server" Height="22px" Width="240px"></asp:TextBox>
                </td>
                <td class="auto-style1" style="width: 157px">
                    <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">PASSWORD*</td>
                <td class="auto-style1" style="width: 245px">
                    <asp:TextBox ID="TextBox2" runat="server" Height="22px" Width="240px" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style1" style="width: 157px">
                    <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">CONFIRM PASSWORD*</td>
                <td class="auto-style1" style="width: 245px">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style1" TextMode="Password" Width="240px" Height="22px"></asp:TextBox>
                </td>
                <td class="auto-style1" style="width: 157px">
                    <asp:Label ID="Label5" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1" style="width: 245px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
                </td>
                <td class="auto-style1" style="width: 157px">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1" style="width: 245px">
                    <asp:Label ID="Label6" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style1" style="width: 157px">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style1" style="width: 245px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                <td class="auto-style1" style="width: 157px">&nbsp;</td>
            </tr>
        </table>

            <br />
            <h4 >
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Already Registered Login Here</asp:LinkButton>
                </h4>
            
        </div>
    </div>
    <div>
    
         
    </div>


    <div>
        
    

    </div>
</asp:Content>