<%@ Page Title="" ValidateRequest="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="DalliMakina.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <table style="width:100%; margin-bottom: 0px;">
            <tr>
                <td style="width: 51px; height: 16px;">
                    <asp:Button ID="Button1" runat="server" Text="Kullanıcıları Düzenle" OnClick="Button1_Click" Height="50px" />
                </td>
                <td style="width: 45px; height: 16px;">
                    <asp:Button ID="Button2" runat="server" Text="Sepetleri Düzenle" OnClick="Button2_Click" Height="50px" />
                </td>
                <td style="width: 45px; height: 16px;">
                    <asp:Button ID="Button3" runat="server" Text="Ürünleri Düzenle" OnClick="Button3_Click" Height="50px" />
                </td>
                <td style="width: 21px; height: 16px;">
                    <asp:Button ID="Button4" runat="server" Text="Üst Menü Düzenle" OnClick="Button4_Click" Height="50px" />
                </td>
                <td style="width: 28px; height: 16px;">
                    <asp:Button ID="Button5" runat="server" Text="Foother Menü Düzenle" OnClick="Button5_Click" Height="50px" />
                </td>
                <td style="height: 16px">
                    <asp:Button ID="Button6" runat="server" Text="Gelen Mesajlar" OnClick="Button6_Click" Height="50px" />
                </td>
            </tr>
        </table>
        <asp:Panel ID="Panel1" runat="server">
            <br />
            <table style="width: 44%; height: 97px;">
                <tr>
                    <td style="width: 94px">Kullanıcı Adı:</td>
                    <td>
                        <asp:TextBox ID="kadiTxBox" runat="server" Width="258px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 94px">Adı:</td>
                    <td>
                        <asp:TextBox ID="adiTxBox" runat="server" Width="258px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 94px; height: 26px;">Soy Adı:</td>
                    <td style="height: 26px">
                        <asp:TextBox ID="sadiTxBox" runat="server" Width="258px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 94px">Mail:</td>
                    <td>
                        <asp:TextBox ID="mailTxBox" runat="server" Width="258px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 94px">Şifre</td>
                    <td>
                        <asp:TextBox ID="sifreTxBox" runat="server" TextMode="Password" Width="258px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 94px">Kademe</td>
                    <td>
                        <asp:DropDownList ID="kademeDList" runat="server" Height="16px" Width="268px">
                            <asp:ListItem Value="0">Kullanıcı</asp:ListItem>
                            <asp:ListItem Value="1">Admin</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 94px">&nbsp;</td>
                    <td>
                        <center>
                            <asp:Button ID="kayitBtn" runat="server" Text="Yeni Kullanıcı Ekle" Width="127px" OnClick="kayitBtn_Click" />
                            <br />
                            <asp:Label ID="sncTxt" runat="server"></asp:Label>
                        </center>
                    </td>
                </tr>
            </table>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" EmptyDataText="Görüntülenecek hiç veri kaydı yok." AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="893px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="kul_adi" HeaderText="kul_adi" SortExpression="kul_adi" />
                    <asp:BoundField DataField="adi" HeaderText="adi" SortExpression="adi" />
                    <asp:BoundField DataField="s_adi" HeaderText="s_adi" SortExpression="s_adi" />
                    <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
                    <asp:BoundField DataField="sifre" HeaderText="sifre" SortExpression="sifre" />
                    <asp:BoundField DataField="kademe" HeaderText="kademe" SortExpression="kademe" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dmimakinaConnectionString1 %>" DeleteCommand="DELETE FROM [Uye] WHERE [id] = @id" InsertCommand="INSERT INTO [Uye] ([kul_adi], [adi], [s_adi], [mail], [sifre], [kademe]) VALUES (@kul_adi, @adi, @s_adi, @mail, @sifre, @kademe)" ProviderName="<%$ ConnectionStrings:dmimakinaConnectionString1.ProviderName %>" SelectCommand="SELECT [id], [kul_adi], [adi], [s_adi], [mail], [sifre], [kademe] FROM [Uye]" UpdateCommand="UPDATE [Uye] SET [kul_adi] = @kul_adi, [adi] = @adi, [s_adi] = @s_adi, [mail] = @mail, [sifre] = @sifre, [kademe] = @kademe WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="kul_adi" Type="String" />
                    <asp:Parameter Name="adi" Type="String" />
                    <asp:Parameter Name="s_adi" Type="String" />
                    <asp:Parameter Name="mail" Type="String" />
                    <asp:Parameter Name="sifre" Type="String" />
                    <asp:Parameter Name="kademe" Type="Byte" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="kul_adi" Type="String" />
                    <asp:Parameter Name="adi" Type="String" />
                    <asp:Parameter Name="s_adi" Type="String" />
                    <asp:Parameter Name="mail" Type="String" />
                    <asp:Parameter Name="sifre" Type="String" />
                    <asp:Parameter Name="kademe" Type="Byte" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server"></asp:Panel>
        <asp:Panel ID="Panel3" runat="server">
            <table style="width:100%;">
                <tr>
                    <td style="width: 94px; height: 26px;">Adı:</td>
                    <td style="height: 26px">
                        <asp:TextBox ID="urunAdiTxBox" runat="server" Width="216px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 94px">Kategori</td>
                    <td>
                        <asp:TextBox ID="urunKategoriTxBox" runat="server" Width="216px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 94px">Açıklama:</td>
                    <td>
                        <asp:TextBox ID="urunAciklamaTxBox" runat="server" Height="151px" TextMode="MultiLine" Width="369px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 94px">Resim Yükle:</td>
                    <td>
                        <asp:FileUpload ID="urunResimYukleBtn" runat="server" />
                        <asp:Label ID="resimYukleUyariTxt" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 94px">&nbsp;</td>
                    <td>
                        <asp:Button ID="urunKaydetBtn" runat="server" OnClick="urunKaydetBtn_Click" Text="Kaydet" Width="75px" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" EmptyDataText="Görüntülenecek hiç veri kaydı yok." AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="196px" Width="898px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="adi" HeaderText="adi" SortExpression="adi" />
                    <asp:BoundField DataField="aciklama" HeaderText="aciklama" SortExpression="aciklama" />
                    <asp:BoundField DataField="resim" HeaderText="resim" SortExpression="resim" />
                    <asp:BoundField DataField="kategori" HeaderText="kategori" SortExpression="kategori" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dmimakinaConnectionString1 %>" DeleteCommand="DELETE FROM [urunler] WHERE [id] = @id" InsertCommand="INSERT INTO [urunler] ([adi], [aciklama], [resim], [kategori]) VALUES (@adi, @aciklama, @resim, @kategori)" ProviderName="<%$ ConnectionStrings:dmimakinaConnectionString1.ProviderName %>" SelectCommand="SELECT [id], [adi], [aciklama], [resim], [kategori] FROM [urunler]" UpdateCommand="UPDATE [urunler] SET [adi] = @adi, [aciklama] = @aciklama, [resim] = @resim, [kategori] = @kategori WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="adi" Type="String" />
                    <asp:Parameter Name="aciklama" Type="String" />
                    <asp:Parameter Name="resim" Type="String" />
                    <asp:Parameter Name="kategori" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="adi" Type="String" />
                    <asp:Parameter Name="aciklama" Type="String" />
                    <asp:Parameter Name="resim" Type="String" />
                    <asp:Parameter Name="kategori" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <asp:Panel ID="Panel4" runat="server">
            <table style="width:34%;">
                <tr>
                    <td style="width: 14px">Başlık</td>
                    <td style="width: 289px">Link</td>
                </tr>
                <tr>
                    <td style="width: 14px">
                        <asp:TextBox ID="tmenuitem1txBox" runat="server" Width="247px"></asp:TextBox>
                    </td>
                    <td style="width: 289px">
                        <asp:TextBox ID="tmenulink1txBox" runat="server" Width="287px" style="margin-left: 0px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 14px">
                        <asp:TextBox ID="tmenuitem2txBox" runat="server" Width="247px"></asp:TextBox>
                    </td>
                    <td style="width: 289px">
                        <asp:TextBox ID="tmenulink2txBox" runat="server" Width="287px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 14px">
                        <asp:TextBox ID="tmenuitem3txBox" runat="server" Width="247px"></asp:TextBox>
                    </td>
                    <td style="width: 289px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 14px">
                        <asp:TextBox ID="tmenuitem4txBox" runat="server" Width="247px"></asp:TextBox>
                    </td>
                    <td style="width: 289px">
                        <asp:TextBox ID="tmenulink4txBox" runat="server" Width="287px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 14px">
                        <asp:Button ID="tmenukaydetBtn" runat="server" OnClick="tmenukaydetBtn_Click" Text="Kaydet" Width="143px" />
                    </td>
                    <td>
                        <asp:Button ID="tmenuBtn" runat="server" OnClick="tmenuBtn_Click" Text="Getir" Width="120px" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel5" runat="server">
            <table style="width:58%;">
                <tr>
                    <td style="width: 125px" Valign="top">Foother Kısım 1:<br />
                        <asp:TextBox ID="f1bTextBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="f1iTextBox" runat="server" Height="208px" TextMode="MultiLine" Width="418px"></asp:TextBox>
                    </td>
                    <td>
                        <%= icerik[0] %>
                    </td>
                </tr>
                <tr>
                    <td style="width: 125px" Valign="top">Foother Kısım 2:<br />
                        <asp:TextBox ID="f2bTextBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="f2iTextBox" runat="server" Height="208px" TextMode="MultiLine" Width="418px"></asp:TextBox>
                    </td>
                    <td>
                        <%= icerik[1] %>
                    </td>
                </tr>
                <tr>
                    <td style="width: 125px" Valign="top">Foother Kısım 3:<br />
                        <asp:TextBox ID="f3bTextBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="f3iTextBox" runat="server" Height="208px" TextMode="MultiLine" Width="418px"></asp:TextBox>
                    </td>
                    <td>
                        <%= icerik[2] %>
                    </td>
                </tr>
                <tr>
                    <td style="width: 125px" Valign="top">Foother Kısım 4:<br />
                        <asp:TextBox ID="f4bTextBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="f4iTextBox" runat="server" Height="208px" TextMode="MultiLine" Width="418px"></asp:TextBox>
                    </td>
                    <td>
                        <%= icerik[3] %>
                    </td>
                </tr>
                <tr>
                    <td style="width: 125px" Valign="top">Foother Kısım 5:<br />
                        <asp:TextBox ID="f5bTextBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="f5iTextBox" runat="server" Height="208px" TextMode="MultiLine" Width="418px"></asp:TextBox>
                    </td>
                    <td>
                        <%= icerik[4] %>
                    </td>
                </tr>
                <tr>
                    <td style="width: 125px" Valign="top">Foother Kısım 6:<br />
                        <asp:TextBox ID="f6bTextBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="f6iTextBox" runat="server" Height="208px" TextMode="MultiLine" Width="418px"></asp:TextBox>
                    </td>
                    <td>
                        <%= icerik[5] %>
                    </td>
                </tr>
                <tr>
                    <td style="width: 125px" Valign="top">Foother Kısım 7:<br />
                        <asp:TextBox ID="f7bTextBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="f7iTextBox" runat="server" Height="208px" TextMode="MultiLine" Width="418px"></asp:TextBox>
                    </td>
                    <td>
                        <%= icerik[6] %>
                    </td>
                </tr>
                <tr>
                    <td style="width: 125px" Valign="top">Foother Kısım 8:<br />
                        <asp:TextBox ID="f8bTextBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="f8iTextBox" runat="server" Height="208px" TextMode="MultiLine" Width="418px"></asp:TextBox>
                    </td>
                    <td>
                        <%= icerik[7] %>
                    </td>
                </tr>
                <tr>
                    <td style="width: 125px">
                        <asp:Button ID="fguncelleBtn" runat="server" Text="Kaydet" Width="126px" OnClick="fguncelleBtn_Click" />
                    </td>
                    <td>
                        <asp:Button ID="fgetirBtn" runat="server" OnClick="Button7_Click" Text="Getir" Width="126px" />
                    </td>
                    <td>

                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel6" runat="server"></asp:Panel>
    </form>
</asp:Content>
