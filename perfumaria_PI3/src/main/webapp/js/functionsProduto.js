function produtoInclusao() {
    document.location.href = "/IncluirProduto";
    notifyMe();
}
function voltar() {
    document.location.replace("http://localhost:8080/perfumaria_PI3/ConsultaProduto");
}

function valida_form() {
    if (document.getElementById("nome").value == "") {
        alert('Por favor, preencha o campo nome');
        document.getElementById("nome").focus();
        return false;
    }
    if (document.getElementById("marca").value == "") {
        alert('Por favor, preencha o campo marca');
        document.getElementById("marca").focus();
        return false;
    }
    if (document.getElementById("qtd").value == "") {
        alert('Por favor, preencha o campo quantidade');
        document.getElementById("qtd").focus();
        return false;
    }
    if (document.getElementById("prcompra").value == "") {
        alert('Por favor, preencha o campo preço de compra');
        document.getElementById("prcompra").focus();
        return false;
    }
    if (document.getElementById("prvenda").value == "") {
        alert('Por favor, preencha o campo preço de venda');
        document.getElementById("prvenda").focus();
        return false;
    }
    if (document.getElementById("descricao").value == "") {
        alert('Por favor, preencha o campo descrição');
        document.getElementById("descricao").focus();
        return false;
    }
    
    return true;
}
//Confirmação de inserção de produto no banco de dados
function confirmation() {
    if (valida_form() == true) {                
        notifyMe();
    } else {

    }
}
//Confirmação de alteração de produto no banco de dados
function confirmationUpdate() {
    if (valida_form() == true) {              
        notifyMeUpdate();
    } else {

    }
        
}

//Confirmação de exclusão(ativo="N") de produto no banco de dados
function confirmationDelete() {
    window.location.href = "/ExcluirProduto";
    notifyMeDel();
}
function notifyMeUpdate() {
    // Verifica se o browser suporta notificações
    if (!("Notification" in window)) {
        alert("Este browser não suporta notificações de Desktop");
    } else if (Notification.permission === "granted") {
        var notification = new Notification("Alterado com sucesso!");
    } else if (Notification.permission !== 'denied') {
        var notification = new Notification("Erro ao alterar produto");
    }
}
function notifyMeDel() {
    // Verifica se o browser suporta notificações
    if (!("Notification" in window)) {
        alert("Este browser não suporta notificações de Desktop");
    } else if (Notification.permission === "granted") {
        var notification = new Notification("Deletado com sucesso!");
    } else if (Notification.permission !== 'denied') {
        var notification = new Notification("Erro ao deletar produto");
    }
}
function notifyMe() {
    // Verifica se o browser suporta notificações
    if (!("Notification" in window)) {
        alert("Este browser não suporta notificações de Desktop");
    } else if (Notification.permission === "granted") {
        var notification = new Notification("Cadastrado com sucesso!");
    } else if (Notification.permission !== 'denied') {
        var notification = new Notification("Erro ao cadastrar produto");
    }
}
function busca() {
    
}
