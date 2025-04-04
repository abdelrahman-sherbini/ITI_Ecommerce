<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page errorPage="404.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="gov.iti.Helper.ConnectionProvider" %>
<%@ page import="gov.iti.Dtos.*" %>
<%@ page import="gov.iti.Model.*" %>
<%@ page import="java.sql.Connection" %>

<%

  User activeUser = (User) session.getAttribute("LoggedUser");
//
//
  Connection connection = ConnectionProvider.getConnection();

  WishlistDao wishlistDao = new WishlistDao(connection);

  OrderDao orderDao = new OrderDao(connection);
  List<Order> orders= orderDao.getAllOrderByUserId(activeUser.getUserId());


  int ordersPlaced=0;
  int ordersCanceled=0;
  int wishList=wishlistDao.getListByUserId(activeUser.getUserId()).size();
  for(Order o:orders){
    if(o.getStatus() != "Canceled")ordersPlaced++;
    else ordersCanceled++;
  }
%>
<div class="dash__pad-1">
  <ul class="dash__w-list">
    <li>
      <div class="dash__w-wrap">

        <span class="dash__w-icon dash__w-icon-style-1"><i class="fas fa-cart-arrow-down"></i></span>

        <span class="dash__w-text"><%=ordersPlaced%></span>

        <span class="dash__w-name">Orders Placed</span></div>
    </li>
    <li>
      <div class="dash__w-wrap">

        <span class="dash__w-icon dash__w-icon-style-2"><i class="fas fa-times"></i></span>

        <span class="dash__w-text"><%=ordersCanceled%></span>

        <span class="dash__w-name">Cancel Orders</span></div>
    </li>
    <li>
      <div class="dash__w-wrap">

        <span class="dash__w-icon dash__w-icon-style-3"><i class="far fa-heart"></i></span>

        <span class="dash__w-text"><%=wishList%></span>

        <span class="dash__w-name">Wishlist</span></div>
    </li>
  </ul>
</div>