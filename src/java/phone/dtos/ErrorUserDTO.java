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
public class ErrorUserDTO implements Serializable{
    private String userIDError;
    private String nameError;    
    private String addressError;
    private String phoneError;
    private String emailError;
    private String roleIDError;
    private String passwordError;
    private String confirm;

    public ErrorUserDTO() {
    }

    public ErrorUserDTO(String userIDError, String nameError, String addressError, String phoneError, String emailError, String roleIDError, String passwordError, String confirm) {
        this.userIDError = userIDError;
        this.nameError = nameError;
        this.addressError = addressError;
        this.phoneError = phoneError;
        this.emailError = emailError;
        this.roleIDError = roleIDError;
        this.passwordError = passwordError;
        this.confirm = confirm;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public String getAddressError() {
        return addressError;
    }

    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }
    
    
}
