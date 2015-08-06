
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- ---------------------
Title: Term Project
Name: Manish Sharma
ID: c0653541
---------------------- -->

<!DOCTYPE html>

<html lang="en">
    <head>

        <meta charset="utf-8" />
        <title></title>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <link rel="stylesheet" href="email.css">
        <link rel="icon" href="../images/favicon.ico" type="images/png">
        <script src="http://code.jquery.com/jquery.min.js"></script>
        <script src="jquery.validate.min.js"></script>
        <script>
            $(document).ready(function() {

                $("#name").focus();
                $("#register_form").validate({
                    rules: {
                        email: {
                            required: true,
                            email: true
                        },
                        name: {
                            required: true
                        },
                        password: {
                            required: true,
                            minlength: 3
                        },
                        password2: {
                            required: true,
                            equalTo: "#password"

                        }
                    },
                    //            function getResult() {
                    //            $('#result').html('');
                    //                    $('#result').append("Registration Successful");
                    //                    $('#name').val('success');
                    //                    $('#email').val('');
                    //                    $('#password').val('');
                    //                    $(location).attr('index.jsp');
                    //            }

                    // Configure an On-Click Listener to Update the Form
                    //  $('#register').click(function() {


                    //Reference: http://runnable.com/UkmDoGPTV7wtAAja/how-to-use-jquery-validation-ajax-call-on-success
                    submitHandler: function() {
                        $.ajax({
                            url: "./web/advertise",
                            dataType: "json",
                            contentType: 'application/json; charset=UTF-8',
                            data: JSON.stringify({"name": $("#name").val(),
                                "email": $("#email").val(),
                                "password": $("#password").val()}),
                            method: "post",
                            success: function(data) {

                                alert('Registration successful');
                                $('#name').val('');
                                $('#email').val('');
                                $('#password').val('');
                                $('#password2').val('');
                                $('#result').html('Thank you For Registration');

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
                    <li><a href="addProduct.jsp" name="add">Add Product</a></li>
                    <li><a class = "current" href="register.jsp" name="register">Register</a></li>
                    <li><a href="login.jsp" name="login">Login</a></li>
                    <li><a href="logout.jsp" name="logput">LogOut</a></li>
                </ul>
            </nav>

        </header>

        <section>
            <form  id="register_form" class="cmxform">

                <label for="firstName">Name:</label>
                <input id="name" name="name" ></input>
                <label for="firstName">Email:</label>
                <input id="email" name="email"></input>
                <label for="firstName">Password:</label>
                <input id="password" name="password"></input>
                <label for="firstName">Re-Enter your Password:</label>
                <input id="password2" name="password2"></input>
                <button id="register" type="submit">Register</button>

                <div id="result"></div>

            </form>



        </section>
        <footer>
            <p>&#169; 2014 Vickykumar</p>
        </footer>
    </body>
</html>