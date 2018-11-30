/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.perfumaria.pi3.dao;

import br.senac.sp.perfumaria.pi3.model.Cliente;
import br.senac.sp.perfumaria.pi3.model.Produto;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author michael.aroriz
 */
public class VendaDAO {
    //Conexao do banco
    Connection conexao;

    //Construtor
    public VendaDAO(Connection conexao) {
        this.conexao = conexao;
    }

    public static Connection obterConexao() throws ClassNotFoundException, SQLException {
        //
        Connection conn = null;
        // Passo 1: Registar Driver JBDC
        Class.forName("com.mysql.jdbc.Driver");
        // Passo 2: Obter a conexão
        conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/perfumaria",
                "root",
                "");

        return conn;
    }
    public static List<Cliente> obterCliente()
            throws SQLException, Exception {
        //Compõe uma String de consulta que considera apenas o usuario        
        String sql = "SELECT * FROM cliente";

        //Conexão para abertura e fechamento
        Connection connection = null;
        //Statement para obtenção através da conexão, execução de
        //comandos SQL e fechamentos
        PreparedStatement preparedStatement = null;
        //Armazenará os resultados do banco de dados
        ResultSet result = null;
        try {
            //Abre uma conexão com o banco de dados
            connection = obterConexao();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sql);

            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();
            List<Cliente> clientes = new ArrayList<Cliente>();

            //Verifica se há pelo menos um resultado
            while (result.next()) {
                //Cria uma instância de Usuario e popula com os valores do BD

                Cliente cliente = new Cliente();
                cliente.setId(result.getLong("ID"));
                cliente.setNome(result.getString("NOME"));
                clientes.add(cliente);
                //Retorna o resultado
            }
            return clientes;
        } finally {
            //Se o result ainda estiver aberto, realiza seu fechamento
            if (result != null && !result.isClosed()) {
                result.close();
            }
            //Se o statement ainda estiver aberto, realiza seu fechamento
            if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
            }
            //Se a conexão ainda estiver aberta, realiza seu fechamento
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }

        //Se chegamos aqui, o "return" anterior não foi executado porque
        //a pesquisa não teve resultados
        //Neste caso, não há um elemento a retornar, então retornamos "null"
    }
    public static List<Produto> obterProduto()
            throws SQLException, Exception {
        //Compõe uma String de consulta que considera apenas o produto        
        String sql = "SELECT * FROM produto";

        //Conexão para abertura e fechamento
        Connection connection = null;
        //Statement para obtenção através da conexão, execução de
        //comandos SQL e fechamentos
        PreparedStatement preparedStatement = null;
        //Armazenará os resultados do banco de dados
        ResultSet result = null;
        try {
            //Abre uma conexão com o banco de dados
            connection = obterConexao();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sql);

            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();
            List<Produto> produtos = new ArrayList<Produto>();

            //Verifica se há pelo menos um resultado
            while (result.next()) {
                //Cria uma instância de Produto e popula com os valores do BD

                Produto produto = new Produto();
                produto.setId(result.getLong("ID"));
                produto.setNome(result.getString("NOME"));
                produto.setMarca(result.getString("MARCA"));
                produto.setDescricao(result.getString("DESCRICAO"));
                produto.setPrecoCompra(result.getDouble("PRECO_COMPRA"));
                produto.setPrecoVenda(result.getDouble("PRECO_VENDA"));
                produto.setQuantidade(result.getInt("QUANTIDADE"));
                produtos.add(produto);
                //Retorna o resultado
            }

            return produtos;
        } finally {
            //Se o result ainda estiver aberto, realiza seu fechamento
            if (result != null && !result.isClosed()) {
                result.close();
            }
            //Se o statement ainda estiver aberto, realiza seu fechamento
            if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
            }
            //Se a conexão ainda estiver aberta, realiza seu fechamento
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }

        //Se chegamos aqui, o "return" anterior não foi executado porque
        //a pesquisa não teve resultados
        //Neste caso, não há um elemento a retornar, então retornamos "null"
    }
}
