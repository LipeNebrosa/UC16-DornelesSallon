<%-- 
    Document   : home
    Created on : 12/04/2022, 08:22:20
    Author     : Felipe Ferreira, Gladson Rosa & William Roseno
--%>

<%@page import="modelo.Usuario"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String nomeUser = "Login",
            userMenu = "data-toggle='modal' data-target='#modal-login'",
            redirectAdm = "",
            btModal = "'#modal-login'",
            msg = "",
            id = "",
            nome = "",
            cpf = "",
            nascimento = "",
            sexo = "",
            email = "",
            telefone = "";

    if ((Boolean) session.getAttribute("statusLogin") != null) {
        if ((Boolean) session.getAttribute("statusLogin")) {
            Usuario userLogado = (Usuario) session.getAttribute("usuario");
            String[] primNome = userLogado.getNome().split(" ");
            nomeUser = primNome[0];
            userMenu = "data-toggle='dropdown' aria-expanded='false'";
            btModal = "'#modal-agendamento'";

            id = String.valueOf(userLogado.getId());
            nome = userLogado.getNome();
            cpf = userLogado.getCpf();
            nascimento = String.valueOf(userLogado.getDataNascimento());
            sexo = userLogado.getSexo();
            email = userLogado.getEmail();
            telefone = userLogado.getTelefone();

            if (userLogado.getEh_adm().equals("S")) {
                redirectAdm = "<a class='dropdown-item' href='adm.jsp'>Administração</a>";
            }
        }
    } else {//fazer codigo de msg com erro de login
    }

    if (request.getParameter("msg") != null) {
        msg = request.getParameter("msg");
    }

    if (request.getParameter("exit") != null) {
        session.invalidate();
        response.sendRedirect("home.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dornelles Salon</title>

        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.css">


        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.css">
        <link rel="stylesheet" type="text/css" href="css/tempusdominus-bootstrap-4.css">

        <link rel="stylesheet" type="text/css" href="css/sweetalert2.css">

        <link rel="stylesheet" href="css/estilo.css">
    </head>

    <body>
        <div id="principal">
            <input type="hidden" id="msg" value="<%=msg%>"
            <div>

                <img class="logoleao" src="img/Logoo.png" width="47%" height="47%" alt="">

            </div>

            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">

                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="sobre.jsp">Sobre</a>
                        </li>                    
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="modal" data-target="#modalServicos">Serviços</a>
                        </li>

                    </ul>

                </div>
                <div>
                    <ul >

                        <li class="nav-item dropdown">

                            <img style="margin-left:100%; margin-top: 5% "src="img/iconeUser.png" width="8%" height="8%" alt="">

                        </li>
                    </ul>
                </div>  

                <div>
                    <ul style="list-style: none; margin-right: 0;">

                        <li class="nav-item dropdown">


                            <a style="color: white; font-size: 110%; margin-top: 18%" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" <%=userMenu%>>
                                <%=nomeUser%>
                            </a>    
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Meus agendamentos</a>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-atualizacao">Editar Perfil</a>
                                <%=redirectAdm%>
                                <a class="dropdown-item" href="home.jsp?exit=exit">Sair</a>
                            </div>
                        </li>
                    </ul>
                </div>

                <div>
                    <button id="bt" type="button" class="btn btn-light float-right btn-lg" style="margin-right: 15%" data-toggle="modal" 
                            data-target=<%=btModal%>>
                        Agendar
                    </button>
                </div>

            </nav>

            <!--carrosel-->
            <!--        <div id="meio" >
                        <img id="imgctr" src="img/barbearia.jpg">
                    </div>-->
            <!--fim carrosel-->

            <!----------------------------------------------------MODAL DE LOGIN----------------------------------------------------------------------------------------------------------------------------------->
            <div class="modal fade" id="modal-login" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <form action="UsuarioServlet" method="POST">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel" style="color:black; ">Login</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body ajuste-body">

                                <input type="hidden" name="acao" value="login">
                                <div class="container">

                                    <div class="row">
                                        <div class="col">
                                            <input   class="form-control" type="text" id="txtusername" name="username" placeholder="CPF ou Email">
                                        </div>
                                    </div >

                                    <div class="row">
                                        <div class="col">
                                            <input  class="form-control" type="password" id="txtpassword" name="senha" placeholder="Senha">
                                        </div>
                                    </div >
                                    <div class="row">

                                        <!-- BOTAR PRA FUNCIONAR SE DER TEMPO   <div class="col">
                                        <label class="text-muted">Esqueceu a senha?</label>
                                        </div>-->
                                    </div >
                                    <div class="row">
                                        <div class="d-flex col justify-content-center ">
                                            <label id="novoCliente" href="cadastro.jsp" style=" padding: 0;font-size: 12px; color: black; font-family:'Arial'; ">Ainda não nosso cliente?</label>
                                        </div>
                                    </div >
                                    <div class="row">
                                        <div class="d-flex col justify-content-center ">
                                            <button type="button" class="btn btn-secondary justify-content-center" data-toggle="modal" data-target="#modal-registro" data-dismiss="modal">
                                                Registrar
                                            </button>
                                        </div>
                                    </div >

                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Sair</button>
                                <button type="submit" class="btn btn-primary btn-dark">Login</button>
                            </div>
                        </div>

                    </div>
                </form> 
            </div>
            <!----------------------------------------------------FIM DO MODAL DE LOGIN----------------------------------------------------------------------------------------------------------------------------------->

            <!----------------------------------------------------MODAL DO REGISTRO---------------------------------------------------------------------------------------------------------------------------------------------------------------->
            <div class="modal" id="modal-registro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="d-flex col-lg justify-content-center">
                                <blockquote class="blockquote text-center">
                                    <h3>Olá!</h3>
                                    <label>Vamos fazer o seu cadastro!</label>           
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
                                <input type="hidden" name="acao" value="cadastrar" >
                                <div class="container">    
                                    <div class="row">
                                        <div class="col">
                                            <label for="txtnome">Nome Completo: </label>
                                            </br>
                                            <input required class="form-control R" size="35" type ="text" id="txtnome" name="nome" />
                                        </div>
                                    </div>
                                    <div class="row">                    
                                        <div class="col">
                                            <label for="txtCPF">CPF: </label>
                                            </br>
                                            <input required class="form-control R" size="20" type ="text" id="txtCPF" name="CPF"  />

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">            
                                            <label for="txtDataNascimento">Data de Nascimento: </label>
                                            </br>
                                            <input required class="form-control R" size="20" type ="date" id="txtDataNascimento" name="dataNascimento" />                      
                                        </div>                
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label for="sltEscolaridade">Sexo: </label>
                                            </br>
                                            <select required class="form-control R" id="sltSexo" name="sexo">
                                                <option value= "X" ></option>
                                                <option value="M" >Masculino</option>
                                                <option value="F">Feminino</option>
                                                <option value="O">Outro</option>
                                            </select>
                                        </div>                   
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label for="txtemail">E-mail: </label>
                                            </br>
                                            <input required  class="form-control R" type ="email" id="txtemail" name="email" placeholder="exemplo@123.com" autocomplete="off"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label for="txtTelefone">Telefone:  </label>
                                            </br>
                                            <input required class="form-control R" type="text" id="txtTelefone" name="dddTelefone"  />
                                        </div>
                                    </div>    
                                    <div class="row">
                                        <div class="col">
                                            <label for="txtSenha">Senha: </label></br>

                                            <input required class="form-control R" type ="password" id="txtSenha" name="senha" onkeyup="validarSenha();" autocomplete="off"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label for="txtconfirmasenha">Confirma senha: </label>
                                            </br>
                                            <input required class="form-control R"  type ="password" id="txconfrimasenhat" name="confirmasenha" onkeyup="validarSenha();" autocomplete="off"/>
                                        </div>
                                    </div>
                                    </br>
                                    <div class="row">
                                        <div class="d-flex col justify-content-center">


                                            <button class="btn btn-dark" disabled id="btRegistrar" type="submit">Registrar</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--------------------------------------------------- FIM MODAL DO REGISTRO---------------------------------------------------------------------------------------------------------------------------------------------------------------->


            <!----------------------------------------------------MODAL DE ATUALIZAÇÃO---------------------------------------------------------------------------------------------------------------------------------------------------------------->
            <div class="modal" id="modal-atualizacao" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                <input type="hidden" name="acao" value="editar" >
                                <div class="container">    
                                    <div class="row">
                                        <div class="col">
                                            <label for="txtnome">Nome Completo: </label>
                                            </br>
                                            <input required class="form-control R" size="35" type ="text" id="txtnome" name="nome" value="<%=nome%>"/>
                                        </div>
                                    </div>
                                    <div class="row">                    
                                        <div class="col">
                                            <label for="txtCPF">CPF: </label>
                                            </br>
                                            <input required class="form-control R" size="20" type ="text" id="txtCPFatt" name="CPF" value="<%=cpf%>" disabled/>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">            
                                            <label for="txtDataNascimento">Data de Nascimento: </label>
                                            </br>
                                            <input required class="form-control R" size="20" type ="date" id="txtDataNascimento" name="dataNascimento" value="<%=nascimento%>" disabled/>                      
                                        </div>                
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label for="sltEscolaridade">Sexo: </label>
                                            </br>
                                            <select required class="form-control R" id="sltSexo" name="sexo">
                                                <option value= "X"></option>
                                                <option value="M" <%=sexo.equals("M") ? "selected" : ""%>>Masculino</option>
                                                <option value="F" <%=sexo.equals("F") ? "selected" : ""%>>Feminino</option>
                                                <option value="O" <%=sexo.equals("O") ? "selected" : ""%>>Outro</option>
                                            </select>
                                        </div>                   
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label for="txtemail">E-mail: </label>
                                            </br>
                                            <input required  class="form-control R" type ="email" id="txtemail" name="email" placeholder="exemplo@123.com" value="<%=email%>" autocomplete="off"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label for="txtTelefone">Telefone:  </label>
                                            </br>
                                            <input required class="form-control R" type="text" id="txtTelefoneATT" name="dddTelefone" value="<%=telefone%>" />
                                        </div>
                                    </div>    
                                    <div class="row">
                                        <div class="col">
                                            <label for="txtSenha">Senha atual: </label></br>

                                            <input required class="form-control R" type ="password" id="txtSenhaAtual" name="senha" autocomplete="off" onkeyup="validarSenhaATT();"/>
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

                                            <input type="hidden" name="id" value="<%=id%>" >
                                            <input type="hidden" name="attCPF" value="<%=cpf%>" >
                                            <input type="hidden" name="attNascimento" value="<%=nascimento%>" >
                                            <button class="btn btn-dark" disabled id="btRegistrarATT" type="submit">Atualizar</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--------------------------------------------------- FIM MODAL DE ATUALIZAÇÃO---------------------------------------------------------------------------------------------------------------------------------------------------------------->



            <!--------------------------------------------------- MODAL DO SERVIÇOS---------------------------------------------------------------------------------------------------------------------------------------------------------------->
            <div class="modal fade bd-example-modal-lg" id="modalServicos" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModalTtlServicos">Serviços</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body servicos">
                            <div class="row">
                                <div class="col">CORTE DE CABELO</div>
                                <div class="col">R$40</div>
                            </div>
                            <div class="row">
                                <div class="col">CORTE DE BARBA</div>
                                <div class="col">R$35</div>
                            </div>
                            <div class="row">
                                <div class="col">BARBOTERAPIA</div>
                                <div class="col">R$50</div>
                            </div>
                            <div class="row">
                                <div class="col">SOMBRANCELHA</div>
                                <div class="col">R$15</div>
                            </div>
                            <div class="row">
                                <div class="col">ACABAMENTO DE CORTE</div>
                                <div class="col">R$15</div>
                            </div>
                            <div class="row">
                                <div class="col">ACABAMENTO DE BARBA</div>
                                <div class="col">R$15</div>
                            </div>
                            <div class="row" >
                                <div class="col" >MÁSCARA BLACK (LIMPEZA DE PELE)</div>
                                <div class="col">R$30</div>
                            </div>
                            <div class="row">
                                <div class="col">SELAGEM</div>
                                <div class="col"> A PARTIR DE R$100</div>
                            </div>
                            <div class="row">
                                <div class="col">PINTURA DE CABELO</div>
                                <div class="col">A PARTIR DE R$40</div>

                            </div>                            
                            <div class="row">
                                <div class="col">HIDRATAÇÃO</div>
                                <div class="col">A PARTIR DE R$30</div>

                            </div>
                            <div class="row">
                                <div class="col">RELAXAMENTO</div>
                                <div class="col">A PARTIR DE R$60</div>

                            </div>                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>

                    </div>
                </div>
            </div>

            <!--------------------------------------------------- FIM MODAL DO SERVIÇOS---------------------------------------------------------------------------------------------------------------------------------------------------------------->




            <!----------------------------------------------------- INICIO MODAL AGENDAMENTO------------------------------------------------------------------------------>
            <div class="modal fade" id="modal-agendamento" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Agendamento</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>


                        <form action="UsuarioServlet" id="formHorario" method="POST" autocomplete="off">
                            <input type="hidden" name="acao" value="cadHorario">
                            <input type="hidden" name="idCliente" id="idCliente" value="<%=id%>">
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-sm">
                                            <label >Data:  </label>
                                            &nbsp;
                                            <div style="overflow:hidden;">
                                                <div class="form-group">
                                                    <div class="row justify-content-center">
                                                        <div class="col-md-8">
                                                            <div id="datetimepicker13"></div>
                                                            <input type="hidden" id="dataAgendam" name="dataAgendamento" value=""/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> 
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-sm">
                                            <label for="slHorario">Horario:  </label>
                                            &nbsp;
                                            <select required class="form-control R" id="sltHoraAgendamento" name="hora">
                                                <option value="9:00" >9:00</option>
                                                <option value="10:30" >10:00</option>
                                                <option value="11:00" >11:00</option>
                                                <option value="12:00" >12:00</option>
                                                <option value="13:00" >13:00</option>
                                                <option value="14:00" >14:00</option>
                                                <option value="15:00" >15:00</option>
                                                <option value="16:00" >16:00</option>
                                                <option value="17:00" >17:00</option>
                                                <option value="18:00" >18:00</option>
                                                <option value="19:00" >19:00</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                    <button type="button" class="btn btn-primary" id="btnAgendarr">Agendar</button>
                                </div>

                            </div>
                        </form>
                    </div>

                </div>        
            </div>        

            <!----------------------------------------------------- FIM MODAL AGENDAMENTO------------------------------------------------------------------------------>

            <!----------------------------------------------------- INICIO DO RODAPÉ----------------------------------------------------------------------------------->

            <footer id="myFooter">
                <div class="container-fluid">
                    <div class="row">                                

                        <div class="col-sm-2">
                            <h5 style="margin-left: 43%">Contatos</h5>
                            <ul>
                                <li><img style="width: 14%; margin-left: 43%" src="img/whatsapp.png"/>
                                    <p style="margin-top:-12%; margin-left: 60%">(27)99934-6622</p></li>
                                <li><a href="https://www.instagram.com/dornelles__salon/"> <img style="width: 14%; margin-left: 28%; margin-top: 6%" src="img/instagram midia.png"/></a>
                                    <p style="margin-top:-12%; margin-left: 60%">@DornellesSalon</p></li>
                                <!--<li><a href="https://www.instagram.com/dornelles__salon/">@DornellesSalon</a></li>-->
                                <li><a href="https://www.facebook.com/alievertonsouza"> <img style="width: 14%; margin-left: 28%; margin-top: 6%" src="img/facebook quadrado.png"/></a>
                                    <p style="margin-top:-12%; margin-left: 60%">@DornellesSalon</p></li>                                
                                <!--<li><a href="https://www.facebook.com/alievertonsouza">@DornellesSalon</a></li>-->
                                <li><img style="width: 14%; margin-left: 43%; margin-top: 6%" src="img/111025_phone_icon.png"/>
                                    <p style="margin-top:-12%; margin-left: 60%">(27)3209-1647</p></li></ul>
                        </div> 
                        <div class="col-sm-6">
                            <h5 style="margin-left: 25%">Localização</h5>

                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3744.552094930679!2d-40.2366429703511!3d-20.194366508466654!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xb81f220927caaf%3A0xc526b40c635f6dbd!2sDornelles%20Salon!5e0!3m2!1spt-BR!2sbr!4v1654266203171!5m2!1spt-BR!2sbr" 
                                    width="700" height="130" style="border:0; margin-left: 25%;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

                            <br>                                
                            <p style="margin-left: 60%; margin-top: 3%"> CopyRight &COPY;</p>

                        </div>
                        <div class="col-sm-4" >
                            <h5 style="margin-left: 30%;">Horários de atendimento</h5>

                           <ul class="opening_times" style="margin-left: 30%;">
                                <li>
                                    <span class="day">Domingo</span>
                                    <span style="margin-left: 18.9%" class="time">Fechado</span>
                                </li>
                                <li>
                                    <span class="day">Segunda</span>
                                    <span style="margin-left: 18.9%" class="time">Fechado</span>
                                </li>
                                <li>
                                    <span class="day">Terça</span>
                                    <span style="margin-left: 16.9%" class="time">09:00 - 19:30</span>
                                </li>
                                <li>
                                    <span class="day">Quarta</span>
                                    <span style="margin-left: 14.7%" class="time">09:00 - 19:30</span>
                                </li>
                                <li>
                                    <span class="day">Quinta</span>
                                    <span style="margin-left: 15%" class="time">09:00 - 19:30</span>
                                </li>
                                <li>
                                    <span class="day">Sexta</span>
                                    <span style="margin-left: 16.6%" class="time">09:00 - 19:30</span>
                                </li>
                                <li>
                                    <span class="day">Sábado</span>
                                    <span style="margin-left: 13.2%" class="time">09:00 - 20:00</span>
                                </li>
                            </ul>

                        </div>
                    </div>
                </div>
            </footer>

            <!----------------------------------------------------- FIM DO RODAPÉ------------------------------------------------------------------------------>


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


                                                jQuery(document).ready(function ($) {
                                                 
                                                    $("#txtCPF").mask("000.000.000-00");
                                                    $("#txtCPFatt").mask("000.000.000-00");
                                                    $("#txtTelefone").mask("(00) 00000-0000");
                                                    $("#txtTelefoneATT").mask("(00) 00000-0000");


                                                    $('#datetimepicker13').datetimepicker({
                                                        format: 'L',
                                                        inline: true,
                                                        daysOfWeekDisabled: [0, 1],
                                                        minDate: moment()
                                                    });
                                                    // $(".picker-switch.accordion-toggle").html("");

                                                    $("#datetimepicker13").on("change.datetimepicker", function (e) {
                                                        //let diaselecionado = $(".day.active").data("day");
                                                        // console.log((e.date).format('YYYY-MM-DD'));
                                                        document.getElementById('dataAgendam').value = (e.date).format('YYYY-MM-DD');
                                                        console.log(document.getElementById('dataAgendam').value);
                                                    });

                                                    $("#btnAgendarr").on("click", function (e) {
                                                        const idClient = $("#idCliente").val();
                                                        const dataAgenda = $("#dataAgendam").val();
                                                        const horaAgenda = $("#sltHoraAgendamento").val();
                                                        console.log("Script agendamento iniciado");
                                                        $.ajax({
                                                            url: "UsuarioServlet",
                                                            method: "POST",
                                                            data: {
                                                                "acao": "cadHorario",
                                                                "idCliente": idClient,
                                                                "dataAgendamento": dataAgenda,
                                                                "hora": horaAgenda
                                                            },
                                                            success: function (resp) {
                                                                let error = resp.erro;
                                                                let msg = resp.msg;
                                                                let icone = resp.icone;

                                                                if (error === "false") {
                                                                    Swal.fire({
                                                                        icon: icone,
                                                                        title: 'Feito!',
                                                                        text: msg
                                                                    });
                                                                } else {
                                                                    Swal.fire({
                                                                        icon: icone,
                                                                        title: 'Oops...',
                                                                        text: msg
                                                                    });
                                                                }
                                                                console.error(resp);
                                                            },
                                                            error: function (err) {
                                                                console.error(err);
                                                            }


                                                        });

                                                    });

                                                });

                                                function validarSenha() {
                                                    NovaSenha = document.getElementById('txtSenha').value;
                                                    CNovaSenha = document.getElementById('txconfrimasenhat').value;

                                                    if (NovaSenha !== CNovaSenha) {
                                                        document.getElementById('txtSenha').style.borderColor = "red";
                                                        document.getElementById('txconfrimasenhat').style.borderColor = "red";
                                                        document.getElementById('btRegistrar').disabled = true;

                                                    } else {
                                                        document.getElementById('txtSenha').style.borderColor = "greenyellow";
                                                        document.getElementById('txconfrimasenhat').style.borderColor = "greenyellow";
                                                        document.getElementById('btRegistrar').disabled = false;
                                                    }
                                                }
                                                function validarSenhaATT() {
                                                    if (document.getElementById('txtSenhaAtual').value === "") {
                                                        document.getElementById('btRegistrarATT').disabled = true;
                                                    } else {
                                                        document.getElementById('btRegistrarATT').disabled = false;
                                                    }
                                                }
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
                                                        if (document.getElementById('txtSenhaAtual').value !== "") {
                                                            document.getElementById('btRegistrarATT').disabled = false;
                                                        }
                                                    }
                                                }


            </script>




    </body>


</html>
