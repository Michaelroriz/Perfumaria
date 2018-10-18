/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.perfumaria_pi3.servlet;

import br.senac.sp.perfumaria.pi3.dao.ProdutoDAO;
import static br.senac.sp.perfumaria.pi3.dao.ProdutoDAO.obterConexao;
import br.senac.sp.perfumaria.pi3.model.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "AlterarProduto", urlPatterns = {"/AlterarProduto"})
public class AlterarProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        //Variavel do id
        String id = request.getParameter("id");
        request.setAttribute("id", id);
        //Request diretorio
        request.getRequestDispatcher("/alterarProduto.jsp").forward(request, response); 
        
        
    }

     @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        long id = Long.parseLong(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String marca = request.getParameter("marca");
        String[] categorias = request.getParameterValues("cat");        
        String qtdStr = request.getParameter("qtd");
        String precoCompraStr = request.getParameter("prcompra");
        String precoVendaStr = request.getParameter("prvenda");
        String descricao = request.getParameter("descricao");
      
        Double precoCompra = new Double(precoCompraStr);
        Double precoVenda = new Double(precoVendaStr);
        int qtd = Integer.parseInt(qtdStr);        
        Produto p = new Produto(nome, marca,categorias, qtd, precoCompra, precoVenda,descricao );
        
        try {
           ProdutoDAO.inserir(p);
        } catch (Exception e) {

        }
        
        request.setAttribute("prod", p);
        

        RequestDispatcher dispatcher
                = request.getRequestDispatcher("/manipularProduto.jsp");
        dispatcher.forward(request, response);

    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
