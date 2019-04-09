<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="WebApplication1.view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 41px;
        }

        .auto-style4 {
            width: 488px;
        }

        .auto-style7 {
            width: 103px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:LinkButton ID="LinkButton1" runat="server">Logout</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
            </table>

            <table style="width: 100%;">
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <asp:GridView ID="g1" runat="server" AutoGenerateColumns="False" DataKeyNames="A_ID" OnRowDeleting="g1_RowDeleting" OnRowUpdating="grade" CellPadding="4" ForeColor="#333333" GridLines="None">



                        <AlternatingRowStyle BackColor="White" />



                        <Columns>

                            
                            <asp:BoundField DataField="A_ID" HeaderText="ASSIGNMENT_ID" />
                            <asp:BoundField DataField="ASSIGNMENT_TITLE" HeaderText="TITLE" />
                            <asp:BoundField DataField="SUBJECT" HeaderText="SUBJECT" />
                            <asp:BoundField DataField="SUBJECT_CODE" HeaderText="SUBJECT CODE" />
                            <asp:HyperLinkField DataTextField="DESCRIPTION" DataNavigateUrlFields="DESCRIPTION" HeaderText="DESCRIPTION" Target="_blank" />
                            <asp:BoundField DataField="COURSE" HeaderText="COURSE" />
                            <asp:BoundField DataField="BRANCH" HeaderText="BRANCH" />
                            <asp:BoundField DataField="SPECIALISATION" HeaderText="SPECIALISATION" />
                            <asp:BoundField DataField="SEMESTER" HeaderText="SEMESTER" />
                            <asp:BoundField DataField="CLASS" HeaderText="CLASS" />
                            <asp:BoundField DataField="DEADLINE" HeaderText="DEADLINE" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="MAX_MARKS" HeaderText="MAXIMUM MARKS" />
                            <asp:BoundField DataField="DATE_ASSIGNED" HeaderText="DATE ASSIGNED" />
                            <asp:TemplateField HeaderText="Operation">
                                <ItemTemplate>
                                    <asp:LinkButton Text="DELETE" runat="server" CommandName="DELETE" OnClientClick="return confirm('Are You sure ? You Want to Delete') " />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Operation">
                                <ItemTemplate>
                                    <asp:LinkButton Text="GRADE" runat="server" CommandName="UPDATE" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>



                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />



                    </asp:GridView>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton1_Click">Go Back To DashBoard</asp:LinkButton>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
