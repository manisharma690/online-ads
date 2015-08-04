/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package personDetail;

import java.io.Serializable;
import javax.ejb.Stateful;
import javax.json.Json;
import javax.json.JsonObject;

/**
 *
 * @author c0653541
 */
@Stateful
public class Product implements Serializable{
    
    public String title;
    public String description;
    public String price;
    public String email;
    public String phone;
    public String location;

    public Product() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
    
     public Product(JsonObject json) {

        this.title = json.getString("title");
        this.description = json.getString("description");
        this.price = json.getString("price");
        this.email = json.getString("email");
        this.phone = json.getString("phone");
        this.location = json.getString("location");

    }

    public JsonObject toJSON() {
        JsonObject json = Json.createObjectBuilder()
                .add("title", this.title)
                .add("description", this.description)
                .add("price", this.price)
                .add("email", this.email)
                .add("phone", this.phone)
                .add("location", this.location)
                .build();
        return json;
    }
    
    
}
