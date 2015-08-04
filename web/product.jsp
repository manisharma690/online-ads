
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Credentials.Connect"%>
<!DOCTYPE html>
<%
    Connection conn = Connect.getConnection();
    PreparedStatement psmt = null;
    ResultSet rs = null;
    psmt = conn.prepareStatement("SELECT * FROM product");
    rs = psmt.executeQuery();
    Connect cnt = new Connect();
    if(request.getParameter("did") != null){
        cnt.setdata("DELETE from product where productID= " +request.getParameter("did") );
    }

%>
<html>
    <head>
        
   <link rel="stylesheet" href="home.css">
   <style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    width: 100%;
    border-collapse: collapse;
}

#customers td, #customers th {
    font-size: 1em;
    border: 1px solid #98bf21;
    padding: 3px 7px 2px 7px;
}

#customers th {
    font-size: 1.1em;
    text-align: left;
    padding-top: 5px;
    padding-bottom: 4px;
    background-color: #A7C942;
    color: #ffffff;
}

#customers tr.alt td {
    color: #000000;
    background-color: #EAF2D3;
}
</style>
    </head>


       <body>
        <header>

            <img src="./image/logo.jpg" alt="OneClick" height="85" width= "85">
            <h1>One Click</h1>
            <h2> Easy to find </h2>

            <nav>
                <ul>
                    <li><a  href = "index.html"> Home </a></li>
                    <li><a class = "current" href = "product.jsp">Product List</a></li>
                    <li><a href="addProduct.jsp" name="add">Add Product</a></li>
                    <li><a href="register.jsp" name="register">Register</a></li>
                    <li><a href="login.jsp" name="login">Login</a></li>
                    <li><a href="logout.jsp" name="logout">LogOut</a></li>
                </ul>
            </nav>

        </header>


        <section>
            <table id="customers" >
                        <tr >
                            <th> Title</th>
                            <th >Description</th>
                            <th>Email</th>
                            <th>Price</th>          
                            <th>Phone</th>
                            <th>Location</th>
                            <th>Delete</th>
                            <th>Edit</th>
                        </tr>
                        <tr>
                            <% 
								int count = 1;
                                while (rs.next()) {
                            %>
                        <tr>

                            <td><%=rs.getString("title")%></td>
                            <td><%=rs.getString("description")%></td>
                            <td><%=rs.getString("email")%></td>
                            <td><%=rs.getString("price")%></td>
                            <td><%=rs.getString("phone")%></td>
                            <td><%=rs.getString("location")%></td> 

                            <td><b><span lang="en-us"><a href="?did=<%=rs.getString("productID")%>">Delete</a></span></b></td>
                            <td><b><span lang="en-us"><a href="?eid=<%=rs.getString("productID")%>">Edit</a></span></b></td>
                       
                        </tr>
                        <%
                                count++;   /// increment of counter
                            } /// End of while loop
%>
                        </tr>

                    </table>



            <div id="result"></div>
      
        </section>
        <footer>
            <p>&#169; 2015 Manish Sharma</p>
        </footer>
    </body>
</html>
