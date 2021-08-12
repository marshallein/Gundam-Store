/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import DAO.ProductDAO;
import Entity.Cart;
import Entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Marshallein
 */
@WebServlet(name = "UpdateCartControl", urlPatterns = {"/updatecart"})
public class UpdateCartControl extends HttpServlet {

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
        ProductDAO prodao = new ProductDAO();
        HttpSession session = request.getSession();
        ArrayList<Cart> listCart = (ArrayList<Cart>) session.getAttribute("listCart");
        String pid = request.getParameter("id");

        int flag = Integer.parseInt(request.getParameter("flag"));

        if (flag == 1) {
            for (Cart cart : listCart) {
                if (cart.getId() == Integer.parseInt(pid)) {
                    cart.setAmount(cart.getAmount() - 1);
                    if (cart.getAmount() == 0) {
                        listCart.remove(cart);
                    }
                    break;
                }
            }
        } else if (flag == 2) {
            for (Cart cart : listCart) {
                if (cart.getId() == Integer.parseInt(pid)) {
                    cart.setAmount(cart.getAmount() + 1);
                    break;
                }
            }
        }

        int number = 0;
        double totalMoney = 0;
        for (Cart c : listCart) {
            number += c.getAmount();
            totalMoney += c.getAmount() * c.getPrice();
        }

        session.setAttribute(
                "totalProducts", number);
        session.setAttribute(
                "totalMoney", totalMoney);
        session.setAttribute(
                "listCart", listCart);
        response.sendRedirect(
                "cart.jsp");

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
