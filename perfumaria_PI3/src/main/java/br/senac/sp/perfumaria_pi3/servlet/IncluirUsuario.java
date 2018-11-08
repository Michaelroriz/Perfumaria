/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.perfumaria_pi3.servlet;

import br.senac.sp.perfumaria.pi3.dao.UsuarioDAO;
import br.senac.sp.perfumaria.pi3.model.Usuario;
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
@WebServlet(name = "IncluirUsuario", urlPatterns = {"/IncluirUsuario"})
public class IncluirUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("WEB-INF/Usuario/cadastrarUsuario.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        String ativo = "S";

        Usuario u = new Usuario(nome, login, senha, ativo);

        try {
            UsuarioDAO.inserir(u);
            JOptionPane.showMessageDialog(null, "Usuário cadastrado");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,"Erro ao cadastrar usuário. Erro encontrado: "+ e);
        }

        request.setAttribute("usuario", u);

        RequestDispatcher dispatcher
                = request.getRequestDispatcher(
                        "WEB-INF/Usuario/cadastrarUsuario.jsp");
        dispatcher.forward(request, response);

    }
}
