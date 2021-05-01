<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="urundetay.aspx.cs" Inherits="DalliMakina.urunler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">    
        <div class="urunler-container">
            <div class="urunler-item">
                <asp:Image ID="urunImage" runat="server" Height="300px" Width="300px" />
            </div>
            <div class="urunler-item">
                <asp:Label ID="urunLabel" runat="server" Text="Ürün hakkında bilgiler burada olacak"></asp:Label>
                <p><asp:Button ID="Button1" runat="server" Text="Sepete Ekle" Width="105px" /></p>
            </div>
        </div>
    </form>
</asp:Content>
