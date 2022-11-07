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
import phone.dtos.CartDTO;
import phone.dtos.OrderProductDTO;

/**
 *
 * @author User
 */
public class AddProductController extends HttpServlet {

    Logger logger = Logger.getLogger(AddProductController.class);
    private final static String ERROR = "error.jsp";
    private final static String HOME = "home.jsp";
    private final static String SEARCH = "search.jsp";
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
            String productID = request.getParameter("productID");
            String name = request.getParameter("name");
            String image = request.getParameter("image");
            String memory = request.getParameter("memory");
            String ram = request.getParameter("ram");
            String color = request.getParameter("color");
            int quantity = 1;
            double price = Double.parseDouble(request.getParameter("price"));
            String categoryID = request.getParameter("categoryID");
            OrderProductDTO orderPro = new OrderProductDTO(productID, name, memory, 
                    ram, color, image, quantity, price, categoryID);
            HttpSession session = request.getSession();
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            if (cart == null){
                cart = new CartDTO();
            }
            cart.add(orderPro);
            session.setAttribute("CART", cart);
            if (request.getParameter("search") != null){
                url = SEARCH;
                request.setAttribute("MESSAGE", "Bạn đã chọn điện thoại: "+ name);
            } else {
                url = HOME;
                request.setAttribute("MESSAGE", "Bạn đã chọn điện thoại: "+ name);
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
