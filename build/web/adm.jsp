<%-- 
    Document   : adm
    Created on : 08/06/2022, 11:17:10
    Author     : sala303b
--%>
<%@page import="modelo.Horario"%>
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
            <!--	INICIO NAVBAR-->
            <div class="navbar-vertical">

                <div class="div-logo-adm">
                    <img class="logo-adm" src="img/logo-s-titulo.png">
                </div>


                <h3 class="titulo-adm-adm">Administração</h3><br>


                <p class="categoria-navbar">Agenda</p>

                <ul class="nav flex-column  mb-0">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">
                            Agendamentos<span class="sr-only">(Página atual)</span></a>
                    </li>


                </ul><br>

                <p class="categoria-navbar">Clientes</p>

                <ul class="nav flex-column mb-0">
                    <li class="nav-item">
                        <a class="nav-link " href="adm-listar.jsp">Lista</a>
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
            <!--	FIM NAVBAR-->

            <!-- INICIO HEADER-->
            <div class="header-pag-adm">

                <h1 class="titulo-pagina text-light titulo" >Agendamentos</h1>

                <div class="icone-user">
                    <div class="dropdown">
                        <img for="dropdownMenuButton" src="img/iconeUser.png" width="8%" alt="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

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
            <!-- FIM HEADER-->

            <!-- INICIO CONTEUDO DA PAGINA-->
            <div class="conteudo-pag-adm">
                <%List<Horario> agenda = new Horario().ListarHorarios();%>

                <table class="table table-striped table-dark">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Data</th>
                            <th>Hora</th>
                            <th>Cliente</th>
                            <th>CPF</th>               
                            <th>Telefone</th>               
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%

                            for (Horario u : agenda) {
                                //Formatando Data
                                String dtAgendamento = u.getData().toString();
                                String dtAgend[] = dtAgendamento.split("-");
                                String dtAgendBR = dtAgend[2] + "/" + dtAgend[1] + "/" + dtAgend[0];

                                //Formatando CPF
                                String cpf = u.getCpf();
                                String[] sCPF = {cpf.substring(0, 3), cpf.substring(3, 6), cpf.substring(6, 9), cpf.substring(9, 11)};
                                String formatCPF = sCPF[0] + "." + sCPF[1] + "." + sCPF[2] + "-" + sCPF[3];

                                //Formatando hora 09:00:00
                                String hora = u.getHorario().substring(0, 5);

                                out.print("<tr>"
                                        + "<th scope='row'>" + u.getId() + "</th>"
                                        + "<td>" + dtAgendBR + "</td>"
                                        + "<td>" + hora + "</td>"
                                        + "<td>" + u.getNomeCliente() + "</td>"
                                        + "<td >" + formatCPF + "</td>"
                                        + "<td >" + u.getTelefone() + "</td>"
                                        + "<td>"
                                        + "&nbsp;"
                                        + "&nbsp;"
                                        + "<div style='display:inline-block'>"
                                        + "<button type='button' class='btn btn-danger align-middle btnButtonX' data-toggle='modal' data-id='" + u.getId() + "' "
                                        + "data-nome='" + u.getNomeCliente() + "' data-dia='" + dtAgendBR + "' data-hora='" + hora + "' data-target='#Modal-delete'>Excluir</button>"
                                        + "</div>"
                                        + "</td>"
                                        + "</tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <!-- FIM CONTEUDO DA PAGINA-->
            <!-------------------------------- MODAL DE EXCLUSÃO------->
            <div class='modal fade' id='Modal-delete' role='dialog'>
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
                                <input name='acao' type='hidden' value='apagarAgendamento' />
                                <input name='id' id="idid" type='hidden' value=""/>
                                <button type='submit' class='btn btn-danger align-middle'>Deletar</button>
                                <button type='button' data-dismiss='modal' class='btn btn-default'>Cancelar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-------------------------------- FIM MODAL DE EXCLUSÃO------->
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

        <script>
            jQuery(document).ready(function ($) {
                $('#Modal-delete').on('show.bs.modal', function (event) {
                    var button = $(event.relatedTarget); // Botão que acionou o modal
                    var id = button.data('id');
                    var nome = button.data('nome');
                    var dia = button.data('dia');
                    var hora = button.data('hora');

                    var modal = $(this);
                    modal.find('.modal-body p').html("Deseja excluir o agendamento do(a) " + nome + ", dia " + dia + " as " + hora + "?");
                    $("#idid").val(id);
                });
            });

        </script>

    </body>
</html>