/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.perfumaria_pi3.servlet.usuario;

import br.senac.sp.perfumaria.pi3.dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Michael
 */
@WebServlet(name = "ExcluirUsuario", urlPatterns = {"/ExcluirUsuario"})
public class ExcluirUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        //Variavel do id

        RequestDispatcher dispatcher
                = request.getRequestDispatcher("WEB-INF/Usuario/exibirUsuario.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        String codigo = request.getParameter("id");
        long id = Long.parseLong(codigo);
        //Conexão para abertura e fechamento
        try 
        {
           UsuarioDAO.remove(id);
        } catch (Exception e) {
        }
        
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("WEB-INF/Usuario/exibirUsuario.jsp");
        dispatcher.forward(request, response);
    }
}