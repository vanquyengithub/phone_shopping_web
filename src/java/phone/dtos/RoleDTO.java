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
public class RoleDTO implements Serializable{
    private String roleID;
    private String name;

    public RoleDTO() {
    }

    public RoleDTO(String roleID, String name) {
        this.roleID = roleID;
        this.name = name;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
