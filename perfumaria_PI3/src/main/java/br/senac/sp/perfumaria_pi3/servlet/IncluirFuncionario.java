/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.perfumaria_pi3.servlet;

import br.senac.sp.perfumaria.pi3.dao.FuncionarioDAO;
import br.senac.sp.perfumaria.pi3.model.Funcionario;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "IncluirFuncionario", urlPatterns = {"/IncluirFuncionario"})
public class IncluirFuncionario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("WEB-INF/Funcionario/cadastrarFuncionario.jsp");
        dispatcher.forward(request, response);
    }

@Override
        protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String cargo = request.getParameter("cargo");
        String endereco = request.getParameter("endereco");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String cep = request.getParameter("cep");
        String sexo = request.getParameter("sexo");
        String telefone = request.getParameter("telefone");
        String celular = request.getParameter("celular");                    

        Funcionario f = new Funcionario(nome, cargo,endereco, bairro, cidade, estado,cep, sexo,telefone,celular );                
        
        try {           
           FuncionarioDAO.inserir(f);

        } catch (Exception e) {
            JOptionPane.showConfirmDialog(null, e);
        }
        
        request.setAttribute("func", f);                
        
        RequestDispatcher dispatcher
                = request.getRequestDispatcher(
                        "WEB-INF/Funcionario/cadastrarFuncionario.jsp");
        dispatcher.forward(request, response);
        
    }
}
