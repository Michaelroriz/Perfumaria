/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.perfumaria_pi3.servlet.carrinho;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rbezerra
 */
 
 @WebServlet(name = "Carrinho", urlPatterns = {"/Carrinho"})
public class CarrinhoVenda extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        String cliente = request.getParameter("cliente");
        String idProduto = request.getParameter("IdProduto");
        String qtdStr = request.getParameter("quant");
        int qtd = Integer.parseInt(qtdStr);
        
        
        request.setAttribute("cliente", cliente);
        request.setAttribute("produto", idProduto);
        request.setAttribute("quantidade", qtd);
        
        request.getRequestDispatcher("WEB-INF/Carrinho/Carrinho.jsp")
                .forward(request, response);            
    }

     @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
              
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("");
        dispatcher.forward(request, response);

    }
}
