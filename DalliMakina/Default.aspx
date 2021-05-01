<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DalliMakina._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="slider">
            <img src="content-img/slider-img.png" />
        </div>
        <div class="mainpage-blog">
            <div class="mainpage-blog-content-container">
                <div><img src="content-img/resim-1.jpg" /></div>
                <div class="mainpage-blog-content-container-content">
                    <p class="mainpage-blog-date">22 June 2018</p>
                    <p class="mainpage-blog-header">Wire Tube Düsseldorf Exhibition 2018</p>
                    <p class="mainpage-blog-content">Wire Tube Düsseldorf Exhibition 2018 photos of our booth</p>
                    <p class="readmore"><a href="#">Read More</a></p>
                </div>
                <div><img src="content-img/resim-1.jpg" /></div>
                <div class="mainpage-blog-content-container-content">
                    <p class="mainpage-blog-date">22 June 2018</p>
                    <p class="mainpage-blog-header">Wire Tube Düsseldorf Exhibition 2018</p>
                    <p class="mainpage-blog-content">Wire Tube Düsseldorf Exhibition 2018 photos of our booth</p>
                    <p class="readmore"><a href="#">Read More</a></p>
                </div>
            </div>
        </div>

        <form id="form1" runat="server">
            <div class="main-page-product">
                <div class="row">
                    <%= urunList %>
                    <%--<div class="cloumn">
                        <div class="main-page-product-container">
                                <img src="content-img/makine.jpg" />
                                <p class="main-page-product-container-header">DMI97 ÇEKME DOĞRULTMA VE KESME MAKİNESİ</p>
                                <p class="main-page-product-container-content">Makine Hızı  : 200 - 250 m/dk</p>
                                <p class="main-page-product-container-content">Üretim Hızı  : 1185 - 9260 kg/saat</p>
                            <div class="chart-grid">
                            
                                
                               <a href="#"> <img src="img/cart-icon.png" /></a>
                            </div>
                        </div>
                    </div>--%>
                    
                    
                    
                </div>
            </div>
        </form>

        <div class="map">
            <img src="img/harita.png" />
        </div>
        <div class="trust-us"><img src="img/trust-us.png" /> 
            
        </div>
</asp:Content>
