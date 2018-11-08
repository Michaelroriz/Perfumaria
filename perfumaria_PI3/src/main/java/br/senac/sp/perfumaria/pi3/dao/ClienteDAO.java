/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.perfumaria.pi3.dao;

import static br.senac.sp.perfumaria.pi3.dao.ProdutoDAO.obterConexao;
import br.senac.sp.perfumaria.pi3.model.Cliente;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {
    
    Connection conexao;
    
      public ClienteDAO(Connection conexao) {
        
            this.conexao = conexao;
    }
      
    public static Connection obterConexao() throws SQLException, ClassNotFoundException {
        
        Connection conn = null;
           
        Class.forName("com.mysql.jdbc.Driver");
        
        conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/perfumaria",
                "root",
                "");
        
        return  conn;
    }
    
    public List<Cliente> listarClientes() {
        
        List<Cliente> clientes = new ArrayList<Cliente>();
        
        Connection connection = null;
        
        PreparedStatement preparedStatemnet = null;
        
        try{    
            connection = obterConexao();
            String sql = "SELECT * FROM CLIENTE";
            java.sql.Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
         while(rs.next()){
             
             Cliente cliente = new Cliente(); 
         
             int id = rs.getInt("ID");
             String nome = rs.getString("NOME");
             String endereco = rs.getString("ENDERECO");
             String bairro = rs.getString("BAIRRO");
             String cidade = rs.getString("CIDADE");
             String estado = rs.getString("ESTADO");
             String cep = rs.getString("CEP");
             String sexo = rs.getString("SEXO");
             String telefone = rs.getString("TELEFONE");
             String celular = rs.getString("CELULAR");
             Date cadData = rs.getDate("CADASTRO");
             
             cliente.setId(id);
             cliente.setEndereco(endereco);
             cliente.setBairro(bairro);
             cliente.setCidade(cidade);
             cliente.setEstado(estado);
             cliente.setCep(cep);
             cliente.setSexo(sexo);
             cliente.setTelefone(telefone);
             cliente.setCelular(celular);
             cliente.setDataCadastro(cadData);
             
             clientes.add(cliente);   
         }   
               
        }catch (Exception e) {
            
            e.printStackTrace();
            
        }
        return clientes;
    } 

    public static void inserirCliente(Cliente cliente) throws SQLException, ClassNotFoundException {

        String sqlInserir =
            "INSERT INTO CLIENTE(NOME,ENDERECO,BAIRRO,CIDADE,ESTADO,CEP,SEXO,TELEFONE,CELULAR,CADASTRO)"
            + " VALUES (?,?,?,?,?,?,?,?,?, NOW())";
    
                Connection connection = null;
            
                PreparedStatement preparedStatement = null;
    
                try {
                //Abre uma conexão com o banco de dados
                connection = obterConexao();
                //Cria um statement para execução de instruções SQL
                preparedStatement = connection.prepareStatement(sqlInserir);
                
                preparedStatement.setString(1, cliente.getNome());
                preparedStatement.setString(2, cliente.getEndereco());
                preparedStatement.setString(3, cliente.getBairro());
                preparedStatement.setString(4, cliente.getCidade());
                preparedStatement.setString(5, cliente.getEstado());
                preparedStatement.setString(5, cliente.getCep());
                preparedStatement.setString(5, cliente.getSexo());
                preparedStatement.setString(5, cliente.getTelefone());
                preparedStatement.setString(5, cliente.getCelular());
                
                preparedStatement.execute();
            }
                finally {
                  
                if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
                }
                
                if (connection != null && !connection.isClosed()) {
                connection.close();
                }
            }
    }

    public static Cliente pesquisar(Integer id) throws SQLException, ClassNotFoundException{
        
         String sqlPesquisa = "SELECT * FROM CLIENTE WHERE id = ?";
         
         Connection connection = null;
       
         PreparedStatement preparedStatement = null;
     
         ResultSet result = null;
         
            try {
            //Abre uma conexão com o banco de dados
            connection = obterConexao();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sqlPesquisa);
            //Configura os parâmetros do "PreparedStatement"
            preparedStatement.setInt(1, id);

            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();
            
            if (result.next()) {
                
                Cliente cliente = new Cliente();
                
                cliente.setId(result.getInt("ID"));
                cliente.setNome(result.getString("NOME"));
                cliente.setEndereco(result.getString("ENDERECO"));
                cliente.setBairro(result.getString("BAIRRO"));
                cliente.setCidade(result.getString("CIDADE"));
                cliente.setEstado(result.getString("ESTADO"));
                cliente.setCep(result.getString("CEP"));
                cliente.setSexo(result.getString("SEXO"));
                cliente.setTelefone(result.getString("TELEFONE"));
                cliente.setCelular(result.getString("CELULAR"));
                cliente.setDataCadastro(result.getDate("CADASTRO"));
                
                return cliente;
            }
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
       
            return null;
            
        }

}














