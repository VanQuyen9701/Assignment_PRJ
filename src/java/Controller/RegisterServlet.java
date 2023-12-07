/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.User;
import DAO.UserDAO;
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
public class RegisterServlet extends HttpServlet {

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
            String userid = request.getParameter("userid");
            String name = request.getParameter("username");
            String pass = request.getParameter("password");
            String passCheck = request.getParameter("passwordcheck");
            String msg = "";
            boolean flag = false;
            if(pass.matches(passCheck)) {
                flag = true;
                if(!UserDAO.isExist(userid)) {
                    flag = true;
                } else {
                    flag = false;
                    msg = "Username has been used, please choose another!";
                }
            } else {
                flag = false;
                msg = "Incorret password, please re-enter";
            }
            
            if(flag) {
                int rs = UserDAO.insertUser(userid, pass, name);
                if(rs != 0) {
                    User u = UserDAO.getUser(name, pass);
                    if(u != null) {
                        HttpSession session = request.getSession();
                        session.setAttribute("currentUser", u);
                        request.getRequestDispatcher("DispatchServlet?action=").forward(request, response);
                    } else {
                        msg = "Failed to register";
                        request.setAttribute("msg", msg);
                        request.getRequestDispatcher("DispatchServlet?action=register").forward(request, response);
                    }
                }
            }
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
