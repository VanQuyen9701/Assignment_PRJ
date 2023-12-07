/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.Car;
import DAO.CarDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACER
 */
public class AddToCartServlet extends HttpServlet {

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
            String carId = (String) request.getParameter("id");
            String page = request.getParameter("page");
            String msg = "";
            HttpSession session = request.getSession();
            Car c = CarDAO.searchCar(carId);
            HashMap<Car, Integer> cart = (HashMap<Car, Integer>) session.getAttribute("cart");
            if (cart == null) {
                cart = new HashMap<>();
                cart.put(c, 1); //default quantity = 1
            } else {
                //cart.containsKey(c) - không dùng được vì ở đây là đang dùng object - kiểm tra = địa chỉ chứ k phải là id
                boolean check = false;
                Car findCar = null; //giữ object lại để tăng quantity vào hash map
                for (Car car : cart.keySet()) {
                    if (car.getCarId().equals(carId)) {
                        check = true;
                        findCar = car;
                    }
                }
                if (check) {//carId có trong cart map
                    int quantity = cart.get(findCar);
                    quantity++;
                    cart.put(findCar, quantity);
                } else {
                    cart.put(c, 1);
                }
            }
            session.setAttribute("cart", cart);
            if (page.equals("index")) {
                msg = "Add success";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("DispatchServlet?action=").forward(request, response);
            } else if (page.equals("shop")){
                request.getRequestDispatcher("DispatchServlet?action=showshop").forward(request, response);

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
