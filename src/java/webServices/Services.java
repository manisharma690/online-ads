/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webServices;

import Credentials.Connect;
import static Credentials.Connect.getConnection;
import java.io.Serializable;
import java.io.StringReader;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;
import personDetail.Person;
import personDetail.Product;

/*
 * @author c0653541
 */
@SessionScoped
@Path("/advertise")
public class Services implements Serializable {
    
    @EJB
    Person person;
    
    @EJB
    Product product;
    
    @GET
    @Produces("application/json")
    public Response get() {
        return Response.ok(getProducts("SELECT * FROM product")).build();
    }
    
    @GET
    @Path("{id}")
    @Produces("application/json")
    public Response getById(@PathParam("id") String id) {

        return Response.ok(getProducts("SELECT * FROM product WHERE productID=?", String.valueOf(id))).build();

    }
    
    @POST
    @Path("login")
    @Consumes("application/json")
    public String getUser(JsonObject json) {
        JsonArray array = null;
        String email = json.getString("email");
        String pass = json.getString("password");
        
        array = getResults("SELECT * FROM person WHERE email= ? AND password= ?", email, pass);
        
        for (javax.json.JsonValue jsonValue : array) {
            System.out.println(jsonValue);
        }
        if (array.size() > 0) {
            System.out.println("correct user detail");
            return "success";
            
        } else {
            System.out.println("incorrect user detail");
            return "fail";
        }
    }
    
    @POST
    @Consumes("application/json")
    public Response insertPerson(JsonObject json) {
        
        System.out.println("POST method called");
        
        Response result;
        try {
            // JsonObject json = Json.createReader(new StringReader(str)).readObject();
            String name = json.getString("name");
            String email = json.getString("email");
            String pass = json.getString("password");
            
            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO person (name, email, password) VALUES (?, ?, ?)");
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, pass);
            pstmt.executeUpdate();
            
            person.setName(name);
            person.setEmail(email);
            person.setPassword(pass);
            
            result = Response.ok(person.toJSON()).build();
            
        } catch (SQLException ex) {
            result = Response.status(500).entity(ex.getMessage()).build();
        }
        return result;
        
    }
    
    @POST
   
    @Path("add")
    @Consumes("application/json")
    public Response addProduct(JsonObject json) {
        
        System.out.println("POST method called for add product");
        
        Response result;
        try {
            
            String title = json.getString("title");
            String desc = json.getString("description");
            String price = json.getString("price");
            String email = json.getString("email");
            String phone = json.getString("phone");
            String location = json.getString("location");
            System.out.println(email);
            System.out.println(person.getEmail());
            System.out.println(title);
            
           // if (email.equals(person.getEmail())) {
                Connection conn = getConnection();
                PreparedStatement pstmt = conn.prepareStatement("INSERT INTO product (title, description, price,email,phone,location) VALUES (?, ?, ?, ?, ?, ?)");
                pstmt.setString(1, title);
                pstmt.setString(2, desc);
                pstmt.setString(3, price);
                pstmt.setString(4, email);
                pstmt.setString(5, phone);
                pstmt.setString(6, location);
                pstmt.executeUpdate();
                System.out.println(location);
                
                product = new Product(json);
                
                result = Response.ok(product.toJSON()).build();
        } catch (SQLException ex) {
            result = Response.status(500).entity(ex.getMessage()).build();
        }
        return result;
        
    }
    
     
  
    @DELETE
    @Path("{id}")
    @Produces("application/json")

    public Response deleteById(@PathParam("id") String id) {

        int result = doUpdate("DELETE FROM product where productID=? ", String.valueOf(id));

        if (result <= 0) {
            return Response.status(500).build();
        } else {
            return Response.ok("ProductID: "+id+ " record is deleted successfully from product").build();
        }
        // return Response.entity(getResult("SELECT * FROM product")).build();

    }
    
    
    public static JsonArray getResults(String sql, String... params) {
        JsonArray json = null;
        try {
            Connection conn = getConnection();
            System.out.println("hello");
            PreparedStatement pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                pstmt.setString(i + 1, params[i]);
            }
            ResultSet rs = pstmt.executeQuery();
            
            JsonArrayBuilder array = Json.createArrayBuilder();
            while (rs.next()) {
                array.add(Json.createObjectBuilder()
                        .add("id", rs.getInt("personID"))
                        .add("name", rs.getString("name"))
                        .add("email", rs.getString("email"))
                        .add("password", rs.getString("password"))
                );
            }
            json = array.build();
        } catch (SQLException ex) {
            // Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return json;
    }
    
    public static JsonArray getProducts(String sql, String... params) {
        JsonArray json = null;
        try {
            Connection conn = getConnection();
            
            PreparedStatement pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                pstmt.setString(i + 1, params[i]);
            }
            ResultSet rs = pstmt.executeQuery();
            
            JsonArrayBuilder array = Json.createArrayBuilder();
            while (rs.next()) {
                array.add(Json.createObjectBuilder()
                        .add("productID", rs.getInt("productID"))
                        .add("title", rs.getString("title"))
                        .add("description", rs.getString("description"))
                        .add("price", rs.getString("price"))
                        .add("email", rs.getString("email"))
                        .add("phone", rs.getString("phone"))
                        .add("location", rs.getString("location"))
                        
                );
            }
            json = array.build();
        } catch (SQLException ex) {
            // Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return json;
    }
    
     private int doUpdate(String query, String... parameter) {
        int change = 0;
        try (Connection conn = Connect.getConnection()) {
            PreparedStatement pstmt = conn.prepareStatement(query);
            for (int i = 1; i <= parameter.length; i++) {
                pstmt.setString(i, parameter[i - 1]);
            }
            change = pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Services.class.getName()).log(Level.SEVERE, null, ex);
        }
        return change;
    }
}
