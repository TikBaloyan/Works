<%@ page import="shop.AdminsDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String log = request.getParameter("log");
    String psw = request.getParameter("pass");
    boolean b = false;
    if (AdminsDAO.checkLP(log, psw)) {
        session.setAttribute("Login", log);
        response.sendRedirect("admin.jsp");

    } else {
        session.setAttribute("Error", b);
        response.sendRedirect("login.jsp");
    }
%>