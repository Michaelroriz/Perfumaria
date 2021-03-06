/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.perfumaria_pi3.servlet.usuario;

import br.senac.sp.perfumaria.pi3.dao.UsuarioDAO;
import br.senac.sp.perfumaria.pi3.model.Usuario;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Michael
 */
@WebServlet(name = "AlterarUsuario", urlPatterns = {"/AlterarUsuario"})
public class AlterarUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        long id = Long.parseLong(request.getParameter("id"));
        
        Usuario usuario = null;
        try {
            usuario = UsuarioDAO.obter(id);
            
        } catch (Exception e) {
             e.printStackTrace();
        }
        request.setAttribute("id", id);
        request.setAttribute("usuario", usuario);
        //Request diretorio
        request.getRequestDispatcher("WEB-INF/Usuario/alterarUsuario.jsp")
                .forward(request, response);            
    }

     @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        long id = Long.parseLong(request.getParameter("codUsu"));
        String nome = request.getParameter("nome");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        String ativo = "S";

        Usuario u = new Usuario(nome, login,senha, ativo);                        
        u.setId(id);
        try {           
           UsuarioDAO.alterar(u);
        } catch (Exception e) {
        }
        request.setAttribute("id", id);
        request.setAttribute("func", u);              
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("WEB-INF/Usuario/alterarUsuario.jsp");
        dispatcher.forward(request, response);

    }
}
