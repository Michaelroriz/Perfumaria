/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.perfumaria_pi3.servlet;

import br.senac.sp.perfumaria.pi3.dao.ProdutoDAO;
import static br.senac.sp.perfumaria.pi3.dao.ProdutoDAO.obterConexao;
import java.io.IOException;
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
@WebServlet(name = "ExcluirProduto", urlPatterns = {"/ExcluirProduto"})
public class ExcluirProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        //Variavel do id
        
        String codigo = request.getParameter("id");
        long codbar = Long.parseLong(codigo);
        //Conexão para abertura e fechamento
        Connection connection = null;
        try {
            //Comando do banco
            connection = obterConexao();
            ProdutoDAO dao = new ProdutoDAO(connection);
            dao.remove(codbar);
        } catch (ClassNotFoundException e) {
            Logger.getLogger(ExcluirProduto.class.getName()).log(Level.SEVERE, null, e);
        } catch (SQLException e) {
            Logger.getLogger(ExcluirProduto.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(ExcluirProduto.class.getName()).log(Level.SEVERE, null, ex);
        }

        RequestDispatcher dispatcher
                = request.getRequestDispatcher("/manipularProduto.jsp");
        dispatcher.forward(request, response);

    }

     @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
