/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phone.daos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import phone.dtos.RoleDTO;
import phone.dtos.UserDTO;
import phone.utils.DBUtils;

/**
 *
 * @author User
 */
public class UserDAO {
    
    Logger logger = Logger.getLogger(UserDAO.class);
    
    public UserDTO checkLogin(String userID, String password) throws SQLException{
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql = "SELECT name, address, phone, email, roleID "
                        + " FROM tblUsers "
                        + " WHERE userID='" + userID + "' AND password='" + password + "'";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String roleID = rs.getString("roleID");
                    user = new UserDTO(userID, name, "", address, phone, email, roleID);
                }
            }
        } catch (Exception e) {
            logger.error(e.toString());
        } finally {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            if (conn != null) conn.close();
        }
        return user;
    }

    public void insertNew(UserDTO user) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql = "INSERT INTO tblUsers(userID, name, password, address, phone,"
                        + " email, roleID) "
                        + " VALUES(?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getName());
                stm.setString(3, user.getPassword());
                stm.setString(4, user.getAddress());
                stm.setString(5, user.getPhone());
                stm.setString(6, user.getEmail());
                stm.setString(7, user.getRoleID());                
                stm.executeUpdate();
            }
        } finally {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            if (conn != null) conn.close();
        }
    }
    
    public List<UserDTO> getListUserBySearch(String search) throws SQLException{
        List<UserDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql = "SELECT userID, name, address, phone, email, roleID "
                        + " FROM tblUsers "
                        + " WHERE name like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()){
                    if (list== null){
                        list = new ArrayList<>();
                    }
                    String userID = rs.getString("userID");
                    String name = rs.getString("name");
                    String password = "***";
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String roleID = rs.getString("roleID");                    
                    list.add(new UserDTO(userID, name, password, address, phone, email, roleID));
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
    
    public void deleteUser(String userID) throws SQLException{       
        Connection conn = null;
        CallableStatement stm = null;        
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql = "{CALL DeleteUser (?) }";
                stm = conn.prepareCall(sql);
                stm.setString(1, userID);
                stm.executeUpdate();
            }
        } catch (Exception e) {
            logger.error(e.toString());
        } finally {            
            if (stm != null) stm.close();
            if (conn != null) conn.close();
        }
    }
    
    public boolean updateUser(UserDTO user) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql = "UPDATE tblUsers "
                        + " SET name = ?, "
                        + " address = ?, "
                        + " phone = ?, "
                        + " email = ?, "
                        + " roleID = ? "
                        + " WHERE userID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getName());
                stm.setString(2, user.getAddress());
                stm.setString(3, user.getPhone());
                stm.setString(4, user.getEmail());
                stm.setString(5, user.getRoleID());
                stm.setString(6, user.getUserID());
                check = stm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
            logger.error(e.toString());
        } finally {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            if (conn != null) conn.close();
        }
        return check;
    }
    
    public List<RoleDTO> getRoleList () throws SQLException{
        List<RoleDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql = "SELECT roleID, name "
                        + " FROM tblRoles ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()){
                    if (list== null){
                        list = new ArrayList<>();
                    }
                    String roleID = rs.getString("roleID");
                    String name = rs.getString("name");                  
                    list.add(new RoleDTO(roleID, name));
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
}
