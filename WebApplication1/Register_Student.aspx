<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register_Student.aspx.cs" Inherits="WebApplication1.Register" MasterPageFile="~/Site1.Master"%>
<asp:Content ID="register_student" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="box">
        <div class="box-top">
        </div>
        <div class="box-in">
            <h2> Register To Continue</h2>
            <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="width: 148px">&nbsp;</td>
                <td class="auto-style1" style="width: 245px">
                    &nbsp;</td>
                <td class="auto-style1" style="width: 167px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" style="width: 148px">NAME*</td>
                <td class="auto-style1" style="width: 245px">
                    <asp:TextBox ID="TextBox4" runat="server" Width="240px" Height="22px"></asp:TextBox>
                </td>
                <td class="auto-style1" style="width: 167px">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="width: 148px">ROLL NUMBER*</td>
                <td class="auto-style1" style="width: 245px">
                    <asp:TextBox ID="TextBox5" runat="server" Width="240px" Height="22px"></asp:TextBox>
                </td>
                <td class="auto-style1" style="width: 167px">
                    <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="width: 148px">COURSE*</td>
                <td class="auto-style1" style="width: 245px">
                    <asp:DropDownList ID="ddl_course" runat="server" AutoPostBack="True" OnSelectedIndexChanged="populate_branch" Height="22px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style1" style="width: 167px">
                    <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="width: 148px">BRANCH*</td>
                <td class="auto-style3" style="width: 245px">
                    <asp:DropDownList ID="ddl_branch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="populate_specialization" Height="22px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style3" style="width: 167px">
                    <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="width: 148px">SPECIALIZATION*</td>
                <td class="auto-style1" style="width: 245px">
                    <asp:DropDownList ID="ddl_spl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="populate_class" Height="22px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style1" style="width: 167px">
                    <asp:Label ID="Label5" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="width: 148px">SEMESTER*</td>
                <td class="auto-style1" style="width: 245px">
                    <asp:DropDownList ID="ddl_sem" runat="server" AutoPostBack="True" Height="22px">
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
                <td class="auto-style1" style="width: 167px">
                    <asp:Label ID="Label6" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="width: 148px">CLASS*</td>
                <td class="auto-style1" style="width: 245px">
                    <asp:DropDownList ID="ddl_class" runat="server" AutoPostBack="True" Height="22px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style1" style="width: 167px">
                    <asp:Label ID="Label7" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="width: 148px">SAP ID*</td>
                <td class="auto-style1" style="width: 245px">
                    <asp:TextBox ID="TextBox1" runat="server" Height="22px" Width="240px"></asp:TextBox>
                </td>
                <td class="auto-style1" style="width: 167px">
                    <asp:Label ID="Label8" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="width: 148px">PASSWORD*</td>
                <td class="auto-style1" style="width: 245px">
                    <asp:TextBox ID="TextBox2" runat="server" Height="22px" Width="240px" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style1" style="width: 167px">
                    <asp:Label ID="Label9" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="width: 148px">CONFIRM PASSWORD*</td>
                <td class="auto-style1" style="width: 245px">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style1" TextMode="Password" Width="240px" Height="22px"></asp:TextBox>
                </td>
                <td class="auto-style1" style="width: 167px">
                    <asp:Label ID="Label10" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="width: 148px">&nbsp;</td>
                <td class="auto-style1" style="width: 245px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
                </td>
                <td class="auto-style1" style="width: 167px">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" style="width: 148px">&nbsp;</td>
                <td class="auto-style1" style="width: 245px">
                    <asp:Label ID="Label11" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style1" style="width: 167px">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" style="width: 148px">&nbsp;</td>
                <td class="auto-style1" style="width: 245px">&nbsp;</td>
                <td class="auto-style1" style="width: 167px">&nbsp;</td>
            </tr>
        </table>
            <br />
            <h4 >
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Already Registered? Login Here</asp:LinkButton>
                </h4>
            
        </div>
    </div>
    <div>
    
         
    </div>
        <div>
        
        
    
    </div>
</asp:Content>