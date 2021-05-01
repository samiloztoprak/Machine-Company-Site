<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="loginorregister.aspx.cs" Inherits="DalliMakina.loginorregister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <form id="form1" runat="server">
        <center>
            <table style="width:100%;">
                <tr>
                    <td style="width: 575px">
                        <table style="width:38%;">
                            <tr>
                                <td style="width: 91px">Kullanıcı Adı:</td>
                                <td>
                                    <asp:TextBox ID="gkadiTxBox" runat="server" Width="258px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 91px">Şifre:</td>
                                <td>
                                    <asp:TextBox ID="gsifreTxBox" runat="server" TextMode="Password" Width="258px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 91px; height: 22px;"></td>
                                <td style="height: 22px">
                                    <center><asp:Button ID="girisBtn" runat="server" Text="Giriş" Width="127px" style="margin-left: 0px" OnClick="girisBtn_Click" /></center>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table style="width: 57%; height: 97px;">
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
                                <td style="width: 94px">Soy Adı:</td>
                                <td>
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
                                    <asp:TextBox ID="sifreTxBox" runat="server" Width="258px" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 94px">&nbsp;</td>
                                <td>
                                    <center><asp:Button ID="kayitBtn" runat="server" Text="Kayıt Ol" Width="127px" OnClick="kayitBtn_Click" /></center>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

            </table>
            </center>
            <asp:Label ID="sncTxt" runat="server"></asp:Label>
        
    </form>



</asp:Content>
