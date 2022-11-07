/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phone.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

/**
 *
 * @author User
 */
public class MainController extends HttpServlet {

    Logger logger = Logger.getLogger(MainController.class);
    private static final String ERROR="error.jsp";
    private static final String LOGIN="LoginController";
    private static final String LOGOUT="LogoutController";
    private static final String ADD_PRODUCT_CONTROLLER="AddProductController";
    private static final String CREATE_USER_CONTROLLER="CreateUserController";
    private static final String CREATE_USER_BEFORE_CHECKOUT_CONTROLLER="CreateUserBeforeCheckOutController";
    private static final String VIEW_CART="viewCart.jsp";
    private static final String SEARCH_PRODUCT_CONTROLLER="SearchProductController";
    private static final String DELETE_PRODUCT_CONTROLLER="DeleteProductController";
    private static final String UPDATE_PRODUCT_CONTROLLER="UpdateProductController";
    private static final String CHECK_OUT_CONTROLLER="CheckOutController";
    private static final String SEARCH_USER_CONTROLLER="SearchUserController";
    private static final String UPDATE_USER_CONTROLLER="UpdateUserController";
    private static final String DELETE_USER_CONTROLLER="DeleteUserController";
    private static final String VERIFY_CODE_CONTROLLER="VerifyCodeController";
    private static final String SENDING_CODE_CONTROLLER="SendingCodeController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if ("Login".equals(action)){
                url = LOGIN;
            } else if ("Logout".equals(action)){
                url = LOGOUT;
            } else if ("Add".equals(action)){
                url = ADD_PRODUCT_CONTROLLER;
            } else if ("Search".equals(action)){
                url = SEARCH_PRODUCT_CONTROLLER;
            } else if ("View".equals(action)){
                url = VIEW_CART;
            } else if ("Delete".equals(action)){
                url = DELETE_PRODUCT_CONTROLLER;
            } else if ("Update".equals(action)){
                url = UPDATE_PRODUCT_CONTROLLER;
            } else if ("Create".equals(action)){
                url = CREATE_USER_CONTROLLER;
            } else if ("Check".equals(action)){
                url = CHECK_OUT_CONTROLLER;
            } else if ("Buy".equals(action)){
                url = SENDING_CODE_CONTROLLER;
            } else if ("SearchUser".equals(action)){
                url = SEARCH_USER_CONTROLLER;
            } else if ("UpdateUser".equals(action)){
                url = UPDATE_USER_CONTROLLER;
            } else if ("DeleteUser".equals(action)){
                url = DELETE_USER_CONTROLLER;
            } else if ("Next".equals(action)){
                url = CREATE_USER_BEFORE_CHECKOUT_CONTROLLER;
            } else if ("Verify".equals(action)){
                url = VERIFY_CODE_CONTROLLER;
            }
        } catch (Exception e) {
            logger.error(e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
