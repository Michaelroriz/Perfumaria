<%-- 
    Document   : cadastrarFuncionario
    Created on : 06/11/2018, 17:20:05
    Author     : Michael
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="formatacao.css"/>
        <title>Cadastro de Funcionário</title>
        <meta charset="UTF-8">       
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="js/functionsFuncionario.js" type="text/javascript"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
        <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
    </head>
    <body>
        <nav>            
            <h2 style="color: white">Cadastro de Funcionário</h2>        
            <main class="container">
                <div class="row">
                    <div class="col-12">                                        
                        <div>
                            <form method="post" action="${pageContext.request.contextPath}/IncluirFuncionario">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="nome">Nome</label>
                                    <div class="col-sm-5">
                                        <input style="width: 300px;" id="nome" required="required" type="text" name="nome" />
                                    </div>
                                    <label class="col-sm-2 col-form-label" for="sexo">Sexo</label>

                                    <select name="sexo" >                                        
                                        <option value="M">Masculino</option>
                                        <option value="F">Feminino</option>                                        
                                    </select>                                
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="cargo">Cargo/ Função</label>
                                    <div class="col-sm-10">
                                        <input style="width: 300px;" id="cargo" required="required" type="text" name="cargo" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="endereco">Endereço</label>
                                    <div class="col-sm-5">
                                        <input style="width: 300px;" id="endereco" required="required" type="text" name="endereco" />
                                    </div>
                                    <label class="col-sm-2 col-form-label" for="bairro">Bairro</label>
                                    <div >
                                        <input required="required" id="bairro" type="text" name="bairro" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="cidade">Cidade</label>
                                    <div class="col-sm-5">
                                        <input style="width: 300px;" id="cidade" required="required" type="text" name="cidade" />
                                    </div>
                                    <label class="col-sm-2 col-form-label" for="estado">Estado</label>
                                    <div>
                                        <input onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                                    return false;
                                                else
                                                    return true;" maxlength="2" id="estado" style="width: 50px;" placeholder="SP" required="required" type="text" name="estado" />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="cep">Cep</label>
                                    <div class="col-sm-10">
                                        <input onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                                    return true;
                                                else
                                                    return false;" maxlength="9" id ="cep" placeholder="000-00000" required="required" type="text" name="cep"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="telefone">Telefone</label>
                                    <div class="col-sm-5">
                                        <input onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                                    return true; else
                                                    return false;" maxlength="14" id="telefone" placeholder="(00)0000-0000" required="required" type="text" name="telefone"/>
                                    </div>
                                    <label class="col-sm-2 col-form-label" for="celular">Celular</label>
                                    <div>
                                        <input onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                                    return true; else
                                                    return false;" maxlength="14" id="celular" placeholder="(00)00000-0000" required="required" type="text" name="celular"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                <label class="col-sm-2 col-form-label" for="filial">Filial</label>                                
                                    <select name="filial" >                                        
                                        <option value="1">Morumbi (Av. Dr. Guilherme Dumont Villares, 1496)</option>
                                        <option value="2">Osasco (Rua Paulo Lício Rizzo, 344)</option>                                        
                                        <option value="3">Campinas (Rua Dr. Antônio da Costa Carvalho, 480)</option>                                        
                                        <option value="4">Vila Mariana (Rua Me. Cabrini, 413)</option>
                                        <option value="5">Jundiaí (Av. Henrique Andres, 770)</option>
                                    </select> 
                                </div>
                                <button type="submit" onClick="confirmation()" >Salvar</button>                                
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