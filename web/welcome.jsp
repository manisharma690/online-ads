<%-- 
    Document   : Welcome
    Created on : July-31-2015, 7:06:50 PM
    Author     : c0653541
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        <link rel="stylesheet" href="home.css">
    </head>


    <header>

        <img src="./image/logo.jpg" alt="OneClick" height="85" width= "85">
        <h1>One Click</h1>
        <h2> Easy to find </h2>

        <nav>
            <ul>
                <li><a class = "current" href = "index.html"> Home </a></li>
                <li><a href = "product.jsp">Product List</a></li>
                <li><a href="addProduct.jsp" name="add">Add Product</a></li>
                <li><a href="register.xhtml" name="register">Register</a></li>
                <li><a href="login.jsp" name="login">Login</a></li>
                <li><a href="logout.jsp" name="logput">LogOut</a></li>

            </ul>
        </nav>

    </header>


    <section>


        <h1>Welcome <%=session.getAttribute("person")%></h1>
        <a href="addProduct.jsp" name="add">Add Product</a>


    </section>
    <footer>
        <p>&#169; 2015 Manish Sharma</p>
    </footer>
</html>
