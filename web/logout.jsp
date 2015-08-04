<% 
    session.removeAttribute("person");
    session.invalidate();
    response.sendRedirect("index.html");
%>