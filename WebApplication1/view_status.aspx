<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view_status.aspx.cs" Inherits="WebApplication1.view_status" MasterPageFile="~/Site3.Master" %>
<asp:Content ID="view_status" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="view" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="box">
        <div class="box-top">
        </div>
        <div class="box-in" style="overflow: scroll; width: 709px;">
            <h2>View Assignments</h2>
            <br />
            <br />

            <asp:GridView ID="g1" runat="server" AutoGenerateColumns="False" CellPadding="4" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px"  >



                    <Columns>

                        <asp:BoundField DataField="A_ID" HeaderText="ASSIGNMENT ID" />
                        <asp:BoundField DataField="ASSIGNMENT_TITLE" HeaderText="TITLE" />
                        <asp:BoundField DataField="SUBJECT" HeaderText="SUBJECT" />
                        <asp:BoundField DataField="SUBJECT_CODE" HeaderText="SUBJECT CODE" />
                        <asp:HyperLinkField DataTextField="DESCRIPTION" DataNavigateUrlFields="DESCRIPTION" HeaderText="DESCRIPTION" Target="_blank" />
                        <asp:BoundField DataField="DEADLINE" HeaderText="DEADLINE" DataFormatString="{0:d}"/>
                        <asp:BoundField DataField="MAX_MARKS" HeaderText="MAXIMUM MARKS" />
                        <asp:BoundField DataField="DATE_ASSIGNED" HeaderText="DATE ASSIGNED" />
                        <asp:BoundField DataField="STATUS" HeaderText="STATUS"  />
                        <asp:BoundField DataField="GRADE" HeaderText="GRADE" />
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
            <br />
            <h4 style="color:crimson">Submit Your Assignment Below </h4>

        <br />
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style6">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style9">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
                <td class="auto-style8">
                    <asp:Label ID="lbl_upload" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style9">
                    <asp:Button ID="Button1" runat="server" Text="Submit Assignment" OnClick="Button1_Click" />
                </td>
                <td class="auto-style8">&nbsp;</td>
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