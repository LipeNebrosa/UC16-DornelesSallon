jQuery(document).ready(function ($) {

    //////////////////////////////// ALERT DE ERROS/////////////////////////////////////////////////////////////////////
    let msg = $("#msg").val();
    console.log(msg + "teste");
    if (msg !== "") {
        let icone = "question";
        let titulo = "Null";
        let amsg = "Erro Script SweetAlert";
        switch (msg) {
            case "erroLogin":
                icone = "error";
                titulo = "Cliente não encontrado :(";
                amsg = "Talvez seu CPF, e-mail e/ou senha estejam errados.";
                break;
            case "CPF-JA-CADASTRADO":
                icone = "warning";
                titulo = "CPF ja cadastrado";
                amsg = "O CPF informado ja esta cadastrado no nosso sistema.\n\
                                                                               Caso tenha esquecido a senha, entre em contato com o suporte.";
                break;
            case "CADASTRADO":
                icone = "success";
                titulo = "Cadastrado :)";
                amsg = "Cadastro efetuado com sucesso, fique a vontade e agende seu horario;";
                break;
            case "cadastrado-erro-Login":
                icone = "info";
                titulo = "Erro no login";
                amsg = "Seu cadastro foi efetuado mas tivemos um problema para processar o login.\n\
                                 Por favor, tente fazer login novamente.";
                break;
            case "ERRO-CADASTRO":
                icone = "error";
                titulo = "Erro no seu cadastro :(";
                amsg = "Tivemos um problema para efetuar seu cadastro, por favor verifique os dados e tente novamente.";
                break;
            case "ATUALIZOU":
                icone = "success";
                titulo = "Cadastro atualizado!";
                amsg = "Seu cadastro foi atualizado com sucesso!";
                break;
            case "ERRO-ATUALIZACAO":
                icone = "error";
                titulo = "Erro na atualização";
                amsg = "Tivemos um problem na atualização dos seus dados.";
                break;
            case "ERRO_LOGIN_DA_ATUALIZACAO":
                icone = "error";
                titulo = "Senha incorreta";
                amsg = "Senha informada na atualização dos seus dados está incorreta.";
                break;
            case "ERRO_EXCLUSAO_ADM":
                icone = "error";
                titulo = "Erro ao excluir";
                amsg = "Tivemos um problema ao excluir o cadastro deste cliente.";
                break;
        }
        Swal.fire({
            icon: icone,
            title: titulo,
            text: amsg
        });
    }
    ;
    //////////////////////////////// ALERT DE ERROS/////////////////////////////////////////////////////////////////////                                                 
});