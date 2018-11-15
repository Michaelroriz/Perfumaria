/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.perfumaria_pi3.servlet.produto;

import br.senac.sp.perfumaria.pi3.dao.ProdutoDAO;
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
@WebServlet(name = "ExcluirProduto", urlPatterns = {"/ExcluirProduto"})
public class ExcluirProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        //Variavel do id

        RequestDispatcher dispatcher
                = request.getRequestDispatcher("WEB-INF/Produto/exibirProduto.jsp");
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
           ProdutoDAO.remove(id);
        } catch (Exception e) {

        }
        
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("WEB-INF/Produto/pesquisaProduto.jsp");
        dispatcher.forward(request, response);
    }

}
