<%-- 
    Document   : adm
    Created on : 08/06/2022, 11:17:10
    Author     : sala303b
--%>
<%@page import="modelo.Horario"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%
    String nomeUser = "Usuario";

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
            <!--	INICIO NAVBAR-->
            <div class="navbar-vertical">

                <div class="div-logo-adm">
                    <img class="logo-adm" src="img/logo-s-tit.png">
                </div>


                <h3 class="titulo-adm-adm">Administração</h3><br>


                <p class="categoria-navbar">Agenda</p>

                <ul class="nav flex-column  mb-0">
                    <li class="nav-item">
                        <a class="nav-link " href="adm.jsp">
                            Agendamentos<span class="sr-only">(Página atual)</span></a>
                    </li>

                </ul><br>

                <p class="categoria-navbar">Clientes</p>

                <ul class="nav flex-column mb-0">
                    <li class="nav-item">
                        <a class="nav-link " href="adm-listar.jsp">Lista</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">Cadastrar</a>
                    </li>
                </ul><br>

                <p class="categoria-navbar">Administração</p>
                <ul class="nav flex-column mb-0">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Cadastrar Funcionario</a>
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
                            <a class="dropdown-item" href="#">Alguma ação</a>
                            <a class="dropdown-item" href="#">Outra ação</a>
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
                        </tr>
                    </thead>
                    <tbody>
                        <%

                            for (Horario u : agenda) {

                                String dtAgendamento = u.getData().toString();
                                String dtAgend[] = dtAgendamento.split("-");
                                String dtAgendBR = dtAgend[2] + "/" + dtAgend[1] + "/" + dtAgend[0];

//                                String dtCadastro = u.getDataCadastro().toString();
//                                String dtCad[] = dtCadastro.split("-");
//                                String dtCadBR = dtCad[2] + "/" + dtCad[1] + "/" + dtCad[0];
                                out.print("<tr>"
                                        + "<th scope='row'>" + u.getId() + "</th>"
                                        + "<td>" + dtAgendBR + "</td>"
                                        + "<td>" + u.getHorario() + "</td>"
                                        + "<td>" + u.getNomeCliente() + "</td>"
                                        + "<td>" + u.getCpf() + "</td>"
                                        + "<td>"
                                        + "<div style='display:inline-block'>"
                                        + "<form action='cadastro.jsp' method='POST'>"
                                        + "<input name='acao' type='hidden' value='editar' />"
                                        + "<input name='idPessoa' type='hidden' value='" + u.getId() + "' />"
                                        + "<button type='submit' class='btn btn-info align-middle'>Editar</button>"
                                        + "</form>"
                                        + "</div>"
                                        + "&nbsp;"
                                        + "&nbsp;"
                                        + "<div style='display:inline-block'>"
                                        + "<button type='button' class='btn btn-danger align-middle btnButtonX' data-toggle='modal' data-id='" + u.getId() + "' data-target='#Modal" + u.getId() + "'>Excluir</button>"
                                        + "<div class='modal fade' id='Modal" + u.getId() + "' role='dialog'>"
                                        + "<div class='modal-dialog modal-md'>"
                                        + "  <div class='modal-content'>"
                                        + "  <div class='modal-header'>"
                                        + "<h5 class='modal-title'>Atenção!</h5>"
                                        + "  </div>"
                                        + "  <div class='modal-body'>"
                                        + "      <p> Deseja excluir TODOS os dados do(a) " + u.getNomeCliente() + "?</p>"
                                        + "   </div>"
                                        + "  <div class='modal-footer'>"
                                        + "<form action='UsuarioServlet' method='POST'>"
                                        + "<input name='acao' type='hidden' value='apagar' />"
                                        + "<input name='id' type='hidden' value='" + u.getId() + "' />"
                                        + "<button type='submit' class='btn btn-danger align-middle'>Deletar</button>"
                                        + "       <button type='button' data-dismiss='modal' class='btn btn-default'>Cancelar</button>"
                                        + " </div>"
                                        + " </div>"
                                        + " </div>"
                                        + "</div>"
                                        + "</form>"
                                        + "</div>"
                                        + "</td>"
                                        + "</tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <!-- FIM CONTEUDO DA PAGINA-->
        </div>




        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery.mask.js"></script>
        <script type="text/javascript" src="js/popper.js" ></script>
        <script type="text/javascript" src="js/moment.js" ></script>
        <script type="text/javascript" src="js/locale/pt-br.js" ></script>
        <script type="text/javascript" src="js/tempusdominus-bootstrap-4.js"></script>
        <script type="text/javascript" src="js/sweetalert2.all.min.js"></script>
        
    </body>
</html>