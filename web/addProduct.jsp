<%-- 
    Document   : AddProduct
    Created on : July, 29 12:36:02 AM
    Author     : Manish Sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product Page</title>
        <link rel="stylesheet" href="email.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <script src="http://code.jquery.com/jquery.min.js"></script>
        <script src="jquery.validate.min.js"></script>
        <script>
            $(document).ready(function() {
                $("#title").focus();
                $("#addproduct_form").validate({
                    rules: {
                        email: {
                            required: true,
                            email: true
                        },
                        title: {
                            required: true
                        },
                        description: {
                            required: true

                        },
                        price: {
                            required: true
                        },
                        location: {
                            required: true
                        }
                    },
                    //Reference: http://runnable.com/UkmDoGPTV7wtAAja/how-to-use-jquery-validation-ajax-call-on-success
                    submitHandler: function() {
                        // $('#add').click(function() {
                        $.ajax({
                            url: "./web/advertise/add",
                            dataType: "json",
                            method: "post",
                            contentType: 'application/json; charset=UTF-8',
                            data: JSON.stringify({
                                "title": $("#title").val(),
                                "description": $("#description").val(),
                                "price": $("#price").val(),
                                "email": $("#email").val(),
                                "phone": $("#phone").val(),
                                "location": $("#location").val()
                            }),
                            success: function(data) {

                                alert('Product Added successfully');
                                $('#result').html('Product Added');
                                window.location.replace("product.jsp");
                            }
                        });
                    }
                });
            });
        </script>



    </head>
    <body>



        <header>

           <img src="./image/logo.jpg" alt="OneClick" height="85" width= "85">
            <h1>One Click</h1>
            <h2> Easy to find </h2>

            <nav>
                <ul>
                    <li><a  href = "index.html"> Home </a></li>
                    <li><a href = "product.jsp">Product List</a></li>
                    <li><a class = "current" href="addProduct.jsp" name="add">Add Product</a></li>
                    <li><a href="register.jsp" name="register">Register</a></li>
                    <li><a href="login.jsp" name="login">Login</a></li>
                    <li><a href="logout.jsp" name="logput">LogOut</a></li>
                </ul>
            </nav>

        </header>

        <section>
            <form  id="addproduct_form">


                <label for="title">Title:</label> <input id="title" name="title"></input>
                <label for="description">Description:</label>  <input id="description" name="description"></input>
                <label for="price">Price:</label>  <input id="price" name="price"></input>
                <label for="email">email:</label> <input id="email" name="email"></input>
                <label for="phone">Phone:</label>  <input id="phone" name="phone"></input>
                <label for="location">Location:</label>  <input id="location" name="location"></input>
                <button id="register" type="submit">Add Product</button>

                <div id="result"></div>

            </form>



        </section>
        <footer>
            <p>&#169; 2015 Manish Sharma</p>
        </footer>
    </body>
</html>
