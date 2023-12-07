/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACER
 */
public class DispatchServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("currentUser");
            String action = request.getParameter("action");
            String name = request.getParameter("name");
            String msg = "";
            String url = "index.jsp";
            if(action == null || action.isEmpty()) {
                url = "LoadCarServlet";
            } else if(action.equals("showcar")) {
                url = "index.jsp";
            } else if(action.equals("buy")) {
                if(currentUser == null) {
                    request.setAttribute("msg", msg);
                    url = "login.jsp";
                } else {
                    url = "AddToCartServlet";
                }
            } else if(action.equals("login")) {
                if(currentUser == null) {
                    url = "login.jsp";
                } else {
                    msg = "You have already logined";
                    request.setAttribute("msg", msg);
                    url = "login.jsp";
                }
            } else if(action.equals("loginvalidate")) {
                url = "LoginServlet";
            } else if(action.equals("register")) {
                if(currentUser == null) {
                    url = "register.jsp";
                } else {
                    msg = "You have already logined";
                    request.setAttribute("msg", msg);
                    url = "login.jsp";
                }
            } else if(action.equals("registervalidate")) {
                url = "RegisterServlet";
            }  else if(action.equals("logout")) {
                url = "LogoutServlet";
            } else if(action.equals("showshop")) {
                url = "showcar.jsp";
            } else if(action.equals("viewcart")) {
                url = "viewcart.jsp";
            } else if(action.equals("update")) {
                String btn = request.getParameter("btn");
                if(btn.equals("remove")) {
                    url = "RemoveServlet";
                } else if(btn.equals("update")) {
                    url = "UpdateServlet";
                }
            } else if(action.equals("check")) {
                url = "CheckoutServlet";
            }
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
