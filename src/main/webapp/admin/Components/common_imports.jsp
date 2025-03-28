<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page errorPage="error_exception.jsp" %>

<%@ page import="java.util.List" %>
<%@ page import="gov.iti.Helper.ConnectionProvider" %>

<%@ page import="gov.iti.Dtos.*" %>
<%@ page import="gov.iti.Model.*" %>
<%@ page import="java.sql.Connection" %>

<%
    Admin activeAdmin = (Admin) session.getAttribute("activeAdmin");

    Connection connection = ConnectionProvider.getConnection();

    AdminDao adminDao = new AdminDao(connection);
    List<Admin> adminList = adminDao.getAllAdmin();

    CategoryDao catDao = new CategoryDao(connection);
    List<Category> categoryList = catDao.getAllCategories();

    ProductDao productDao = new ProductDao(connection);

    OrderDao orderDao = new OrderDao(connection);
    List<Order> orderList = orderDao.getAllOrder();

    OrderedProductDao ordProdDao = new OrderedProductDao(connection);

    UserDao userDao = new UserDao(connection);
%>
