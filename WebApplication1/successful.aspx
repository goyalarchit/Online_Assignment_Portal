<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="successful.aspx.cs" Inherits="WebApplication1.successful" MasterPageFile="~/Site3.Master" %>
<asp:Content ID="teacher_detail" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="teacher_dashboard" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="box">
        <div class="box-top">
        </div>
        <div class="box-in">
            <h2> Student Details</h2>
        <table style="border-style: none; border-width: thin; border-color: #FFFFFF; background-color: #FFFFFF; table-layout: auto">
            <tr>
                <td class="auto-style7" style="width: 105px">

                    &nbsp;</td>
                
                <td class="auto-style7" style="width: 229px">

                    NAME</td>
                
                <td class="auto-style5" style="width: 299px">

                    <asp:Label ID="lbl_name" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style8" style="width: 105px">

                    &nbsp;</td>
                
                <td class="auto-style8" style="width: 229px">

                    SAP ID</td>
                
                <td class="auto-style9" style="width: 299px">

                    <asp:Label ID="lbl_sap" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style7" style="width: 105px">

                    &nbsp;</td>
                
                <td class="auto-style7" style="width: 229px">

                    ROLL NUMBER</td>
                
                <td class="auto-style5" style="width: 299px">

                    <asp:Label ID="lbl_rollno" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style7" style="width: 105px">

                    &nbsp;</td>
                
                <td class="auto-style7" style="width: 229px">

                    COURSE</td>
                
                <td class="auto-style5" style="width: 299px">

                    <asp:Label ID="lbl_course" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style7" style="width: 105px">

                    &nbsp;</td>
                
                <td class="auto-style7" style="width: 229px">

                    BRANCH</td>
                
                <td class="auto-style5" style="width: 299px">

                    <asp:Label ID="lbl_branch" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style7" style="width: 105px">

                    &nbsp;</td>
                
                <td class="auto-style7" style="width: 229px">

                    SPECIALISATION</td>
                
                <td class="auto-style5" style="width: 299px">

                    <asp:Label ID="lbl_spl" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style7" style="width: 105px">

                    &nbsp;</td>
                
                <td class="auto-style7" style="width: 229px">

                    CLASS</td>
                
                <td class="auto-style5" style="width: 299px">

                    <asp:Label ID="lbl_class" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style7" style="width: 105px">

                    &nbsp;</td>
                
                <td class="auto-style7" style="width: 229px">

                    SEMESTER</td>
                
                <td class="auto-style5" style="width: 299px">

                    <asp:Label ID="lbl_sem" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style7" style="width: 105px">

                    &nbsp;</td>
                
                <td class="auto-style7" style="width: 229px">

                    &nbsp;</td>
                
                <td class="auto-style5" style="width: 299px">

                    &nbsp;</td>
                
            </tr>



            </table>
    
            <br />
            <h4 >
                    &nbsp;</h4>
            
        </div>
    </div>
    <div>
    
         
    </div>


    <div>

    
        
    </div>
</asp:Content>
