/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servelets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import com.mysql.jdbc.Driver;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author saram
 */
@WebServlet(name = "Noticias", urlPatterns = {"/Noticias"})
public class Noticias extends HttpServlet {

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            try {
                HttpSession sesion = request.getSession();
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/videogames?user=root");
                st = con.createStatement();
                String query = "SELECT * FROM `noticias`";
                String where = " where 1=1 ";
                String titular = request.getParameter("titular");
                if (titular != null) {
                    titular = this.scape_string(titular);
                    where = where + " and titular LIKE'%" + titular + "%'";
                }
                String admin = request.getParameter("admin");
                query = query + where;
                rs = st.executeQuery(query);
                while (rs.next()) {
                    out.print("<tr>"
                            + "<th scope=\"row\">" + rs.getString(1) + "</th>"
                            + "<td>" + rs.getString(2) + "</td>"
                            + "<td class=\"text-center\">" + rs.getDate(4) + "</td>"
                            + "<td class=\"text-center\">" + rs.getBoolean(5) + "</td>"
                            + "<td class=\"text-center\">" + rs.getBoolean(6) + "</td>"
                            + "<td class=\"text-center\">"
                            + ((sesion.getAttribute("admin").equals(true))
                                ? "  <a href=\"editBlog.jsp?id=" + rs.getString(1) + "&titular=" + rs.getString(2) + "&contenido=" + rs.getString(3) + "&fecha=" + rs.getDate(4) + "&accesible=" + rs.getBoolean(5) + "&LGTBI=" + rs.getBoolean(6) + "\"><i class=\"fa fa-pencil\" aria-hidden=\"true\"></i></a>"
                            + "  <a href=\"deleteBlog.jsp?id=" + rs.getString(1) + "\" class=\"ml-1\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></a>"
                            : "<a><i class=\"fa-solid fa-eye\" aria-hidden=\"true\"></i></a>")
                            + "</td>"
                            + "</tr>"
                    );
                }
            } catch (Exception e) {
                out.print("Error mysql " + e);
            } finally {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Noticias.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }
    }

    public String scape_string(String texto) {
        texto = texto.replaceAll("\\\\", "\\\\\\\\'");
        texto = texto.replaceAll("\\n", "\\\\n'");
        texto = texto.replaceAll("\\r", "\\\\r'");
        texto = texto.replaceAll("\\t", "\\\\t'");
        texto = texto.replaceAll("\\n", "\\\\n'");
        texto = texto.replaceAll("'", "\\\\'");
        return texto;
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
