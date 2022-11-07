/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phone.dtos;

import java.io.Serializable;

/**
 *
 * @author User
 */
public class OrderProductDTO implements Serializable{
    private String productID;
    private String name;
    private String memory;
    private String ram;
    private String color;
    private String image;
    private int quantity;
    private double price;
    private String category;

    public OrderProductDTO() {
    }

    public OrderProductDTO(String productID, String name, String memory, String ram, String color, String image, int quantity, double price, String category) {
        this.productID = productID;
        this.name = name;
        this.memory = memory;
        this.ram = ram;
        this.color = color;
        this.image = image;
        this.quantity = quantity;
        this.price = price;
        this.category = category;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMemory() {
        return memory;
    }

    public void setMemory(String memory) {
        this.memory = memory;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }   

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
