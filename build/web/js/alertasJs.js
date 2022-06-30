jQuery(document).ready(function ($) {

   
    let msg = $("#msg").val();
    if (msg !== "") {
        let icone = "question";
        let titulo = "Null";
        let amsg = "Erro Script SweetAlert";
        let timer = "4000";
        switch (msg) {
            case "erroLogin":
                icone = "error";
                titulo = "Cliente não encontrado :(";
                amsg = "Talvez seu CPF, e-mail e/ou senha estejam errados.";
                timer = "";
                break;
            case "CPF-JA-CADASTRADO":
                icone = "warning";
                titulo = "CPF ja cadastrado";
                amsg = "O CPF informado ja esta cadastrado no nosso sistema.\n\
                        Caso tenha esquecido a senha, entre em contato com o suporte.";
                    timer = "";
                break;
            case "CADASTRADO":
                icone = "success";
                titulo = "Cadastrado :)";
                amsg = "Cadastro efetuado com sucesso, fique a vontade e agende seu horario;";
                timer = "";
                break;
            case "cadastrado-erro-Login":
                icone = "info";
                titulo = "Erro no login";
                amsg = "Seu cadastro foi efetuado mas tivemos um problema para processar o login.\n\
                                 Por favor, tente fazer login novamente.";
                            timer = "";
                break;
            case "ERRO-CADASTRO":
                icone = "error";
                titulo = "Erro no seu cadastro :(";
                amsg = "Tivemos um problema para efetuar seu cadastro, por favor verifique os dados e tente novamente.";
                timer = "";
                break;
            case "ATUALIZOU":
                icone = "success";
                titulo = "Cadastro atualizado!";
                amsg = "Seu cadastro foi atualizado com sucesso!";
                timer = "";
                break;
            case "ERRO-ATUALIZACAO":
                icone = "error";
                titulo = "Erro na atualização";
                amsg = "Tivemos um problem na atualização dos seus dados.";
                timer = "";
                break;
            case "ERRO_LOGIN_DA_ATUALIZACAO":
                icone = "error";
                titulo = "Senha incorreta";
                amsg = "Senha informada na atualização dos seus dados está incorreta.";
                timer = "";
                break;
            case "ERRO_EXCLUSAO_ADM":
                icone = "error";
                titulo = "Erro ao excluir";
                amsg = "Tivemos um problema ao excluir o cadastro deste cliente.";
                timer = "";
                break;
            case "CLIENTE-DELETADO":
                icone = "success";
                titulo = "Cadastro deletado.";
                amsg = "Obs: Todos horarios agendados tambem foram excluídos.";
                timer = "";
                break;
            case "erro-parametro-servlet":
                icone = "error";
                titulo = "Erro servlet";
                amsg = "Tivemos um problema ao processar sua solicitação.";
                timer = "";
                break;
            case "ERRO_EXCLUSAO_AGENDAMENTO":
                icone = "error";
                titulo = "Erro ao excluir agendamento";
                amsg = "Tivemos um problema ao excluir agendamento.";
                timer = "";
                break;
            case "agd-deletado":
                icone = "success";
                titulo = "Agendamento deletado";
                amsg = "";
                timer = "4000";
                break;
            case "FUNCIO-CAD":
                icone = "success";
                titulo = "Funcionario cadastrado.";
                amsg = "";
                timer = "";
                break;
            case "ERRO-CAD-FUNCIO":
                icone = "error";
                titulo = "Erro cadastramento!";
                amsg = "Falha ao cadastrar funcionario.";
                timer = "";
                break;
            case "CPF-NAO-CADASTRADO":
                icone = "warning";
                titulo = "CPF não encontrado";
                amsg = "Primeiro realize o cadastro do funcionario como cliente e tente novamente.";
                timer = "";
                break;
            case "CPF-NULL-FUNC":
                icone = "error";
                titulo = "Parametro CPF nulo.";
                amsg = "Verifique o codigo.";
                timer = "";
                break;
            case "ADM_NAO_PERMITIDO":
                icone = "error";
                titulo = "Acesso negado";
                amsg = "Você não tem permissão para acessar o sistema, verifique o login e tente novamente.";
                timer = "";
                break;
            case "exit":
                icone = "success";
                titulo = "Logout";
                amsg = "";
                timer = "2000";
                break;
        }
        Swal.fire({
            icon: icone,
            title: titulo,
            text: amsg,
            timer: timer
        });
    }
    ;
 
});