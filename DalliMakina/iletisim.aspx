<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="iletisim.aspx.cs" Inherits="DalliMakina.iletisim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <form id="form1" runat="server">    
            <div class="contact">
                <table>
                    <tr>
                        <td>İsim:</td><td><asp:TextBox ID="TextBox1" runat="server" Width="240px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Soyisim:</td><td><asp:TextBox ID="TextBox2" runat="server" Width="240px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>E-Posta:</td><td><asp:TextBox ID="TextBox3" runat="server" Width="240px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Konu:</td><td><asp:TextBox ID="TextBox4" runat="server" Width="240px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Mesaj:</td><td><asp:TextBox ID="TextBox5" runat="server" Height="144px" TextMode="MultiLine" Width="238px"></asp:TextBox></td>
                    </tr>
                </table> 
                <p><asp:Button ID="sendMessage" runat="server" Text="Gönder" BorderStyle="Solid" Width="200px" Height="30px" style="margin-right: 0px" /></p>
            </div>
        </form>
</asp:Content>
