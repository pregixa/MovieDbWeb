/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import moviedb_classes.Movie;
import moviedb_classes.MovieDB;
import moviedb_classes.User;

/**
 *
 * @author Utilizador
 */
@WebServlet(name = "Search_Servlet", urlPatterns = {"/Search_Servlet"})
public class Search_Servlet extends HttpServlet {

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

        String movie_name = request.getParameter("movie_title");
        String user = request.getParameter("user");
        System.out.println(user);
        Movie m = MovieDB.get_movie(movie_name);
        if (m != null) {
            if (user != null) {
                request.getRequestDispatcher("movie_details?id=" + m.getId() + "&user=" + user).forward(request, response);
            } else {
                request.getRequestDispatcher("movie_details?id=" + m.getId()).forward(request, response);
            }

        } else {
            if (user != null) {
                System.out.println("entrei aqui 2");
                User u = MovieDB.getUserById(user);
                System.out.println(u.getUsername()+"   "+ u.getPassword());
                request.setAttribute("user", u);
                request.getRequestDispatcher("/WEB-INF/Movie_Not_Found.jsp").forward(request, response);
            } else {
                System.out.println("Entrei aqui");
                request.getRequestDispatcher("/WEB-INF/Movie_Not_Found.jsp").forward(request, response);
            }
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
