<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="WebApplication1.view" MasterPageFile="~/Site2.Master" %>

<asp:Content ID="teacher_detail" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="view" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="box">
        <div class="box-top">
        </div>
        <div class="box-in" style="overflow: scroll; width: 709px;">
            <h2>View Assignments</h2>

            <asp:GridView ID="g1" runat="server" AutoGenerateColumns="False" DataKeyNames="A_ID" OnRowDeleting="g1_RowDeleting" OnRowUpdating="grade" CellPadding="4" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">



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

            <br />
            <h4>&nbsp;</h4>

        </div>
    </div>
    <div>
    </div>


    <div>
    </div>

</asp:Content>
