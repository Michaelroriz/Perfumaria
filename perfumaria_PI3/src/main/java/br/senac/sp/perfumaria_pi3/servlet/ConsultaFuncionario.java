/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.perfumaria_pi3.servlet;

import br.senac.sp.perfumaria.pi3.dao.FuncionarioDAO;
import br.senac.sp.perfumaria.pi3.model.Funcionario;
import java.io.IOException;
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
@WebServlet(name = "ConsultaFuncionario", urlPatterns = {"/ConsultaFuncionario"})
public class ConsultaFuncionario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/Funcionario/pesquisaFuncionario.jsp");
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        //Variavel do id
        long id = Long.parseLong(request.getParameter("id"));
        
        Funcionario funcionario = null;
        try {
            funcionario = FuncionarioDAO.obter(id);
        } catch (Exception e) {
        }
        request.setAttribute("func", funcionario);
        
        //Request diretorio
        request.getRequestDispatcher("WEB-INF/Funcionario/exibirFuncionario.jsp").forward(request, response); 

    }
}
