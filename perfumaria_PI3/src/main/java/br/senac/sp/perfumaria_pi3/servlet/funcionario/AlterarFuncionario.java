/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.perfumaria_pi3.servlet.funcionario;

import br.senac.sp.perfumaria.pi3.dao.FuncionarioDAO;
import br.senac.sp.perfumaria.pi3.model.Funcionario;
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
@WebServlet(name = "AlterarFuncionario", urlPatterns = {"/AlterarFuncionario"})
public class AlterarFuncionario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        long id = Long.parseLong(request.getParameter("id"));
        
        Funcionario funcionario = null;
        try {
            funcionario = FuncionarioDAO.obter(id);
            
        } catch (Exception e) {
             e.printStackTrace();
        }
        request.setAttribute("id", id);
        request.setAttribute("func", funcionario);
        //Request diretorio
        request.getRequestDispatcher("WEB-INF/Funcionario/alterarFuncionario.jsp")
                .forward(request, response);            
    }

     @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        long id = Long.parseLong(request.getParameter("codFunc"));
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
        String filialStr = request.getParameter("filial");
        Integer filial = Integer.parseInt(filialStr);  

        Funcionario f = new Funcionario(nome, cargo,endereco, bairro, cidade, estado,cep, sexo,telefone,celular,filial );                        
        f.setId(id);
        try {           
           FuncionarioDAO.alterar(f);
        } catch (Exception e) {
        }
        request.setAttribute("id", id);
        request.setAttribute("func", f);              
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("WEB-INF/Funcionario/pesquisaFuncionario.jsp");
        dispatcher.forward(request, response);

    }
}
