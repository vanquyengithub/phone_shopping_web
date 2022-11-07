/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phone.servlet;

import java.io.IOException;
import java.util.Calendar;
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
public class CreateUserBeforeCheckOutController extends HttpServlet {

    Logger logger = Logger.getLogger(CreateUserController.class);
    private final static String ERROR = "info.jsp";
    private final static String SUCCESS = "checkOut.jsp";
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
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ErrorUserDTO error = new ErrorUserDTO("", "", "", "", "", "", "", "");
        try {
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            boolean flag = true;
            if (name != null && (name.length() < 5 || name.length() > 15)) {
                error.setNameError("Số ký tự họ tên phải từ [5, 15]");
                flag = false;
            }
            if (address != null && (address.length() < 5 || address.length() > 60)) {
                error.setAddressError("Số ký tự địa chỉ phải từ [5, 60]");
                flag = false;
            }
            if (phone != null && (phone.length() < 5 || phone.length() > 11)) {
                error.setPhoneError("Số ký tự điện thoại phải từ [5, 11]");
                flag = false;
            } else if (!phone.matches("[0-9]{5,11}")) {
                error.setPhoneError("Ký tự điện thoại phải là kiểu dữ liệu chữ số");
                flag = false;
            }
            if (email != null && (email.length() < 5 || email.length() > 30)) {
                error.setEmailError("Số ký tự email phải từ [5, 20]");
                flag = false;
            } else if (!email.matches("\\w+@\\w+[.]\\w+([.]\\w+)?{5,30}")) {
                error.setEmailError("Định dạng email phải là: xxx@abc.com");
                flag = false;
            }
            if (flag) {
                UserDAO dao = new UserDAO();
                Calendar calendar = Calendar.getInstance();
                String userID = "ID" + calendar.get(Calendar.YEAR) + (calendar.get(Calendar.MONTH) + 1)
                    + calendar.get(Calendar.DATE) + calendar.get(Calendar.HOUR)
                    + calendar.get(Calendar.MINUTE) + calendar.get(Calendar.SECOND) + calendar.get(Calendar.MILLISECOND);;
                UserDTO user = new UserDTO(userID, name, "", address, phone, email, "US");
                dao.insertNew(user);
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", user);
                url = SUCCESS;
            } else {
                request.setAttribute("ERROR", error);
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
