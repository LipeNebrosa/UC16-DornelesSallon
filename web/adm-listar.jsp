<%-- 
    Document   : adm
    Created on : 08/06/2022, 11:17:10
    Author     : sala303b
--%>
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="css/admin.css" rel="stylesheet">
        <title>ADM - Dornelles</title>
    </head>
    <body>

        <div class="principal-adm">
            <!-----------------------------------------------INICIO NAVBAR----------------------------------------------------------------->
            <div class="navbar-vertical">

                <div class="div-logo-adm">
                    <img class="logo-adm" src="img/logo-s-tit.png">
                </div>


                <h3 class="titulo-adm-adm">Administração</h3><br>


                <p class="categoria-navbar">Agenda</p>

                <ul class="nav flex-column  mb-0">
                    <li class="nav-item">
                        <a class="nav-link" href="adm.jsp">Agendamentos</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#">Configurar agenda</a>
                    </li>
                </ul><br>

                <p class="categoria-navbar">Clientes</p>

                <ul class="nav flex-column mb-0">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Lista</a>
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
            <!------------------------------------------FIM NAVBAR-------------------------------------------------------------------->

            <!------------------------------------------ INICIO HEADER----------------------------------------------------------------->
            <div class="header-pag-adm">
                <div class="titulo">
                    <h1 class="titulo-pagina text-light">Lista de Clientes</h1>
                </div> 
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

                                out.print("<tr>"
                                        + "<th scope='row'>" + u.getId() + "</th>"
                                        + "<td>" + u.getNome() + "</td>"
                                        + "<td>" + u.getCpf() + "</td>"
                                        + "<td>" + u.getSexo() + "</td>"
                                        + "<td>" + dtNascBR + "</td>"
                                        + "<td>" + u.getTelefone() + "</td>"
                                        + "<td>" + u.getEmail() + "</td>"
                                        + "<td>" + dtCadBR + "</td>"
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
                                        + "<button type='button' class='btn btn-danger align-middle' data-toggle='modal' data-target='#Modal" + u.getId() + "'>Excluir</button>"
                                        + "<div class='modal fade' id='Modal" + u.getId() + "' role='dialog'>"
                                        + "<div class='modal-dialog modal-md'>"
                                        + "  <div class='modal-content'>"
                                        + "  <div class='modal-header'>"
                                        + "<h5 class='modal-title'>Atenção!</h5>"
                                        + "  </div>"
                                        + "  <div class='modal-body'>"
                                        + "      <p> Deseja excluir TODOS os dados do(a) " + u.getNome() + "?</p>"
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

            <!------------------------------------------------- FIM CONTEUDO DA PAGINA-------------------------------------------->
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>