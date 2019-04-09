<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grade.aspx.cs" Inherits="WebApplication1.grade" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 637px;
        }
        .auto-style2 {
            width: 7px;
        }
        .auto-style3 {
            width: 361px;
        }
        .auto-style4 {
            width: 55px;
        }
        .auto-style5 {
            width: 245px;
        }
        .auto-style6 {
            width: 340px;
        }
        .auto-style7 {
            width: 282px;
        }
        .auto-style8 {
            width: 282px;
            height: 23px;
        }
        .auto-style9 {
            width: 245px;
            height: 23px;
        }
        .auto-style10 {
            width: 361px;
            height: 23px;
        }
        .auto-style11 {
            width: 340px;
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 100%;">
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="auto-style11"><h1> GRADING PORTAL</h1> </td>
                    <td class="auto-style2">
                        <asp:LinkButton ID="LinkButton1" runat="server">Logout</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
            </table>
        <table style="background-color: #CCCC00; border: medium ridge #808000; table-layout: auto">
            <tr>
                <td class="auto-style7">

                    SUBMISSION FOR</td>
                
                <td class="auto-style5">

                    <asp:Label ID="lbl_title" runat="server"></asp:Label>

                </td>
                
                <td class="auto-style3">

                    ASSIGNMENT_ID</td>
                
                <td class="auto-style6">

                    <asp:Label ID="lbl_id" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style8">

                    SUBJECT</td>
                
                <td class="auto-style9">

                    <asp:Label ID="lbl_sub" runat="server"></asp:Label>

                </td>
                
                <td class="auto-style10">

                    SUBJECT CODE</td>
                
                <td class="auto-style11">

                    <asp:Label ID="lbl_scode" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style7">

                    COURSE</td>
                
                <td class="auto-style5">

                    <asp:Label ID="lbl_course" runat="server"></asp:Label>

                </td>
                
                <td class="auto-style3">

                    BRANCH</td>
                
                <td class="auto-style6">

                    <asp:Label ID="lbl_branch" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style7">

                    SPECIALISATION</td>
                
                <td class="auto-style5">

                    <asp:Label ID="lbl_spl" runat="server"></asp:Label>

                </td>
                
                <td class="auto-style3">

                    CLASS</td>
                
                <td class="auto-style6">

                    <asp:Label ID="lbl_class" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style7">

                    SEMESTER</td>
                
                <td class="auto-style5">

                    <asp:Label ID="lbl_sem" runat="server"></asp:Label>

                </td>
                
                <td class="auto-style3">

                    DEADLINE</td>
                
                <td class="auto-style6">

                    <asp:Label ID="lbl_deadline" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style8">

                    MAXIMUM MARKS</td>
                
                <td class="auto-style9">

                    <asp:Label ID="lbl_marks" runat="server"></asp:Label>

                </td>
                
                <td class="auto-style10">

                    DATE ASSIGNED</td>
                
                <td class="auto-style11">

                    <asp:Label ID="lbl_dateasgn" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style7">

                    &nbsp;</td>
                
                <td class="auto-style5">

                    &nbsp;</td>
                
                <td class="auto-style3">

                    &nbsp;</td>
                
                <td class="auto-style6">

                    &nbsp;</td>
                
            </tr>



        </table>

            <table style="width: 100%;">
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <asp:GridView ID="g1" runat="server" AutoGenerateColumns="False" DataKeyNames="S_ID"  OnRowEditing="g1_RowEditing" OnRowUpdating="grade1" ShowHeaderWhenEmpty="True" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="true">



                        <AlternatingRowStyle BackColor="White" />



                        <Columns>

                            
                            <asp:BoundField DataField="S_ID" HeaderText="SUBMISSION_ID" />
                            <asp:BoundField DataField="SAP_ID" HeaderText="SAP_ID" />
                            <asp:BoundField DataField="ROLL_NO" HeaderText="ROLL_NO" />
                            <asp:BoundField DataField="NAME" HeaderText="NAME" />
                            <asp:HyperLinkField DataTextField="FILE_LOCATION" DataNavigateUrlFields="FILE_LOCATION" HeaderText="FILE_LOCATION" Target="_blank" />
                            <asp:TemplateField HeaderText="Operation">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("GRADE") %>'  runat="server"/>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbox_grade" Text='<%# Eval("GRADE") %>' runat="server" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Operation">
                                <ItemTemplate>
                                    <asp:Button Text="UPDATE GRADE" runat="server" CommandName="EDIT" />
                                </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Button Text="SAVE" runat="server" CommandName="UPDATE" />
                                    </EditItemTemplate>
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
