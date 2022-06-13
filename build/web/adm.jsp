<%-- 
    Document   : adm
    Created on : 08/06/2022, 11:17:10
    Author     : sala303b
--%>
<%@page import="modelo.Usuario"%>
<%
    String nomeUser = "Usuario";

    Usuario userLogado = (Usuario) session.getAttribute("usuario");

    if (userLogado.getEh_adm().equals("S")) {
        String[] primNome = userLogado.getNome().split(" ");
        nomeUser = primNome[0];
    }else{
        response.sendRedirect("home.jsp");
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
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
                        <a class="nav-link active" href="#">
                            Agendamentos<span class="sr-only">(Página atual)</span></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#">Configurar agenda</a>
                    </li>
                </ul><br>

                <p class="categoria-navbar">Clientes</p>

                <ul class="nav flex-column mb-0">
                    <li class="nav-item">
                        <a class="nav-link " href="listar.jsp">Listar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">Cadastrar</a>
                    </li>
                </ul><br>

                <p class="categoria-navbar">Administração</p>
                <ul class="nav flex-column mb-0">
                    <li class="nav-item">
                        <a class="nav-link " href="#">Cadastrar Funcionario</a>
                    </li>
                </ul><br>

                <div class="footer-nav">
                    <a href="home.jsp"><button class="btn btn-light bt-voltar">Voltar</button></a>
                </div>


            </div>
            <!--	FIM NAVBAR-->

            <!-- INICIO HEADER-->
            <div class="header-pag-adm">

                <h1 class="titulo-pagina text-light">Agendamentos</h1>

                <div class="icone-user">
                    <div class="dropdown">
                    <img for="dropdownMenuButton" src="img/iconeUser.png" width="8%" alt="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    
                        <a class="nav-link dropdown-toggle bt-menu-user" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
                            <%=nomeUser%>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#">Alguma ação</a>
                            <a class="dropdown-item" href="#">Outra ação</a>
                            <a class="dropdown-item" href="home.jsp?exitsession=true">Sair</a>
                        </div>
                    </div>
                </div>

            </div>
            <!-- FIM HEADER-->

            <!-- INICIO CONTEUDO DA PAGINA-->
            <div class="conteudo-pag-adm">
                <h1>abluebleubdzfgfxgcznfgnfxcfghmxghmgxchmgdxhmxgdhmgxhdchgchghm</h1>
            </div>
            <!-- FIM CONTEUDO DA PAGINA-->
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>