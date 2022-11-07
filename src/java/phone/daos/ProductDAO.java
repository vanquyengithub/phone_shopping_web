/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phone.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import phone.dtos.CategoryDTO;
import phone.dtos.ProductDTO;
import phone.utils.DBUtils;

/**
 *
 * @author User
 */
public class ProductDAO {
    
    Logger logger = Logger.getLogger(ProductDAO.class);
    
    public List<ProductDTO> getAllProductList() throws SQLException{
        List<ProductDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<CategoryDTO> cateList = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                cateList = getAllCategoryList();
                String sql = "SELECT productID, name, memory, ram, color, "
                        + "image, quantity, price, categoryID "
                        + " FROM tblProducts ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    if (list== null){
                        list = new ArrayList<>();
                    }
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    String memory = rs.getString("memory");
                    String ram = rs.getString("ram");
                    String color = rs.getString("color");
                    String image = rs.getString("image");
                    int quantity = rs.getInt("quantity");
                    long price = rs.getLong("price");
                    String categoryID = rs.getString("categoryID");
                    String category = "";
                    for (CategoryDTO cateDTO: cateList){
                        if (cateDTO.getCategoryID().equals(categoryID)){
                            category = cateDTO.getName();
                        }
                    }
                    list.add(new ProductDTO(productID, name, memory, ram, color, image, quantity, price, category));                    
                }
            }
        } catch (Exception e) {
            logger.error(e.toString());
        } finally {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            if (conn != null) conn.close();
        }
        return list;
    }

    public List<CategoryDTO> getAllCategoryList() throws SQLException{
        List<CategoryDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql = "SELECT categoryID, name "
                        + " FROM tblCategories ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    if (list== null){
                        list = new ArrayList<>();
                    }
                    String categoryID = rs.getString("categoryID");
                    String name = rs.getString("name");
                    list.add(new CategoryDTO(categoryID, name));                    
                }
            }
        } catch (Exception e) {
            logger.error(e.toString());
        } finally {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            if (conn != null) conn.close();
        }
        return list;
    }
    
    public List<ProductDTO> getSearchListProduct(String search) throws SQLException{
        List<ProductDTO> proList = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<CategoryDTO> cateList = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                cateList = getAllCategoryList();
                String sql = "SELECT productID, name, memory, ram, color, "
                        + "image, quantity, price, categoryID "
                        + " FROM tblProducts "
                        + " WHERE name like ?";;
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    if (proList== null){
                        proList = new ArrayList<>();
                    }
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    String memory = rs.getString("memory");
                    String ram = rs.getString("ram");
                    String color = rs.getString("color");
                    String image = rs.getString("image");
                    int quantity = rs.getInt("quantity");
                    long price = rs.getLong("price");
                    String categoryID = rs.getString("categoryID");
                    String category = "";
                    for (CategoryDTO cateDTO: cateList){
                        if (cateDTO.getCategoryID().equals(categoryID)){
                            category = cateDTO.getName();
                        }
                    }                    
                    proList.add(new ProductDTO(productID, name, memory, ram, color, image, quantity, price, category));                    
                }
            }
        } catch (Exception e) {
            logger.error(e.toString());
        } finally {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            if (conn != null) conn.close();
        }
        return proList;
    }
    
}
