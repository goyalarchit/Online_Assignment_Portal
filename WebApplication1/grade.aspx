<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grade.aspx.cs" Inherits="WebApplication1.grade" MasterPageFile="~/Site2.Master" %>
<asp:Content ID="teacher_detail" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="view" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="box">
        <div class="box-top">
        </div>
        <div class="box-in" style="overflow: scroll; width: 635px;">
            <h2>Assignments Evaluation</h2>
            <table style="background-color: #CCCC00; border: medium ridge #808000; table-layout: auto">
                <tr>
                    <td class="auto-style7" style="width: 133px">SUBMISSION FOR    SUBMISSION FOR</td>
                
                <td class="auto-style5" style="width: 120px">

                    <asp:Label ID="lbl_title" runat="server"></asp:Label>

                </td>
                
                <td class="auto-style3" style="width: 162px">

                    ASSIGNMENT_ID</td>
                
                <td class="auto-style6" style="width: 190px">

                    <asp:Label ID="lbl_id" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style8" style="width: 133px">

                    SUBJECT</td>
                
                <td class="auto-style9" style="width: 120px">

                    <asp:Label ID="lbl_sub" runat="server"></asp:Label>

                </td>
                
                <td class="auto-style10" style="width: 162px">

                    SUBJECT CODE</td>
                
                <td class="auto-style11" style="width: 190px">

                    <asp:Label ID="lbl_scode" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style7" style="width: 133px">

                    COURSE</td>
                
                <td class="auto-style5" style="width: 120px">

                    <asp:Label ID="lbl_course" runat="server"></asp:Label>

                </td>
                
                <td class="auto-style3" style="width: 162px">

                    BRANCH</td>
                
                <td class="auto-style6" style="width: 190px">

                    <asp:Label ID="lbl_branch" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style7" style="width: 133px">

                    SPECIALISATION</td>
                
                <td class="auto-style5" style="width: 120px">

                    <asp:Label ID="lbl_spl" runat="server"></asp:Label>

                </td>
                
                <td class="auto-style3" style="width: 162px">

                    CLASS</td>
                
                <td class="auto-style6" style="width: 190px">

                    <asp:Label ID="lbl_class" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style7" style="width: 133px">

                    SEMESTER</td>
                
                <td class="auto-style5" style="width: 120px">

                    <asp:Label ID="lbl_sem" runat="server"></asp:Label>

                </td>
                
                <td class="auto-style3" style="width: 162px">

                    DEADLINE</td>
                
                <td class="auto-style6" style="width: 190px">

                    <asp:Label ID="lbl_deadline" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style8" style="width: 133px">

                    MAXIMUM MARKS</td>
                
                <td class="auto-style9" style="width: 120px">

                    <asp:Label ID="lbl_marks" runat="server"></asp:Label>

                </td>
                
                <td class="auto-style10" style="width: 162px">

                    DATE ASSIGNED</td>
                
                <td class="auto-style11" style="width: 190px">

                    <asp:Label ID="lbl_dateasgn" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style7" style="width: 133px">

                    &nbsp;</td>
                
                <td class="auto-style5" style="width: 120px">

                    &nbsp;</td>
                
                <td class="auto-style3" style="width: 162px">

                    &nbsp;</td>
                
                <td class="auto-style6" style="width: 190px">

                    &nbsp;</td>
                
            </tr>



        </table>

            <h4>&nbsp;</h4>
            <p>&nbsp;&nbsp;&nbsp;&nbsp; </p>
            <p>&nbsp;</p>

       <p>    
                    <asp:GridView ID="g1" runat="server" AutoGenerateColumns="False" DataKeyNames="S_ID"  OnRowEditing="g1_RowEditing" OnRowUpdating="grade1" ShowHeaderWhenEmpty="True" CellPadding="4" ShowFooter="True" style="overflow:scroll" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">



                        <Columns>

                            
                            <asp:BoundField DataField="S_ID" HeaderText=" SUBMISSION_ID " />
                            <asp:BoundField DataField="SAP_ID" HeaderText=" SAP_ID " />
                            <asp:BoundField DataField="ROLL_NO" HeaderText=" ROLL_NO " />
                            <asp:BoundField DataField="NAME" HeaderText=" NAME " />
                            <asp:HyperLinkField DataTextField="FILE_LOCATION" DataNavigateUrlFields="FILE_LOCATION" HeaderText=" FILE_LOCATION " Target="_blank" />
                            <asp:TemplateField HeaderText=" GRADE ">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("GRADE") %>'  runat="server"/>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbox_grade" Text='<%# Eval("GRADE") %>' runat="server" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText=" UPDATE ">
                                <ItemTemplate>
                                    <asp:ImageButton ImageUrl="~/IMAGES/edit.png"  Height="20px" Width="20px" ToolTip="Update Grade"  runat="server" CommandName="EDIT" />
                                </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:ImageButton  ImageUrl="~\IMAGES\save.png" Height="20px" Width="20px" ToolTip="Save" runat="server" CommandName="UPDATE" />
                                    </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>



                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#330099" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <SortedAscendingCellStyle BackColor="#FEFCEB" />
                        <SortedAscendingHeaderStyle BackColor="#AF0101" />
                        <SortedDescendingCellStyle BackColor="#F6F0C0" />
                        <SortedDescendingHeaderStyle BackColor="#7E0000" />



                    </asp:GridView>
          
         </p>      
            <br />
    </div>
    <div>
    </div>


    <div>
    </div>
        </div>
</asp:Content>