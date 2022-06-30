<%-- 
    Document   : adm
    Created on : 08/06/2022, 11:17:10
    Author     : sala303b
--%>
<%@page import="modelo.Funcionario"%>
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
        <input type="hidden" id="msg" value="<%=msg%>">
        <div class="principal-adm">
            <!--	INICIO NAVBAR-->
            <div class="navbar-vertical">

                <div class="div-logo-adm">
                    <img class="logo-adm" src="img/logo-s-titulo.png">
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
                        <a class="nav-link " href="home.jsp?show=registrar">Cadastrar</a>
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
                            <a class="dropdown-item" href="home.jsp">Inicio</a>
                            <a class="dropdown-item" href="home.jsp?exit=exit">Sair</a>
                        </div>
                    </div>
                </div>

            </div>
            <!-- FIM HEADER-->

            <!-- INICIO CONTEUDO DA PAGINA-->
            <div class="conteudo-pag-adm">
                <div class="container" style="margin-bottom: 80px;">    
                    <div class="row">
                        <div class="modal-content" style="color:black;">
                            <div class="modal-header">
                                <div class="d-flex col-lg justify-content-center">
                                    <blockquote class="blockquote text-center">
                                        <h3>Cadastro de Funcionario:</h3> 
                                        <p>Obs: O funcionario ja deve ter cadastro como cliente no sistema.</p>
                                    </blockquote>
                                </div>
                                <div class="d-flex col-md-1 justify-content-center">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </div>
                            <div class="modal-body" >
                                <form action="UsuarioServlet" id="formRegistrar" method="POST" autocomplete="off">
                                    <input type="hidden" name="acao" value="cadFuncionario" >
                                    <div class="container"> 
                                        <div class="row">                    
                                            <div class="col">
                                                <label for="txtCPF">CPF: </label>
                                                </br>
                                                <input required class="form-control R" size="20" type ="text" id="txtCPFatt" name="CPF" value="" />
                                            </div>
                                        </div>
                                        </br>
                                        <div class="row">
                                            <div class="col">
                                                <label for="txtnome">Nome (Apelido):</label>
                                                </br>
                                                <input required class="form-control R" size="35" type ="text" id="txtnome" name="nome" value=""/>
                                            </div>
                                        </div>
                                        </br>
                                        <div class="row">
                                            <div class="col">
                                                <label for="sltCargo">Cargo: </label>
                                                </br>
                                                <select required class="form-control R" id="sltCargo" name="cargo">
                                                    <option value="Barbeiro" >Barbeiro</option>
                                                    <option value="Atendente">Atendente</option>
                                                    <option value="Supervisor">Supervisor</option>
                                                    <option value= "Gerencia">Gerencia</option>
                                                </select>
                                            </div>                   
                                        </div>
                                        </br>
                                        <div class="row">
                                            <div class="d-flex col justify-content-center">
                                                <p> ATENÇÃO! Ao cadastrar o funcionario, ele terá permissões administrativas no sistema.</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="d-flex col justify-content-center">
                                                <input type="hidden" name="id" id="idAtt"value="" >
                                                <button class="btn btn-dark" id="btRegistrarATT" type="submit">Cadastrar</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="d-flex col justify-content-center">
                        <h2>Lista de Funcionarios</h2>
                    </div>
                </div>

                <%List<Funcionario> agenda = new Funcionario().ListarFuncionarios();%>

                <div class="row">
                    <table class="table table-striped table-dark">
                        <thead>
                            <tr>
                                <th>Matricula</th>
                                <th>Cargo</th>
                                <th>Apelido</th>
                                <th>Nome</th>
                                <th>CPF</th>
                                <th>Id Usuario</th>
                                <th>Data Cadastro</th>               
                            </tr>
                        </thead>
                        <tbody>
                            <%

                                for (Funcionario u : agenda) {

                                    String dtCad = u.getDtcadastro().toString();
                                    String dtCadd[] = dtCad.split("-");
                                    String dtCadBR = dtCadd[2] + "/" + dtCadd[1] + "/" + dtCadd[0];

                                    //Formatando CPF
                                    String cpf = u.getCpf();
                                    String[] sCPF = {cpf.substring(0, 3), cpf.substring(3, 6), cpf.substring(6, 9), cpf.substring(9, 11)};
                                    String formatCPF = sCPF[0] + "." + sCPF[1] + "." + sCPF[2] + "-" + sCPF[3];

                                    out.print("<tr>"
                                            + "<th scope='row'>" + u.getMatricula() + "</th>"
                                            + "<td>" + u.getCargo() + "</td>"
                                            + "<td>" + u.getApelido() + "</td>"
                                            + "<td>" + u.getNome() + "</td>"
                                            + "<td>" + formatCPF + "</td>"
                                            + "<td>" + u.getIdUsuario() + "</td>"
                                            + "<td>" + dtCadBR + "</td>"
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
            <script type="text/javascript" src="js/alertasJs.js"></script>

            <script>
                $("#txtCPFatt").mask("000.000.000-00");
            </script>
    </body>
</html>