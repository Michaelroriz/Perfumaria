<%-- 
    Document   : venda1
    Created on : 29/11/2018, 20:16:16
    Author     : michael.aroriz
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="formatacao.css"/>
        <title>Realizar Venda</title>
        <meta charset="UTF-8">       
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
        <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
        <script src="js/functionsVenda.js" type="text/javascript"></script>
    </head>
    <body>
        <nav>            
            <h2 style="color: white">Venda</h2>        
            <main class="container">
                <div class="row">
                    <div class="col-12">                                        
                        <div>
                            <form method="GET" action="${pageContext.request.contextPath}/Carrinho">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="cliente">Cliente</label>
                                    <select style="width: 300px;" name="cliente" >                                          
                                        <c:forEach items="${cliente}" var="cliente">
                                            <option  type="search" value="${cliente.nome}" id="${cliente.id}" name="cliente"/>${cliente.id} | ${cliente.nome}
                                        </c:forEach>
                                    </select>                                    
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="prod">Produto</label>                                    
                                        <select style="width: 300px;" name="produto" >                                          
                                            <c:forEach items="${prod}" var="prod">
                                                <option  type="search" value="${prod.id}" id="${prod.id}" name="produto"/>${prod.nome}
                                            </c:forEach>
                                        </select>                                    
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="quant">Quantidade:</label>
                                    <input  type="number" name="quant"/>
                                </div>                               

                                <button type="submit">Adicionar ao Carrinho</button>
                                <button type="reset">Limpar</button>
                                <button type="reset" onclick="window.location.href = 'menu.jsp';">Voltar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </main>
        </nav>
        <%@ include file="/rodape.jsp"%> 
    </body>
</html>
