function funcionarioInclusao() {
    document.location.href = "/IncluirFuncionario";
    notifyMe();
}
function voltar() {
    document.location.replace("http://localhost:8080/perfumaria_PI3/ConsultaFuncionario");
}

function valida_form() {
    if (document.getElementById("nome").value == "") {
        alert('Por favor, preencha o campo nome');
        document.getElementById("nome").focus();
        return false;
    }
    if (document.getElementById("cargo").value == "") {
        alert('Por favor, preencha o campo cargo / função');
        document.getElementById("cargo").focus();
        return false;
    }
    if (document.getElementById("endereco").value == "") {
        alert('Por favor, preencha o campo endereco');
        document.getElementById("endereco").focus();
        return false;
    }
    if (document.getElementById("bairro").value == "") {
        alert('Por favor, preencha o campo bairro');
        document.getElementById("bairro").focus();
        return false;
    }
    if (document.getElementById("cidade").value == "") {
        alert('Por favor, preencha o campo cidade');
        document.getElementById("cidade").focus();
        return false;
    }
    if (document.getElementById("estado").value == "") {
        alert('Por favor, preencha o campo estado');
        document.getElementById("estado").focus();
        return false;
    }
    if (document.getElementById("cep").value == "") {
        alert('Por favor, preencha o campo cep');
        document.getElementById("cep").focus();
        return false;
    }
    if (document.getElementById("telefone").value == "") {
        alert('Por favor, preencha o campo telefone');
        document.getElementById("telefone").focus();
        return false;
    }
    if (document.getElementById("celular").value == "") {
        alert('Por favor, preencha o campo celular');
        document.getElementById("celular").focus();
        return false;
    }
    return true;
}
//Confirmação de inserção de funcionário no banco de dados
function confirmation() {
    if (valida_form() == true) {                
        notifyMe();
    } else {

    }
}
//Confirmação de alteração de funcionário no banco de dados
function confirmationUpdate() {
    if (valida_form() == true) {        
        alert("Cadastrado com sucesso!");
        notifyMeUpdate();
    } else {

    }
        
}

//Confirmação de exclusão(ativo="N") de funcionário no banco de dados
function confirmationDelete() {
    window.location.href = "/ExcluirFuncionario";
    notifyMeDel();
}
function notifyMeUpdate() {
    // Verifica se o browser suporta notificações
    if (!("Notification" in window)) {
        alert("Este browser não suporta notificações de Desktop");
    } else if (Notification.permission === "granted") {
        var notification = new Notification("Alterado com sucesso!");
    } else if (Notification.permission !== 'denied') {
        var notification = new Notification("Erro ao alterar funcionário");
    }
}
function notifyMeDel() {
    // Verifica se o browser suporta notificações
    if (!("Notification" in window)) {
        alert("Este browser não suporta notificações de Desktop");
    } else if (Notification.permission === "granted") {
        var notification = new Notification("Deletado com sucesso!");
    } else if (Notification.permission !== 'denied') {
        var notification = new Notification("Erro ao deletar funcionário");
    }
}
function notifyMe() {
    // Verifica se o browser suporta notificações
    if (!("Notification" in window)) {
        alert("Este browser não suporta notificações de Desktop");
    } else if (Notification.permission === "granted") {
        var notification = new Notification("Cadastrado com sucesso!");
    } else if (Notification.permission !== 'denied') {
        var notification = new Notification("Erro ao cadastrar funcionário");
    }
}
function busca() {
    
}
