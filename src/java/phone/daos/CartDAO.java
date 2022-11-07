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
import java.util.Calendar;
import java.sql.Date;
import org.apache.log4j.Logger;
import phone.dtos.CartDTO;
import phone.dtos.OrderProductDTO;
import phone.dtos.ProductDTO;
import phone.dtos.UserDTO;
import phone.utils.DBUtils;

/**
 *
 * @author User
 */
public class CartDAO {
    
    Logger logger = Logger.getLogger(CartDAO.class);

    public void addOrder(String orderID, UserDTO user, double total) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblOrders(orderID, userID, date, total) "
                        + " VALUES(?,?,?,?)";
                stm = conn.prepareStatement(sql);
                Calendar calendar = Calendar.getInstance();
                Date date = new Date(calendar.getTime().getTime());
                stm.setString(1, orderID);
                stm.setString(2, user.getUserID());
                stm.setDate(3, date);
                stm.setDouble(4, total);
                stm.executeUpdate();
            }
        } catch (Exception e) {
            logger.error(e.toString());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void addOrderDetail(CartDTO cart, String getTime, String orderID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            int count = 1;
            if (conn != null) {
                for (OrderProductDTO dto : cart.getCart().values()) {
                    String sql = "INSERT INTO tblOrderDetails(orderDetailID, orderID, productID, quantity, price) "
                            + " VALUES(?,?,?,?,?)";
                    stm = conn.prepareStatement(sql);
                    String orderDetailID = "OD" + getTime + count++;
                    stm.setString(1, orderDetailID);
                    stm.setString(2, orderID);
                    stm.setString(3, dto.getProductID());
                    stm.setInt(4, dto.getQuantity());
                    stm.setDouble(5, dto.getPrice() * dto.getQuantity());
                    stm.executeUpdate();
                }

            }
        } catch (Exception e) {
            logger.error(e.toString());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void decreasePhoneQuantity(ProductDTO dto, int boughtPhoneNumber) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {

                String sql = "Update tblProducts SET quantity = ? WHERE productID = ? ";
                stm = conn.prepareStatement(sql);
                int quantity = dto.getQuantity() - boughtPhoneNumber;
                stm.setInt(1, quantity);
                stm.setString(2, dto.getProductID());
                stm.executeUpdate();

            }
        } catch (Exception e) {
            logger.error(e.toString());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
}
