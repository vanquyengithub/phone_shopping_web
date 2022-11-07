/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phone.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import phone.daos.CartDAO;
import phone.dtos.CartDTO;
import phone.dtos.OrderProductDTO;
import phone.dtos.ProductDTO;
import phone.dtos.UserDTO;

/**
 *
 * @author User
 */
public class InsertOrderController extends HttpServlet {

    Logger logger = Logger.getLogger(InsertOrderController.class);
    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "success.jsp";
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
        try {
            HttpSession session = request.getSession();
            double total = Double.parseDouble((String)session.getAttribute("TOTAL"));
            List<ProductDTO> list = (List<ProductDTO>) session.getAttribute("LIST_PRODUCT");
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            CartDAO dao = new CartDAO();
            Calendar calendar = Calendar.getInstance();
            String getTime = "" + calendar.get(Calendar.YEAR) + (calendar.get(Calendar.MONTH) + 1)
                    + calendar.get(Calendar.DATE) + calendar.get(Calendar.HOUR)
                    + calendar.get(Calendar.MINUTE) + calendar.get(Calendar.SECOND) + calendar.get(Calendar.MILLISECOND);
            String orderID = "OR" + getTime;
            dao.addOrder(orderID, user, total);
            dao.addOrderDetail(cart, getTime, orderID);            
            for (OrderProductDTO dto : cart.getCart().values()){
                for (ProductDTO pro: list){
                    if (dto.getProductID().equals(pro.getProductID())){                        
                        dao.decreasePhoneQuantity(pro, dto.getQuantity());
                    }
                }
            }
            session.removeAttribute("CART");
            url = SUCCESS;
        } catch (Exception e) {
            logger.error(e.toString());
        } finally {
            response.sendRedirect(url);
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
