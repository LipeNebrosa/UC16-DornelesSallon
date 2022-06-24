<%-- 
    Document   : sobre
    Created on : 13/06/2022, 11:25:35
    Author     : sala303b
--%>

<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nomeUser = "Login",
            mnUser = "data-toggle='modal' data-target='#modal-login'";

    //obs: tentar verificar o "null" no Usuario.
    if ((Boolean) session.getAttribute("statusLogin") != null) {
        if ((Boolean) session.getAttribute("statusLogin")) {
            Usuario userLog = (Usuario) session.getAttribute("usuario");
            String[] primNome = userLog.getNome().split(" ");
            nomeUser = primNome[0];
            mnUser = "data-toggle='dropdown' aria-expanded='false'";
        }
    }

    if (request.getParameter("exitsession") != null) {
        session.invalidate();
        response.sendRedirect("home.jsp");
        //  request.setAttribute("exitsession",null);
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
        <link rel="stylesheet" href="css/sobre.css">
    </head>
    <body>
        <div id="principal">
            <div>

                <img class="logoleao" src="img/Logoo.png" width="47%" height="47%" alt="">

            </div>

            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">

                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="sobre.jsp">Sobre</a>
                        </li>                    
                        <li class="nav-item">
                            <a class="nav-link" href="servicos.jsp">Serviços</a>
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


                            <a style="color: white; font-size: 110%; margin-top: 18%" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" <%=mnUser%>>
                                <%=nomeUser%>
                            </a>    
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Meus agendamentos</a>
                                <a class="dropdown-item" href="#">Histórico</a>
                                <a class="dropdown-item" href="home.jsp?exitsession=true">Sair</a>
                            </div>
                        </li>
                    </ul>
                </div>

                <div>
                    <button id="bt" type="button" class="btn btn-light float-right btn-lg" style="margin-right: 15%" data-toggle="modal" 
                            data-target="#modal-login">
                        Agendar
                    </button>
                </div>

            </nav>

            <!--carrosel-->
            <!--        <div id="meio" >
                        <img id="imgctr" src="img/barbearia.jpg">
                    </div>-->
            <!--fim carrosel-->

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
                            <div class="modal-body">

                                <input type="hidden" name="acao" value="login">
                                <div class="container">

                                    <div class="row">
                                        <div class="col">
                                            <input   class="form-control" type="text" id="txtusername" name="username" placeholder="CPF ou Email">
                                        </div>
                                    </div >

                                    <div class="row">
                                        <div class="col">
                                            <input  class="form-control" type="password" id="txtpassword" name="senha" placeholder="Password">
                                        </div>
                                    </div >
                                    <div class="row">
                                        <div class="col">
                                            <input type="checkbox" name="remember" id="chkremember"/>
                                            <label style=" color: black; font-size: 12px;"for="chkremember">Lembrar-se</label>
                                        </div>
                                        <div class="col">
                                            <label class="text-muted">Esqueceu a senha?</label>
                                        </div>
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
            <!----------------------------------------------------MODAL DO REGISTRO---------------------------------------------------------------------------------------------------------------------------------------------------------------->
            <div class="modal fade" id="modal-registro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                            <form action="UsuarioServlet" method="POST">
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
                                            <input required  class="form-control R" type ="email" id="txtemail" name="email" placeholder="exemplo@123.com" />
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

                                            <input required class="form-control R" type ="password" id="txtSenha" name="senha" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label for="txtconfirmasenha">Confirma senha: </label>
                                            </br>
                                            <input required class="form-control R"  type ="password" id="txconfrimasenhat" name="confirmasenha" />
                                        </div>
                                    </div>
                                    </br>
                                    <div class="row">
                                        <div class="d-flex col justify-content-center">

                                            <input type="hidden" name="id" >
                                            <button class="btn btn-dark " type="submit">Registrar</button>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
            <!--------------------------------------------------- FIM MODAL DO REGISTRO---------------------------------------------------------------------------------------------------------------------------------------------------------------->
            <!--------------------------------------------------- INICIO DO SOBRE---------------------------------------------------------------------------------------------------------------------------------------------------------------->
            <div id="sobre-galeria">
<!--                 Carousel wrapper -->
<div
  id="carouselMultiItemExample"
  class="carousel slide carousel-dark text-center"
  data-mdb-ride="carousel"
>
<!--   Controls -->
<!--  <div class="d-flex justify-content-center mb-4">
    <button
      class="carousel-control-prev position-relative btn-dark "
      type="button"
      data-mdb-target="#carouselMultiItemExample"
      data-mdb-slide="prev"
    >
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button
      class="carousel-control-next position-relative btn-dark"
      type="button"
      data-mdb-target="#carouselMultiItemExample"
      data-mdb-slide="next"
    >
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>-->
<!--   Inner -->
  <div class="carousel-inner py-4">
<!--     Single item -->
    <div class="carousel-item active">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <div class="card" style=" border: none">
              <img
                <img src="img/dornelles.jpg" 
                class="card-img-top"
                alt="Waterfall"
              />
              <div class="card-body badge-dark">
                <h5 class="card-title">RAZÃO SOCIAL</h5>
                <p class="card-text">
                Espaço Dornelles Salon, salão de beleza Unissex e espaço de 
                estética corporal e facial. Desde 13/02/2014 esbanjando 
                profissionalismo visando sempre, a melhor experiencia já tida por qualquer cliente.
                No mercado, a empresa está localizada na Avenida Copacabana, Nº 530 - Loja 07 
                no bairro Morada De Laranjeiras em Serra - ES, CEP 29166-820.
                A empresa Dornelles Salon está cadastrada na Receita Federal 
                sob o CNAE 9602-5/01 com atividade fim de Cabeleireiros, Manicure 
                E Pedicure. 
                </p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 d-none d-lg-block">
            <div class="card" style=" border: none">
              <img src="img/carrosel.jpg"
                class="card-img-top"
                alt="Sunset Over the Sea"
              />
              <div class="card-body badge-dark">
                <h5 class="card-title">ATENDIMENTO INFANTIL</h5>
                <p class="card-text">
                  Some quick example text to build on the card title and make up the bulk
                  of the card's content.
                </p>
              </div>
            </div>
          </div>

            <div class="col-lg-4 d-none d-lg-block" width: >
              <div class="card" style=" border: none">
              <img src="img/dorneles.jpg"
                class="card-img-top"
                alt="Sunset over the Sea"
              />
              <div class="card-body badge-dark ">
                <h5 class="card-title">O NOSSO FOCO É A LEALDADE</h5>
                <p class="card-text">
                  Some quick example text to build on the card title and make up the bulk
                  of the card's content.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

<!--     Single item -->
    <div class="carousel-item">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 col-md-12">
            <div class="card">
              <img src="img/ftsobre.jpg"
                class="card-img-top"
                alt="Fissure in Sandstone"
              />
              <div class="card-body">
                <h5 class="card-title">UM GRUPO COM CENTENAS DE QUALIDADES</h5>
                <p class="card-text">
                  Some quick example text to build on the card title and make up the bulk
                  of the card's content.
                </p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 d-none d-lg-block">
            <div class="card">
              <img
                  src="img/dorneles.jpg"
                class="card-img-top"
                alt="Storm Clouds"
              />
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">
                  Some quick example text to build on the card title and make up the bulk
                  of the card's content.
                </p>
                <a href="#!" class="btn btn-primary">Button</a>
              </div>
            </div>
          </div>

          <div class="col-lg-4 d-none d-lg-block">
            <div class="card">
              <img
                src="https://mdbcdn.b-cdn.net/img/new/standard/nature/186.webp"
                class="card-img-top"
                alt="Hot Air Balloons"
              />
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">
                  Some quick example text to build on the card title and make up the bulk
                  of the card's content.
                </p>
                <a href="#!" class="btn btn-primary">Button</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

     Single item 
    <div class="carousel-item">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 col-md-12 mb-4 mb-lg-0">
            <div class="card">
              <img
                src="https://mdbcdn.b-cdn.net/img/new/standard/nature/187.webp"
                class="card-img-top"
                alt="Peaks Against the Starry Sky"
              />
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">
                  Some quick example text to build on the card title and make up the bulk
                  of the card's content.
                </p>
                <a href="#!" class="btn btn-primary">Button</a>
              </div>
            </div>
          </div>

          <div class="col-lg-4 mb-4 mb-lg-0 d-none d-lg-block">
            <div class="card">
              <img
                src="https://mdbcdn.b-cdn.net/img/new/standard/nature/188.webp"
                class="card-img-top"
                alt="Bridge Over Water"
              />
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">
                  Some quick example text to build on the card title and make up the bulk
                  of the card's content.
                </p>
                <a href="#!" class="btn btn-primary">Button</a>
              </div>
            </div>
          </div>

          <div class="col-lg-4 mb-4 mb-lg-0 d-none d-lg-block">
            <div class="card">
              <img
                src="https://mdbcdn.b-cdn.net/img/new/standard/nature/189.webp"
                class="card-img-top"
                alt="Purbeck Heritage Coast"
              />
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">
                  Some quick example text to build on the card title and make up the bulk
                  of the card's content.
                </p>
                <a href="#!" class="btn btn-primary">Button</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<!--   Inner -->
</div>
 <!--Carousel wrapper--> 
                


            </div>
            <!--------------------------------------------------- FIM SOBRE---------------------------------------------------------------------------------------------------------------------------------------------------------------->
            <footer id="myFooter">
                <div class="container-fluid">
                    <div class="row">                                

                        <div class="col-sm-6">
                            <h5>Contatos</h5>
                            <ul>
                                <li><a href="https://www.instagram.com/dornelles__salon/">Instagram</a></li>
                                <li><a href="https://www.facebook.com/alievertonsouza">Facebook</a></li>
                                <li><a>Telefones</a></li>
                            </ul>
                        </div> 
                        <div class="col-sm-6">
                            <h5>Localização</h5>

                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3744.552094930679!2d-40.2366429703511!3d-20.194366508466654!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xb81f220927caaf%3A0xc526b40c635f6dbd!2sDornelles%20Salon!5e0!3m2!1spt-BR!2sbr!4v1654266203171!5m2!1spt-BR!2sbr" 
                                    width="400" height="130" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </div>
                </div>        
            </footer>

        </div>




        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery.mask.js"></script>
        <script type="text/javascript">

            jQuery(document).ready(function ($) {

                $("#txtCPF").mask("000.000.000-00");
                $("#txtTelefone").mask("(00) 00000-0000");

            });
        </script>
    </body>
</html>
