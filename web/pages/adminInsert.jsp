<%@ page import="shop.Admins" %>
<%@ page import="shop.AdminsDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: baloy
  Date: 28-Feb-20
  Time: 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Insert</title>
    <link rel="stylesheet" href="../css/adminInsert.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="icon" href="../images/main/logo.png">
</head>
<body id="bod">
<div id="admin">
    <div id="admininsert">
        <h2>Admin Insert</h2>
        <form action="adminInsert.jsp" method="post">
            <input type="text" name="adminname" placeholder="Name">
            <input type="text" name="surname" placeholder="Surname">
            <input type="text" name="login" placeholder="Login">
            <input type="password" name="password" placeholder="Password">
            <input type="submit" name="submita" value="Insert Admin" class="sub">
        </form>
        <%
            String buttona = request.getParameter("submita");
            Admins admin = new Admins();

            if ("Insert Admin".equals(buttona)) {

                String name = request.getParameter("adminname");
                String surname = request.getParameter("surname");
                String login = request.getParameter("login");
                String password = request.getParameter("password");
                if (!name.isEmpty() && !surname.isEmpty() && !login.isEmpty() && !password.isEmpty()) {
                    admin.setName(name);
                    admin.setSurname(surname);
                    admin.setLogin(login);
                    admin.setPassword(password);
                    AdminsDAO.insertAdmin(admin);
                    out.print("<p class = green> Imported Successfully</p>");
                } else {
                    out.print("<p class='red'> Import Unable: Empty field</p>");
                }
            }
        %>
        <hr>
    </div>
    <div id="adminedit">
        <h2>Admin Search & Edit</h2>
        <form action="adminInsert.jsp" method="post">
            <input type="text" name="adminid" placeholder="ID" class="num">
            <input type="text" name="name" placeholder="Name">
            <input type="text" name="surname" placeholder="Surname">
            <input type="text" name="login" placeholder="Login">
            <input type="password" name="password" placeholder="Password">
            <input type="submit" name="aedit" VALUE="Search" class="sub">
            <input type="submit" name="aedit" VALUE="Update" class="sub">
            <input type="submit" name="aedit" VALUE="Delete" class="sub">
        </form>
        <%
            String buttonae = request.getParameter("aedit");
            Admins admins = new Admins();

            if ("Search".equals(buttonae)) {

                String aid = request.getParameter("adminid");
                String aname = request.getParameter("name");
                String asurname = request.getParameter("surname");
                String alogin = request.getParameter("login");

                if (aid.isEmpty() && aname.isEmpty() && asurname.isEmpty() && alogin.isEmpty()) {
                    AdminsDAO.adminFill();
                    out.print("<table id = 'admintable'>");
                    out.print("<tr id=bolt>" + "<td>" + "Admin ID" + "</td>" + "<td>" + "Name" + "</td>" +
                            "<td>" + "Surname" + "</td>" + "<td>" + "Login" + "</td>" + "</tr>");
                    for (Admins ad : AdminsDAO.getAdminsList()) {
                        out.print("<tr>");
                        out.print("<td>" + ad.getAdminid() + "</td>" +
                                "<td>" + ad.getName() + "</td>" +
                                "<td>" + ad.getSurname() + "</td>" +
                                "<td>" + ad.getLogin() + "</td>");
                        out.print("</tr>");
                    }
                    out.print("</table>");
                    AdminsDAO.getAdminsList().clear();
                }

                if (!aid.isEmpty() && aname.isEmpty() && asurname.isEmpty() && alogin.isEmpty()) {
                    try {
                        admins.setAdminid(Integer.parseInt(aid));
                        for (Admins ad : AdminsDAO.searchAdmins(admins)) {
                            if (Integer.parseInt(aid) == ad.getAdminid()) {
                                out.print("<table id = 'admintable'>");
                                out.print("<tr id=bolt>" + "<td>" + "Admin ID" + "</td>" + "<td>" + "Name" + "</td>" +
                                        "<td>" + "Surname" + "</td>" + "<td>" + "Login" + "</td>" + "</tr>");
                                out.print("<tr>");
                                out.print("<td>" + ad.getAdminid() + "</td>" +
                                        "<td>" + ad.getName() + "</td>" +
                                        "<td>" + ad.getSurname() + "</td>" +
                                        "<td>" + ad.getLogin() + "</td>");
                                out.print("<tr>");
                                out.print("</table>");
                            }
                        }
                        if (AdminsDAO.searchAdmins(admins).size() == 0) {
                            out.print("<p class = red> Nothing Found!</p>");
                        }
                    } catch (NumberFormatException ne) {
                        out.print("<p class = red> Wrong Type! </p>");
                    }
                }

                if (aid.isEmpty() && !aname.isEmpty() && asurname.isEmpty() && alogin.isEmpty()) {
                    admins.setName(aname);
                    for (Admins ad : AdminsDAO.searchAdmins(admins)) {
                        if (ad.getName().toLowerCase().contains(aname.toLowerCase())) {
                            out.print("<table id = 'admintable'>");
                            out.print("<tr id=bolt>" + "<td>" + "Admin ID" + "</td>" + "<td>" + "Name" + "</td>" +
                                    "<td>" + "Surname" + "</td>" + "<td>" + "Login" + "</td>" + "</tr>");
                            out.print("<tr>");
                            out.print("<td>" + ad.getAdminid() + "</td>" +
                                    "<td>" + ad.getName() + "</td>" +
                                    "<td>" + ad.getSurname() + "</td>" +
                                    "<td>" + ad.getLogin() + "</td>");
                            out.print("<tr>");
                            out.print("</table>");
                        }
                    }
                    if (AdminsDAO.searchAdmins(admins).size() == 0) {
                        out.print("<p class = red> Nothing Found</p>");
                    }
                }

                if (aid.isEmpty() && aname.isEmpty() && !asurname.isEmpty() && alogin.isEmpty()) {
                    admins.setSurname(asurname);
                    for (Admins ad : AdminsDAO.searchAdmins(admins)) {
                        if (ad.getSurname().toLowerCase().contains(asurname.toLowerCase())) {
                            out.print("<table id = 'admintable'>");
                            out.print("<tr id=bolt>" + "<td>" + "Admin ID" + "</td>" + "<td>" + "Name" + "</td>" +
                                    "<td>" + "Surname" + "</td>" + "<td>" + "Login" + "</td>" + "</tr>");
                            out.print("<tr>");
                            out.print("<td>" + ad.getAdminid() + "</td>" +
                                    "<td>" + ad.getName() + "</td>" +
                                    "<td>" + ad.getSurname() + "</td>" +
                                    "<td>" + ad.getLogin() + "</td>");
                            out.print("<tr>");
                            out.print("</table>");
                        }
                    }
                    if (AdminsDAO.searchAdmins(admins).size() == 0) {
                        out.print("<p class = red> Nothing Found</p>");
                    }
                }

                if (aid.isEmpty() && aname.isEmpty() && asurname.isEmpty() && !alogin.isEmpty()) {

                    admins.setLogin(alogin);
                    for (Admins ad : AdminsDAO.searchAdmins(admins)) {
                        if (ad.getLogin().toLowerCase().contains(alogin.toLowerCase())) {
                            out.print("<table id = 'admintable'>");
                            out.print("<tr id=bolt>" + "<td>" + "Admin ID" + "</td>" + "<td>" + "Name" + "</td>" +
                                    "<td>" + "Surname" + "</td>" + "<td>" + "Login" + "</td>" + "</tr>");
                            out.print("<tr>");
                            out.print("<td>" + ad.getAdminid() + "</td>" +
                                    "<td>" + ad.getName() + "</td>" +
                                    "<td>" + ad.getSurname() + "</td>" +
                                    "<td>" + ad.getLogin() + "</td>");
                            out.print("<tr>");
                            out.print("</table>");
                        }
                    }
                    if (AdminsDAO.searchAdmins(admins).size() == 0) {
                        out.print("<p class = red> Nothing Found</p>");
                    }
                }
            }

            if ("Update".equals(buttonae)) {
                String adid = request.getParameter("adminid");
                String aname = request.getParameter("name");
                String asurname = request.getParameter("surname");
                String alogin = request.getParameter("login");
                String apass = request.getParameter("password");

                if (!adid.isEmpty() && !aname.isEmpty() && !asurname.isEmpty() && !alogin.isEmpty() && !apass.isEmpty()) {
                    try {
                        admins.setAdminid(Integer.parseInt(adid));
                        admins.setName(aname);
                        admins.setSurname(asurname);
                        admins.setLogin(alogin);
                        admins.setPassword(apass);
                        AdminsDAO.updateAdmins(admins);
                        out.print("<p class = green> Updated Successfully</p>");
                    } catch (NumberFormatException e) {
                        out.print("<p class = red> Wrong Type! </p>");
                    }
                } else {
                    out.print("<p class='red'> Import Unable: Empty field</p>");
                }
            }
            if ("Delete".equals(buttonae)) {
                String id = request.getParameter("adminid");
                if (!id.isEmpty()) {
                    try {
                        admins.setAdminid(Integer.parseInt(id));
                        AdminsDAO.deleteAdmin(admins);
                        out.print("<p class = green> Deleted Successfully</p>");
                    } catch (NumberFormatException e) {
                        out.print("<p class = red> Wrong Type! </p>");
                    }
                } else {
                    out.print("<p class = red> Please Enter Admin`s ID</p>");
                }
            }
        %>
        <hr>
    </div>
</div>
<div id="back">
    <a href="admin.jsp"> &#60; Back</a>
    <form action="adminInsert.jsp" style="display: inline;margin-left: 8%;">
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
</body>
</html>