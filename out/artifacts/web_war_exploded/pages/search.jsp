<%@ page import="shop.indexDAO" %>
<%@ page import="shop.searchResult" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Map" %>
<%@ page import="shop.Cart" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="shop.CartDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: baloy
  Date: 03-Mar-20
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search results for <%= request.getParameter("searchtext")%></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="icon" href="../images/main/logo.png">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/search.css">
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
<div id="search">
    <%
        String s = request.getParameter("searchtext");
        Map<Integer, searchResult> results = new HashMap<>();
        int i = 1;
        try {
            if (indexDAO.mainSearch(request.getParameter("searchtext")).size() > 0){
                for (searchResult sr : indexDAO.mainSearch(request.getParameter("searchtext"))) {
                    results.put(i,sr);
                    out.print("<div class='res'>");
                    out.print("<img src='../images/main/product/" + sr.getSrc() + "' width='230' height='210'>");
                    out.print("<h3>" + sr.getModel() + "</h3>");
                    out.print("<h4>" + sr.getPrice() + " AMD</h4>");
                    out.print("<form action='#' method='post'>");
                    out.print("<input type='submit' name='tocart"+i+"' id='tocart' value='Add to Cart'>");
                    out.print("</form>");
                    out.print("<p id='" + i + "'></p>");
                    out.print("</div>");
                    i++;
                }
            }else out.print("<h3 class='red'>Nothing found!</h3>");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    %>
    <%
        int j = 1;
        while (j <= i) {
            if ("Add to Cart".equals(request.getParameter("tocart" + j + ""))) {
                Cart cart = new Cart();
                cart.setSrc(results.get(j).getSrc());
                cart.setModel(results.get(j).getModel());
                cart.setPrice(results.get(j).getPrice());
                if (CartDAO.addToCart(cart)) {
    %>
    <script>
        document.getElementById(<%=j%>).innerHTML = "Added successfully";
        document.getElementById(<%=j%>).style.color = "green";
        setTimeout(function () {
            $('#<%=j%>').fadeOut('fast');
        }, 2000);
    </script>

    <%
    } else {
    %>
    <script>
        document.getElementById(<%=j%>).innerHTML = "Already in Cart";
        document.getElementById(<%=j%>).style.color = "red";
        setTimeout(function () {
            $('#<%=j%>').fadeOut('fast');
        }, 2000);
    </script>
    <%
                }
            }
            j++;
        }
    %>
</div>
<%@ include file="footer.jsp" %>
