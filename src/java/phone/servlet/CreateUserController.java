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
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import phone.daos.UserDAO;
import phone.dtos.ErrorUserDTO;
import phone.dtos.UserDTO;

/**
 *
 * @author User
 */
public class CreateUserController extends HttpServlet {

    Logger logger = Logger.getLogger(CreateUserController.class);
    private final static String ERROR = "createUser.jsp";
    private final static String ADMIN = "manage.jsp";
    private final static String USER = "home.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ErrorUserDTO error = new ErrorUserDTO("", "", "", "", "", "", "", "");
        try {
            String userID = request.getParameter("userID");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String roleID = request.getParameter("cmbRole");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            boolean flag = true;
            if (userID != null && (userID.length() < 2 || userID.length() > 20)) {
                error.setUserIDError("S??? k?? t??? t??n ????ng nh???p ph???i t??? [2, 20]");
                flag = false;
            }
            if (name != null && (name.length() < 5 || name.length() > 20)) {
                error.setNameError("S??? k?? t??? h??? t??n ph???i t??? [5, 15]");
                flag = false;
            }
            if (address != null && (address.length() < 5 || address.length() > 60)) {
                error.setAddressError("S??? k?? t??? ?????a ch??? ph???i t??? [5, 60]");
                flag = false;
            }
            if (phone != null && (phone.length() < 5 || phone.length() > 11)) {
                error.setPhoneError("S??? k?? t??? ??i???n tho???i ph???i t??? [5, 11]");
                flag = false;
            } else if (!phone.matches("[0-9]{5,11}")) {
                error.setPhoneError("K?? t??? ??i???n tho???i ph???i l?? ki???u d??? li???u ch??? s???");
                flag = false;
            }
            if (email != null && (email.length() < 5 || email.length() > 30)) {
                error.setEmailError("S??? k?? t??? email ph???i t??? [5, 20]");
                flag = false;
            } else if (!email.matches("\\w+@\\w+[.]\\w+([.]\\w+)?{5,30}")) {
                error.setEmailError("?????nh d???ng email ph???i l??: xxx@abc.com");
                flag = false;
            }
            if (!password.equals(confirm)) {
                error.setConfirm("Hai m???t kh???u ph???i gi???ng nhau!");
                flag = false;
            }
            if (flag) {
                UserDAO dao = new UserDAO();
                UserDTO user = new UserDTO(userID, name, password, address, phone, email, roleID);
                dao.insertNew(user);
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", user);
                if ("AD".equals(user.getRoleID())) {
                    url = ADMIN;
                } else if ("US".equals(user.getRoleID())) {
                    url = USER;

                }
            } else {
                request.setAttribute("ERROR", error);
            }
        } catch (Exception e) {
            if (e.toString().contains("duplicate")) {
                error.setUserIDError("Tr??ng t??n ????ng nh???p v???i ng?????i kh??c!");
                request.setAttribute("ERROR", error);
            }
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
