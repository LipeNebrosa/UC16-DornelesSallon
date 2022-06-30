<%-- 
    Document   : adm
    Created on : 08/06/2022, 11:17:10
    Author     : sala303b
--%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%
    String nomeUser = "Usuario", msg = "";

    Usuario userLogado = (Usuario) session.getAttribute("usuario");

    if (userLogado != null) {
        if (userLogado.getEh_adm().equals("S")) {
            String[] primNome = userLogado.getNome().split(" ");
            nomeUser = primNome[0];
        } else {
            response.sendRedirect("home.jsp?msg=ADM_NAO_PERMITIDO");
        }
    } else {
        response.sendRedirect("home.jsp?msg=ADM_NAO_PERMITIDO");
    }

    if (request.getParameter("msg") != null) {
        msg = request.getParameter("msg");
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!-- Meta tags Obrigatórias -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.css">
        <link rel="stylesheet" type="text/css" href="css/tempusdominus-bootstrap-4.css">

        <link rel="stylesheet" type="text/css" href="css/sweetalert2.css">
        <link href="css/admin.css" rel="stylesheet">
        <title>ADM - Dornelles</title>
    </head>
    <body>

        <div class="principal-adm">
            <input type="hidden" id="msg" value="<%=msg%>">
            <!-----------------------------------------------INICIO NAVBAR----------------------------------------------------------------->
            <div class="navbar-vertical">

                <div class="div-logo-adm">
                    <img class="logo-adm" src="img/logo-s-titulo.png">
                </div>


                <h3 class="titulo-adm-adm">Administração</h3><br>


                <p class="categoria-navbar">Agenda</p>

                <ul class="nav flex-column  mb-0">
                    <li class="nav-item">
                        <a class="nav-link" href="adm.jsp">Agendamentos</a>
                    </li>

                   
                </ul><br>

                <p class="categoria-navbar">Clientes</p>

                <ul class="nav flex-column mb-0">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Lista</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="home.jsp?show=registrar">Cadastrar</a>
                    </li>
                </ul><br>

                <p class="categoria-navbar">Administração</p>
                <ul class="nav flex-column mb-0">
                    <li class="nav-item">
                        <a class="nav-link " href="adm-cadF.jsp">Cadastrar Funcionario</a>
                    </li>
                </ul><br>

                <div class="footer-nav">
                    <a href="home.jsp"><button class="btn btn-light bt-voltar">Voltar</button></a>
                </div>


            </div>
            <!------------------------------------------FIM NAVBAR-------------------------------------------------------------------->

            <!------------------------------------------ INICIO HEADER----------------------------------------------------------------->
            <div class="header-pag-adm">

                <div class="col-sm">
                    <div class="titulo">
                        <h1 class="titulo-pagina text-light titulo">Lista de Clientes</h1>
                    </div> 
                </div>
                <div class="col-sm">
                    <div class="icone-user">
                        <div class="dropdown">
                            <img for="dropdownMenuButton" src="img/iconeUser.png" width="8%" alt="" align="center" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                            <a class="nav-link dropdown-toggle bt-menu-user" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
                                <%=nomeUser%>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="home.jsp">Inicio</a>
                                <a class="dropdown-item" href="home.jsp?exit=exit">Sair</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!------------------------------------------------------FIM HEADER---------------------------------------------------->

            <!------------------------------------------------ INICIO CONTEUDO DA PAGINA------------------------------------------>
            <div class="conteudo-pag-adm">
                <%List<Usuario> usuario = new Usuario().ListarTodos();%>

                <table class="table table-striped table-dark">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>CPF</th>
                            <th>Sexo</th>
                            <th>Data Nascimento</th>               
                            <th>Telefone</th>
                            <th>Email</th>
                            <th>Data Cadastro</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%

                            for (Usuario u : usuario) {

                                String dtNascimento = u.getDataNascimento().toString();
                                String dtNasc[] = dtNascimento.split("-");
                                String dtNascBR = dtNasc[2] + "/" + dtNasc[1] + "/" + dtNasc[0];

                                String dtCadastro = u.getDataCadastro().toString();
                                String dtCad[] = dtCadastro.split("-");
                                String dtCadBR = dtCad[2] + "/" + dtCad[1] + "/" + dtCad[0];

                                //Formatando CPF
                                String cpf = u.getCpf();
                                String[] sCPF = {cpf.substring(0, 3), cpf.substring(3, 6), cpf.substring(6, 9), cpf.substring(9, 11)};
                                String formatCPF = sCPF[0] + "." + sCPF[1] + "." + sCPF[2] + "-" + sCPF[3];

                                out.print("<tr>"
                                        + "<th scope='row'>" + u.getId() + "</th>"
                                        + "<td>" + u.getNome() + "</td>"
                                        + "<td>" + formatCPF + "</td>"
                                        + "<td>" + u.getSexo() + "</td>"
                                        + "<td>" + dtNascBR + "</td>"
                                        + "<td>" + u.getTelefone() + "</td>"
                                        + "<td>" + u.getEmail() + "</td>"
                                        + "<td>" + dtCadBR + "</td>"
                                        + "<td>"
                                        + "<div style='display:inline-block'>"
                                        + "<button type='button' class='btn btn-info align-middle' data-toggle='modal' data-target='#modal-atualizacao'"
                                        + "data-nome='" + u.getNome() + "' data-cpf='" + u.getCpf() + "' data-nascimento='" + u.getDataNascimento() + "' "
                                        + "data-sexo='" + u.getSexo() + "' data-telefone='" + u.getTelefone() + "'"
                                        + "data-email='" + u.getEmail() + "' data-id='" + u.getId() + "'>Editar</button>"
                                        + "</div>"
                                        + "&nbsp;"
                                        + "&nbsp;"
                                        + "<div style='display:inline-block'>"
                                        + "<button type='button' class='btn btn-danger align-middle' data-toggle='modal' "
                                        + "data-target='#Modal-deletar' data-id='" + u.getId() + "' data-nome='" + u.getNome() + "'>Excluir</button>"
                                        + "</div>"
                                        + "</td>"
                                        + "</tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <!------------------------------------------------- FIM CONTEUDO DA PAGINA-------------------------------------------->
        </div>

        <!----------------------------------------------------MODAL DE ATUALIZAÇÃO---------------------------------------------------------------------------------------------------------------------------------------------------------------->
        <div class="modal fade" id="modal-atualizacao" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="d-flex col-lg justify-content-center">
                            <blockquote class="blockquote text-center">
                                <h3>Atualização do seu cadastro:</h3>           
                            </blockquote>
                        </div>
                        <div class="d-flex col-md-1 justify-content-center">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </div>
                    <div class="modal-body">
                        <form action="UsuarioServlet" id="formRegistrar" method="POST" autocomplete="off">
                            <input type="hidden" name="acao" value="editarViaAdm" >
                            <div class="container">    
                                <div class="row">
                                    <div class="col">
                                        <label for="txtnome">Nome Completo: </label>
                                        </br>
                                        <input required class="form-control R" size="35" type ="text" id="txtnome" name="nome" value=""/>
                                    </div>
                                </div>
                                <div class="row">                    
                                    <div class="col">
                                        <label for="txtCPF">CPF: </label>
                                        </br>
                                        <input required class="form-control R" size="20" type ="text" id="txtCPFatt" name="CPF" value="" />

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">            
                                        <label for="txtDataNascimento">Data de Nascimento: </label>
                                        </br>
                                        <input required class="form-control R" size="20" type ="date" id="txtDataNascimento" name="dataNascimento" value="" />                      
                                    </div>                
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="sltEscolaridade">Sexo: </label>
                                        </br>
                                        <select required class="form-control R" id="sltSexo" name="sexo">
                                            <option value= "X"></option>
                                            <option value="M">Masculino</option>
                                            <option value="F" >Feminino</option>
                                            <option value="O">Outro</option>
                                        </select>
                                    </div>                   
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="txtemail">E-mail: </label>
                                        </br>
                                        <input required  class="form-control R" type ="email" id="txtemail" name="email" placeholder="exemplo@123.com" value="" autocomplete="off"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="txtTelefone">Telefone:  </label>
                                        </br>
                                        <input required class="form-control R" type="text" id="txtTelefoneATT" name="dddTelefone" value="" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="txtSenha">Nova senha (opcional): </label></br>

                                        <input class="form-control R" type ="password" id="txtSenhaATT" name="novasenha" onkeyup="validarNovaSenhaATT();" autocomplete="off"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="txtconfirmasenha">Confirmar nova senha (opcional): </label>
                                        </br>
                                        <input class="form-control R"  type ="password" id="txconfrimasenhatATT" name="confirmasenha" onkeyup="validarNovaSenhaATT();" autocomplete="off"/>
                                    </div>
                                </div>
                                </br>
                                <div class="row">
                                    <div class="d-flex col justify-content-center">

                                        <input type="hidden" name="id" id="idAtt"value="" >
                                        <button class="btn btn-dark" id="btRegistrarATT" type="submit">Atualizar</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--------------------------------------------------- FIM MODAL DE ATUALIZAÇÃO---------------------------------------------------------------------------------------------------------------------------------------------------------------->


        <!----------------------------------------------------MODAL DE DELETAR------------------------------------------------>
        <div class='modal fade' id='Modal-deletar' role='dialog'>
            <div class='modal-dialog modal-md'>
                <div class='modal-content'>
                    <div class='modal-header'>
                        <h5 class='modal-title'>Atenção!</h5>
                    </div>
                    <div class='modal-body'>
                        <p> </p>
                    </div>
                    <div class='modal-footer'>
                        <form action='UsuarioServlet' method='POST'>
                            <input name='acao' type='hidden' value='apagar' />
                            <input name='id' id="idDel"type='hidden' value=''/>
                            <button type='submit' class='btn btn-danger align-middle'>Deletar</button>
                            <button type='button' data-dismiss='modal' class='btn btn-default'>Cancelar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>



        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery.mask.js"></script>
        <script type="text/javascript" src="js/popper.js" ></script>
        <script type="text/javascript" src="js/moment.js" ></script>
        <script type="text/javascript" src="js/locale/pt-br.js" ></script>
        <script type="text/javascript" src="js/tempusdominus-bootstrap-4.js"></script>
        <script type="text/javascript" src="js/sweetalert2.all.min.js"></script>
        <script type="text/javascript" src="js/alertasJs.js"></script>
        <script type="text/javascript">


//                                            $(".btnButtonX").on("click", function (e) {
//                                                let idAgendamento = $(this).data("id");
//
//                                                Swal.fire({
//                                                    let idAgendamento = $()
//                                                            title: "Pergunta",
//                                                    icon: 'question',
//                                                    confirmButtonText: "<a href=''>Clicou Confirm</a>",
//                                                    cancelButtonText: "<a href=''>Não confirmou</a>",
//                                                    showCancelButton: true,
//                                                    showCloseButton: true
//                                                }).then(function (value) {
//
//                                                });
//                                            });

                                            jQuery(document).ready(function ($) {

                                                $('#Modal-deletar').on('show.bs.modal', function (event) {
                                                    var button = $(event.relatedTarget); // Botão que acionou o modal
                                                    var id = button.data('id');
                                                    var nome = button.data('nome');
                                                    

                                                    var modal = $(this);
                                                    modal.find('.modal-body p').html("Deseja excluir TODOS os dados do(a) "+ nome+" ? \n\
                                                                                                            Todos os horarios agendados serão excluidos também.");
                                                    $("#idDel").val(id);
                                                });

                                                $('#modal-atualizacao').on('show.bs.modal', function (event) {
                                                    var button = $(event.relatedTarget); // Botão que acionou o modal
                                                    var id = button.data('id');
                                                    var nome = button.data('nome');
                                                    var cpf = button.data('cpf');
                                                    var nascimento = button.data('nascimento');
                                                    var sexo = button.data('sexo');
                                                    var email = button.data('email');
                                                    var telefone = button.data('telefone');


                                                    var modal = $(this);
                                                    $("#idAtt").val(id);
                                                    $("#txtnome").val(nome);
                                                    $("#txtCPFatt").val(cpf);
                                                    $("#txtDataNascimento").val(nascimento);
                                                    $("#sltSexo").val(sexo);
                                                    $("#txtemail").val(email);
                                                    $("#txtTelefoneATT").val(telefone);
                                                });
                                                $("#txtCPFatt").mask("000.000.000-00");

                                            });

                                            function validarNovaSenhaATT() {
                                                NovaSenha = document.getElementById('txtSenhaATT').value;
                                                CNovaSenha = document.getElementById('txconfrimasenhatATT').value;
                                                if (NovaSenha !== CNovaSenha) {
                                                    document.getElementById('txtSenhaATT').style.borderColor = "red";
                                                    document.getElementById('txconfrimasenhatATT').style.borderColor = "red";
                                                    document.getElementById('btRegistrarATT').disabled = true;

                                                } else {
                                                    document.getElementById('txtSenhaATT').style.borderColor = "greenyellow";
                                                    document.getElementById('txconfrimasenhatATT').style.borderColor = "greenyellow";
                                                    document.getElementById('btRegistrarATT').disabled = false;
                                                }
                                            }

        </script>

    </body>
</html>