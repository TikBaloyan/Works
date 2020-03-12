<%@ page import="shop.*" %>
<%--
  Created by IntelliJ IDEA.
  User: baloy
  Date: 22-Feb-20
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Panel</title>
    <link rel="stylesheet" href="../css/admin.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="icon" href="../images/main/logo.png">
</head>
<body id="bod">
<%
    if (session.getAttribute("Login") != null) {
%>
<div id="welcome">
    <div id="welcomeh1"><h1>WELLCOME DEAR <%= AdminsDAO.adminName((String) session.getAttribute("Login")) %>
    </h1></div>
    <div id="logout">
        <form action="admin.jsp">
            <input type="submit" name="lout" value="Log Out" id="lout">
            <img src="../images/main/logout.svg" width="22" height="22" alt="Log Out">

            <%
                String buttonLog = request.getParameter("lout");
                if ("Log Out".equals(buttonLog)) {
                    out.print("K");
                    session.invalidate();
                    response.sendRedirect("../index.jsp");
                }
            %>
        </form>
    </div>
</div>
<br>
<div id="header">
    <div id="cat">
        <h2>Category Insert</h2>
        <form action="admin.jsp" method="post">
            <input type="text" name="category" placeholder="Category name">
            <input type="text" name="categorysrc" placeholder="Category Image Source">
            <input type="submit" name="cinsert" value="Insert Category" class="sub">
        </form>
        <%
            String buttonci = request.getParameter("cinsert");
            Categories categories = new Categories();

            if ("Insert Category".equals(buttonci)) {
                String name = request.getParameter("category");
                String src = request.getParameter("categorysrc");

                if (!name.isEmpty() && !src.isEmpty()) {
                    categories.setName(name);
                    categories.setSrc(src);
                    CategoriesDAO.insertCategories(categories);
                    out.print("<p class='green'>" + "Imported Successfully" + "</p>");
                } else {
                    out.print("<p class='red'> Import Unable: Empty field</p>");
                }
            }
        %>
    </div>
    <hr>
    <div id="editcat">
        <h2>Category Search & Edit</h2>
        <form action="admin.jsp" method="post">
            <input type="text" name="catid" placeholder="ID" class="num">
            <input type="text" name="catname" placeholder="Category">
            <input type="text" name="catsrc" placeholder="Category Image Source">
            <input type="submit" name="cedit" VALUE="Search" class="sub">
            <input type="submit" name="cedit" VALUE="Update" class="sub">
            <input type="submit" name="cedit" VALUE="Delete" class="sub">
        </form>
        <div id="resultc"><%
            String buttonc = request.getParameter("cedit");
            if ("Search".equals(buttonc)) {
                String id = request.getParameter("catid");
                String name = request.getParameter("catname");
                if (!id.isEmpty() && name.isEmpty()) {
                    try {
                        categories.setCatid(Integer.parseInt(id));
                        for (Categories cat : CategoriesDAO.searchCategories(categories)) {
                            if (Integer.parseInt(id) == categories.getCatid()) {
                                out.print("<table id = 'cattable'>");
                                out.print("<tr id=bolt>" + "<td>" + "Categories ID" + "</td>" + "<td>" + "Name" + "</td>");
                                out.print("<tr>");
                                out.print("<td>" + cat.getCatid() + "</td>" +
                                        "<td>" + cat.getName() + "</td>");
                                out.print("</tr>");
                                out.print("</table>");
                            }
                        }
                        if (CategoriesDAO.searchCategories(categories).size() == 0) {
                            out.print("<p class = red> Nothing Found!</p>");
                        }
                    } catch (NumberFormatException e) {
                        out.print("<p class = red> Wrong Type! </p>");
                    }
                }
                if (id.isEmpty() && !name.isEmpty()) {
                    categories.setName(name);
                    for (Categories cat : CategoriesDAO.searchCategories(categories)) {
                        if (cat.getName().toLowerCase().contains(name.toLowerCase())) {
                            out.print("<table id = 'cattable'>");
                            out.print("<tr id=bolt>" + "<td>" + "Categories ID" + "</td>" + "<td>" + "Name" + "</td>");
                            out.print("<tr>");
                            out.print("<td>" + cat.getCatid() + "</td>" +
                                    "<td>" + cat.getName() + "</td>");
                            out.print("</tr>");
                            out.print("</table>");
                        }
                    }
                    if (CategoriesDAO.searchCategories(categories).size() == 0) {
                        out.print("<p class = red> Nothing Found!</p>");
                    }
                }
            }
            if ("Update".equals(buttonc)) {
                String id = request.getParameter("catid");
                String name = request.getParameter("catname");
                String src = request.getParameter("catsrc");

                if (!id.isEmpty() && !name.isEmpty() && !src.isEmpty()) {
                    try {
                        categories.setCatid(Integer.parseInt(id));
                        categories.setName(name);
                        categories.setSrc(src);
                        if (CategoriesDAO.updateCategories(categories)) {
                            out.print("<p class = green> Updated Successfully</p>");
                        } else {
                            out.print("<p class='red'> Update Unable: Can't Find Category ID </p>");
                        }
                    }catch (NumberFormatException e){
                        out.print("<p class = red> Wrong Type! </p>");
                    }
                } else {
                    out.print("<p class='red'> Update Unable: Empty field </p>");
                }
            }
            if ("Delete".equals(buttonc)) {
                String id = request.getParameter("catid");
                if (!id.isEmpty()) {
                    try {
                        categories.setCatid(Integer.parseInt(id));
                        CategoriesDAO.deleteCategories(categories);
                        out.print("<p class = green> Deleted Successfully</p>");
                    }catch (NumberFormatException e){
                        out.print("<p class = red> Wrong Type! </p>");
                    }
                } else {
                    out.print("<p class = red> Please Enter Categories ID</p>");
                }
            }
        %></div>
    </div>
    <hr>
    <div id="prod">
        <h2>Product Insert</h2>
        <form action="admin.jsp" method="post">
            <input type="text" name="model" placeholder="Model">
            <input type="text" name="price" placeholder="Price" class="num">
            <input type="text" name="countp" placeholder="Count" class="num">
            <input type="text" name="catid" placeholder="CategoryID" class="num">
            <input type="submit" name="pinsert" VALUE="Insert Product" class="sub">
        </form>
        <%
            String buttonpi = request.getParameter("pinsert");

            Products products = new Products();
            if ("Insert Product".equals(buttonpi)) {
                String model = request.getParameter("model");
                String price = request.getParameter("price");
                String count = request.getParameter("countp");
                String catid = request.getParameter("catid");

                if (!model.isEmpty() && !price.isEmpty() && !count.isEmpty() && !catid.isEmpty()) {
                    products.setModel(model);
                    products.setPrice(Integer.parseInt(price));
                    products.setCount(Integer.parseInt(count));
                    products.setCatid(Integer.parseInt(catid));
                    if (ProductsDAO.insertProducts(products)) {
                        out.print("<p class='green'>" + "Imported Successfully" + "</p>");
                    } else {
                        out.print("<p class='red'> Inputed Categories ID Doesn`t exist</p>");
                    }
                } else {
                    out.print("<p class='red'> Import Unable: Empty field</p>");
                }
            }
        %>
    </div>
    <hr>
    <div id="editprod">
        <h2>Product Search & Edit</h2>
        <form action="admin.jsp" method="post">
            <input type="text" name="prodidedit" placeholder="ID" class="num">
            <input type="text" name="modeledit" placeholder="Model">
            <input type="text" name="priceedit" placeholder="Price" class="num">
            <input type="text" name="countedit" placeholder="Count" class="num">
            <input type="text" name="catidedit" placeholder="CategoryID" class="num">
            <input type="submit" name="pedit" VALUE="Search" class="sub">
            <input type="submit" name="pedit" VALUE="Update" class="sub">
            <input type="submit" name="pedit" VALUE="Delete" class="sub">
        </form>
        <div id="resultp"><%
            String buttonp = request.getParameter("pedit");
            if ("Search".equals(buttonp)) {
                String prodid = request.getParameter("prodidedit");
                String model = request.getParameter("modeledit");
                String price = request.getParameter("priceedit");
                String count = request.getParameter("countedit");
                String catid = request.getParameter("catidedit");

                if (prodid.isEmpty() && model.isEmpty() && price.isEmpty() && count.isEmpty() && catid.isEmpty()) {
                    ProductsDAO.productFill();
                    out.print("<table id = 'prodtable'>");
                    out.print("<tr id=bolt>" + "<td>" + "Products ID" + "</td>" + "<td>" + "Model" + "</td>" +
                            "<td>" + "Price" + "</td>" + "<td>" + "Count" + "</td>" + "<td>" + "Categories ID" + "</td>" + "</tr>");
                    for (Products ad : ProductsDAO.getProductsList()) {
                        out.print("<tr>");
                        out.print("<td>" + ad.getProdid() + "</td>" +
                                "<td>" + ad.getModel() + "</td>" +
                                "<td>" + ad.getPrice() + "</td>" +
                                "<td>" + ad.getCount() + "</td>" +
                                "<td>" + ad.getCatid() + "</td>");
                        out.print("</tr>");
                    }
                    out.print("</table>");
                    ProductsDAO.getProductsList().clear();
                }
                if (!prodid.isEmpty() && model.isEmpty() && price.isEmpty() && count.isEmpty() && catid.isEmpty()) {
                    try {
                        products.setProdid(Integer.parseInt(prodid));
                        for (Products prod : ProductsDAO.searchProducts(products)) {
                            if (Integer.parseInt(prodid) == products.getProdid()) {
                                out.print("<table id = 'prodtable'>");
                                out.print("<tr id=bolt>" + "<td>" + "Products ID" + "</td>" + "<td>" + "Model" + "</td>" +
                                        "<td>" + "Price" + "</td>" + "<td>" + "Count" + "</td>" + "<td>" + "Categories ID" + "</td>" + "</tr>");
                                out.print("<tr>");
                                out.print("<td>" + prod.getProdid() + "</td>" +
                                        "<td>" + prod.getModel() + "</td>" +
                                        "<td>" + prod.getPrice() + "</td>" +
                                        "<td>" + prod.getCount() + "</td>" +
                                        "<td>" + prod.getCatid() + "</td>");
                                out.print("</tr>");
                                out.print("</table>");
                            }
                        }
                        if (ProductsDAO.searchProducts(products).size() == 0) {
                            out.print("<p class = red> Nothing Found!</p>");
                        }
                    } catch (NumberFormatException e) {
                        out.print("<p class = red> Wrong Type! </p>");
                    }
                }
                if (prodid.isEmpty() && !model.isEmpty() && price.isEmpty() && count.isEmpty() && catid.isEmpty()) {
                    products.setModel(model);
                    out.print("<table id = 'prodtable'>");
                    out.print("<tr id=bolt>" + "<td>" + "Products ID" + "</td>" + "<td>" + "Model" + "</td>" +
                            "<td>" + "Price" + "</td>" + "<td>" + "Count" + "</td>" + "<td>" + "Categories ID" + "</td>" + "</tr>");
                    for (Products prod : ProductsDAO.searchProducts(products)) {

                        if (prod.getModel().toLowerCase().contains(model.toLowerCase())) {

                            out.print("<tr>");
                            out.print("<td>" + prod.getProdid() + "</td>" +
                                    "<td>" + prod.getModel() + "</td>" +
                                    "<td>" + prod.getPrice() + "</td>" +
                                    "<td>" + prod.getCount() + "</td>" +
                                    "<td>" + prod.getCatid() + "</td>");
                            out.print("</tr>");
                        }
                    }
                    if (ProductsDAO.searchProducts(products).size() == 0) {
                        out.print("<tr><td colspan='5'><p class = red> Nothing Found!</p></td></tr>");
                    }
                    out.print("</table>");

                }
                if (prodid.isEmpty() && model.isEmpty() && !price.isEmpty() && count.isEmpty() && catid.isEmpty()) {
                    try {
                        products.setPrice(Integer.parseInt(price));
                        out.print("<table id = 'prodtable'>");
                        out.print("<tr id=bolt>" + "<td>" + "Products ID" + "</td>" + "<td>" + "Model" + "</td>" +
                                "<td>" + "Price" + "</td>" + "<td>" + "Count" + "</td>" + "<td>" + "Categories ID" + "</td>" + "</tr>");
                        for (Products prod : ProductsDAO.searchProducts(products)) {
                            if (Integer.parseInt(price) == products.getPrice()) {
                                out.print("<tr>");
                                out.print("<td>" + prod.getProdid() + "</td>" +
                                        "<td>" + prod.getModel() + "</td>" +
                                        "<td>" + prod.getPrice() + "</td>" +
                                        "<td>" + prod.getCount() + "</td>" +
                                        "<td>" + prod.getCatid() + "</td>");
                                out.print("</tr>");
                            }
                        }
                        if (ProductsDAO.searchProducts(products).size() == 0) {
                            out.print("<tr><td colspan='5'><p class = red> Nothing Found!</p></td></tr>");
                        }
                        out.print("</table>");
                    } catch (NumberFormatException e) {
                        out.print("<p class = red> Wrong Type! </p>");
                    }
                }
                if (prodid.isEmpty() && model.isEmpty() && price.isEmpty() && !count.isEmpty() && catid.isEmpty()) {
                    try {
                        products.setCount(Integer.parseInt(count));
                        out.print("<table id = 'prodtable'>");
                        out.print("<tr id=bolt>" + "<td>" + "Products ID" + "</td>" + "<td>" + "Model" + "</td>" +
                                "<td>" + "Price" + "</td>" + "<td>" + "Count" + "</td>" + "<td>" + "Categories ID" + "</td>" + "</tr>");
                        for (Products prod : ProductsDAO.searchProducts(products)) {
                            if (Integer.parseInt(count) == products.getCount()) {
                                out.print("<tr>");
                                out.print("<td>" + prod.getProdid() + "</td>" +
                                        "<td>" + prod.getModel() + "</td>" +
                                        "<td>" + prod.getPrice() + "</td>" +
                                        "<td>" + prod.getCount() + "</td>" +
                                        "<td>" + prod.getCatid() + "</td>");
                                out.print("</tr>");
                            }
                        }
                        if (ProductsDAO.searchProducts(products).size() == 0) {
                            out.print("<tr><td colspan='5'><p class = red> Nothing Found!</p></td></tr>");
                        }
                        out.print("</table>");
                    } catch (NumberFormatException e) {
                        out.print("<p class = red> Wrong Type! </p>");
                    }
                }
                if (prodid.isEmpty() && model.isEmpty() && price.isEmpty() && count.isEmpty() && !catid.isEmpty()) {
                    try {
                        products.setCatid(Integer.parseInt(catid));
                        out.print("<table id = 'prodtable'>");
                        out.print("<tr id=bolt>" + "<td>" + "Products ID" + "</td>" + "<td>" + "Model" + "</td>" +
                                "<td>" + "Price" + "</td>" + "<td>" + "Count" + "</td>" + "<td>" + "Categories ID" + "</td>" + "</tr>");
                        for (Products prod : ProductsDAO.searchProducts(products)) {
                            if (Integer.parseInt(catid) == products.getCatid()) {
                                out.print("<tr>");
                                out.print("<td>" + prod.getProdid() + "</td>" +
                                        "<td>" + prod.getModel() + "</td>" +
                                        "<td>" + prod.getPrice() + "</td>" +
                                        "<td>" + prod.getCount() + "</td>" +
                                        "<td>" + prod.getCatid() + "</td>");
                                out.print("</tr>");
                            }
                        }
                        if (ProductsDAO.searchProducts(products).size() == 0) {
                            out.print("<tr><td colspan='5'><p class = red> Nothing Found!</p></td></tr>");
                        }
                        out.print("</table>");
                    } catch (NumberFormatException e) {
                        out.print("<p class = red> Wrong Type! </p>");
                    }
                }
            }
            if ("Update".equals(buttonp)) {
                String prodid = request.getParameter("prodidedit");
                String model = request.getParameter("modeledit");
                String price = request.getParameter("priceedit");
                String count = request.getParameter("countedit");
                String catid = request.getParameter("catidedit");

                if (!prodid.isEmpty() && !model.isEmpty() && !price.isEmpty() && !count.isEmpty() && !catid.isEmpty()) {
                    try {
                        products.setProdid(Integer.parseInt(prodid));
                        products.setModel(model);
                        products.setPrice(Integer.parseInt(price));
                        products.setCount(Integer.parseInt(count));
                        products.setCatid(Integer.parseInt(catid));
                        if (ProductsDAO.updateProducts(products)) {
                            out.print("<p class = green> Updated Successfully</p>");
                        } else {
                            out.print("<p class='red'> Update Unable: Can't Find Category ID </p>");
                        }
                    }catch (NumberFormatException e){
                        out.print("<p class = red> Wrong Type! </p>");
                    }
                } else {
                    out.print("<p class='red'> Update Unable: Empty field </p>");
                }
            }
            if ("Delete".equals(buttonp)) {
                String id = request.getParameter("prodidedit");
                if (!id.isEmpty()) {
                    try {
                        products.setProdid(Integer.parseInt(id));
                        if (ProductsDAO.deleteProducts(products)) {
                            out.print("<p class = green> Deleted Successfully</p>");
                        } else {
                            out.print("<p class='red'> Inputed Product's ID Doesn`t exist</p>");
                        }
                    }catch (NumberFormatException e){
                        out.print("<p class = red> Wrong Type! </p>");
                    }
                } else {
                    out.print("<p class = red> Please Enter Products ID</p>");
                }
            }
        %></div>
        <hr>
    </div>
</div>
<div id="info">
    <h2>Category List</h2>
    <%
        out.print("<table id = 'categoriestable'>");
        CategoriesDAO.categoriesFill();
        out.print("<tr id=bolt>" + "<td>" + "Categories ID" + "</td>" + "<td>" + "Categories Name" + "</td>" + "</tr>");
        for (Categories ad : CategoriesDAO.getCategoriesList()) {
            out.print("<td>" + ad.getCatid() + "</td>" +
                    "<td>" + ad.getName() + "</td>");
            out.print("</tr>");
        }
        out.print("</table>");
        CategoriesDAO.categoriesList.clear();
    %>
    <br>
    <a href="adminInsert.jsp" id="ai">Insert Admin &#62;</a>
</div>
<%
    } else
        response.sendRedirect("../index.jsp");
%>
</body>
</html>