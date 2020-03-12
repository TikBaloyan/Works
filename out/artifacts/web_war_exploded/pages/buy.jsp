<%@ page import="shop.Cart" %>
<%@ page import="shop.CartDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: baloy
  Date: 09-Mar-20
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Buy</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="icon" href="../images/main/logo.png">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/cart.css">
    <script src="../js/main.js"></script>
    <meta charset="utf-8">
</head>
<body>
<div id="head">
    <a href="#">
        <div id="logo">
            <a href="login.jsp">
                <img src="../images/main/logo.png" alt="Logo">
            </a>
        </div>
    </a>
    <div id="head1">
        <div id="searchbar">
            <form action="search.jsp" method="get">
                <div id="searchtext"><input type="text" name="searchtext" placeholder="Search..."></div>
                <div id="searchbtn">
                    <button type="submit"><i class="fa fa-search fa-2x"></i></button>
                </div>
            </form>
        </div>
        <a href="cart.jsp" style="color: black">
            <div id="shopping">
                <i class="fa fa-shopping-cart fa-2x" style="vertical-align: middle"></i>
                <span style="font-size: 20px;margin-left: 2%">Cart</span>
            </div>
        </a>
    </div>
    <div id="head2">
        <ul class="nav justify-content-center">
            <li class="nav-item">
                <a class="nav-link" href="categories/motherboard.jsp">Motherboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="categories/processor.jsp">Processor</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="categories/videocard.jsp">Videocard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="categories/powersupply.jsp">Power Supply</a>
            </li>
            <li class="nav-item">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                            style="background: none; border: none">
                        Other
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="categories/monitor.jsp">Monitor</a>
                        <a class="dropdown-item" href="categories/hdd-ssd.jsp">HDD/SSD</a>
                        <a class="dropdown-item" href="categories/ram.jsp">RAM</a>
                        <a class="dropdown-item" href="categories/accessories.jsp">Accessories</a>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>

<div class="query">
    <%
        for (Cart cart : CartDAO.cartItems) {
            out.print("<div class='res'>");
            out.print("<img src='../images/main/product/" + cart.getSrc() + "' width='230' height='210'>");
            out.print("<h3>" + cart.getModel() + "</h3>");
            out.print("<h4>" + cart.getPrice() + " AMD</h4>");
            out.print("</div>");
        }
    %>
</div>
<div class="query">
    <h2 style="color:green;text-align: center">You successfully bought these products</h2>
</div>
<%@ include file="footer.jsp" %>
