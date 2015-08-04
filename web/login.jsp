<%-- 
    Document   : login
    Created on : July-28-2015, 10:05:07 AM
    Author     : c0653541
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <link rel="stylesheet" href="style.css">
        <script src="http://code.jquery.com/jquery.min.js"></script>
        <script src="jquery.validate.min.js"></script>
        <script>
            $(document).ready(function() {

                $("#name").focus();
                $("#login_form").validate({
                    rules: {
                        email: {
                            required: true,
                            email: true
                        },
                        password: {
                            required: true

                        }
                    },
                    submitHandler: function() {
                        $.ajax({
                            url: "./web/advertise/login",
                            dataType: "text",
                            contentType: 'application/json; charset=UTF-8',
                            data: JSON.stringify({
                                "email": $("#email").val(),
                                "password": $("#password").val()}),
                            method: "post",
                            success: function(data) {
                                // $(location).attr('welcom.jsp');
                                if (data == 'success') {
                                 <% session.setAttribute("person", "user");%>
                                    alert('LogIN successful');
                                    $('#result').html('Welcome');
                                    window.location.replace("welcome.jsp"); //Reference: http://stackoverflow.com/questions/503093/how-can-i-make-a-redirect-page-using-jquery
                                }
                                else {
                                    alert('LogIN failed');
                                    $('#result').html('Please Enter Correct Email and Password');
                                    $('#result').css('color', 'red');
                                }
                            }
                        });
                    }
                });
                // Configure an On-Click Listener to Update the Form
//                $('#login').click(function() {
//                    
//                });

            });
        </script>
    </head>
    <body>
    
         <div class="container">

  <div id="login-form">

    <h3>Login</h3>

    <fieldset>

        <form id="login_form">

            <input required  type="email" id="email" placeholder="Email">
            <input type="password" id="password" placeholder="Password">
           <input type="submit" value="Login">

      

         <footer class="clearfix">

          <p></p>

        </footer>
      </form>

    </fieldset>

  </div> <!-- end login-form -->

</div>
    </body>
</html>
