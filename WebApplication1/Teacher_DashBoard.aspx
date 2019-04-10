<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teacher_DashBoard.aspx.cs" Inherits="WebApplication1.Teacher_DashBoard" MasterPageFile="~/Site2.Master" %>
<asp:Content ID="teacher_detail" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="teacher_dashboard" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="box">
        <div class="box-top">
        </div>
        <div class="box-in">
            <h2> Faculty Details</h2>
        <table style="border-style: none; border-width: thin; border-color: #FFFFFF; background-color: #FFFFFF; table-layout: auto">
            <tr>
                <td class="auto-style7" style="width: 229px">

                    NAME</td>
                
                <td class="auto-style5" style="width: 299px">

                    <asp:Label ID="lbl_name" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style8" style="width: 229px">

                    SAP ID</td>
                
                <td class="auto-style9" style="width: 299px">

                    <asp:Label ID="lbl_sap" runat="server"></asp:Label>

                </td>
                
            </tr>



            <tr>
                <td class="auto-style7" style="width: 229px">

                    EMPLOYEE NUMBER</td>
                
                <td class="auto-style5" style="width: 299px">

                    <asp:Label ID="lbl_empno" runat="server"></asp:Label>

                </td>
                
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