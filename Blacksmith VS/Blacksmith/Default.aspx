﻿<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Blacksmith._Default" %>

<asp:Content runat="server" ContentPlaceHolderID="HeadContent">
  <script src="/Scripts/moment.min.js"></script>
  <script src="/Scripts/ConvertDates.min.js"></script>
  <script src="/Scripts/ToggleFavorites.min.js"></script>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

  <header class="text-center">
    <h1>Blacksmith</h1>
    <p>Find and share links</p>
  </header>
  
  <%--  TODO pagination for both recent and popular--%>
  <section id="links" class="fluid-container row">

    <section id="popular" class="col-md-6">
      <h3>Popular Links</h3>
      <asp:ListView runat="server" ID="PopularLinksList"
        SelectMethod="PopularLinks"
        ItemType="Blacksmith.Models.Link">
        
        <LayoutTemplate>
          <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
          Page
          <asp:DataPager runat="server" PagedControlID="PopularLinksList"
            PageSize="10">
            <Fields>
              <asp:NumericPagerField ButtonType="Link"/>
            </Fields>
          </asp:DataPager>
        </LayoutTemplate>

        <ItemTemplate>
          <article>
            <img src="<%# Item.Favicon %>" alt="Favicon"/>
            <a href="Link?addr=<%# Item.Address %>">
              <%# Item.Address %>
            </a>            
            by 
            <a href="Profile?user=<%# Item.Submitter.UserName %>">
              <%# Item.Submitter.UserName %> 
            </a>
            
            <%--TODO add favorite category as a mouseover title--%>
            <button
              <%-- TODO generalize this non-logged in protection --%>
              <% if (User.Identity.IsAuthenticated) { %>
                   onclick="sendToggle('<%# Item.Address %>'); return false;"
              <% } else { %>
                   onclick="window.location='/Account/Register'; return false;"
              <% } %>
              class="btn btn-default btn-xs favorite-button">
              <span class='fav-indicator <%# HasFavorited(Item.Id) ? "star" : "no-star" %>'>
                <i class="fa fa-star star"></i>
                <i class="fa fa-star-o no-star"></i>
              </span>
              <span class="fav-count"><%# Item.Favorites.Count %></span>
            </button>
          
            <br />
          </article>
         </ItemTemplate>
        
      </asp:ListView>
    </section>

    <section id="recent" class="col-md-6">
      <h3>Recent Links</h3>
        <asp:ListView ID="RecentLinksView" runat="server"
          SelectMethod="RecentLinks"
          ItemType="Blacksmith.Models.Link">
          
          <LayoutTemplate>
          <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
          Page
          <asp:DataPager runat="server" PagedControlID="RecentLinksView"
            PageSize="10">
            <Fields>
              <asp:NumericPagerField ButtonType="Link"/>
            </Fields>
          </asp:DataPager>
        </LayoutTemplate>

          <ItemTemplate>
            <article>
              <img src="<%# Item.Favicon %>" alt="Favicon"/>
  <%--            <a href="<%#: GetRouteUrl("LinkByAddress", new { address = Item.Address }) %>">--%>
              <a href="Link?addr=<%# Item.Address %>">
                <%# Item.Address %>
              </a>            
              by 
              <a href="Profile?user=<%# Item.Submitter.UserName %>">
                <%# Item.Submitter.UserName %> 
              </a>
              <div class="date-container">
                <i class="fa fa-clock-o"></i> 
                <span class="date short-diff" title="Date submitted: <%# Item.Date %>"><%# Item.Date %></span>
              </div>
              
              <%--<img src="<%#: Item.Thumbnail %>" alt="Thumbnail"/>--%>
              <br />
            </article>
          </ItemTemplate>

        </asp:ListView>
      <br/><br />

    </section>
  </section>
</asp:Content>
