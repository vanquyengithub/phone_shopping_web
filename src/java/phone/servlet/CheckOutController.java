/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phone.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import phone.dtos.CartDTO;
import phone.dtos.OrderProductDTO;
import phone.dtos.ProductDTO;
import phone.dtos.UserDTO;

/**
 *
 * @author User
 */
public class CheckOutController extends HttpServlet {

    Logger logger = Logger.getLogger(CheckOutController.class);
    private static final String ERROR = "emptyCart.jsp";
    private static final String SOLD_OUT = "soldOut.jsp";
    private static final String REGISTER = "info.jsp";
    private static final String SUCCESS = "checkOut.jsp";

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
            List<ProductDTO> list = (List<ProductDTO>) session.getAttribute("LIST_PRODUCT");
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            
            boolean checkSoldOut = false;
            List<String> message = new ArrayList<>();
            if (list != null && cart.getCart().size() > 0) {
                for (OrderProductDTO pro : cart.getCart().values()) {
                    for (ProductDTO dto : list) {
                        if (pro.getProductID().equals(dto.getProductID())){
                            if (pro.getQuantity() > dto.getQuantity()){
                                message.add("Xin lỗi! Điện thoại " + pro.getName() + " đã hết hàng!");
                                checkSoldOut = true;
                            }
                        }
                    }
                }
            }
            if (cart.getCart().size() == 0) {
                url = ERROR;                
            } else if (user == null) {
                String action = request.getParameter("action");
                session.setAttribute("CHECK_OUT_PAGE", action);
                url = REGISTER;
            } else if (checkSoldOut) {
                session.setAttribute("SOLD_OUT", message);
                url = SOLD_OUT;
            } else {
                url = SUCCESS;
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
