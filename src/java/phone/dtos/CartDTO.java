/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phone.dtos;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author User
 */
public class CartDTO implements Serializable{
    private Map<String, OrderProductDTO> cart;

    public CartDTO() {
    }

    public CartDTO(Map<String, OrderProductDTO> cart) {
        this.cart = cart;
    }

    public Map<String, OrderProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, OrderProductDTO> cart) {
        this.cart = cart;
    }
    
    public void add(OrderProductDTO phone){
        if(this.cart == null){
            this.cart = new HashMap<>();
        }
        if(this.cart.containsKey(phone.getProductID())){
            int quantity = this.cart.get(phone.getProductID()).getQuantity();
            phone.setQuantity(quantity + phone.getQuantity());
        }
        this.cart.put(phone.getProductID(), phone);
    }
    
    public void delete(String id){
        if (this.cart == null){
            return;
        }
        if (this.cart.containsKey(id)){
            this.cart.remove(id);
        }
    }
    
    public void update(String id, OrderProductDTO phone){
        if (this.cart == null){
            return;
        }
        if (this.cart.containsKey(id)){
            this.cart.replace(id, phone);
        }
    }
}
