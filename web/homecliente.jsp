<%-- 
    Document   : home
    Created on : 12/04/2022, 08:22:20
    Author     : sala305b
--%>
<%@page import="modelo.Usuario"%>
<% String nomecli = "Usuario";
Usuario u = new Usuario();

if(request.getAttribute("idlogado") != null){
    String id = (String)request.getAttribute("idlogado");
    boolean achou = u.BuscarPorId(id);
    if (achou) {
       nomecli = u.getNome();
        
    }
    
}


%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    </head>

    <style>
        btn btn-primary{

        }

        .navbar {
            z-index: 10;
            height: 100px;
            border-radius:25px;

        }
        body{
            font-family: "Arial";
            background-image: url("img/barbearia.jpg");
            background-position: 0% 20%;
            background-size: 100%;
            background-repeat: no-repeat;
            color:white;
            margin-top: 50px;
            margin-left: 50px;
            margin-right: 50px;

        }
        .logoleao{
            position:absolute;
            z-index: 11;
            float:left;
            left:50px;
            margin-top: -2%;

        }
        .navbar-collapse{
            margin-left: 320px;
            font-size: 150%;
            font-weight: lighter;
        }
        .nav-link{
            margin-right: 20px;
        }
        .txtL{
            font-size: 170%;

        }
        .txtB{
            width: 80%;
            height: 85%;
            text-align: center;


        }
        .bt{
            width: 40%;
            height:40px;           
            background-image: linear-gradient(#696969, black);
            color:white;
            border-style:groove;
            border-color: #2781cf;
            border:1px;
            border-radius:3px;

            border-top-left-radius:  6%;
            border-top-right-radius: 6% ;
            border-bottom-left-radius: 6%;
            border-bottom-right-radius: 6%;
        }
        .btR{
            width: 50%;
            height:40px;           
            background-image: linear-gradient(#696969, black);
            color:white;
            border-style:groove;
            border-color: #2781cf;
            border:1px;
            border-radius:3px;

            border-top-left-radius:  6%;
            border-top-right-radius: 6% ;
            border-bottom-left-radius: 6%;
            border-bottom-right-radius: 6%;
        }
        .txtFP{
            font-size: 12px;
            text-align: right;
            color:#337AB7 ;

            border-top-left-radius:  8px;
            border-top-right-radius:  8px;
            border-bottom-left-radius: 8px;
            border-bottom-right-radius: 8px;
        }

        .modal-body{
            margin-left: auto;
            margin-right: auto;
        }
    </style>

    <body>

        <div>
            <a class="logoleao" href="home.jsp">
                <img src="img/Logoo.png" width="47%" height="47%" alt="">
            </a>
        </div>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">

            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Sobre</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Blog</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">Serviços</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">Contato</a>
                    </li>
                </ul>

            </div>
              <ul >

                <li class="nav-item dropdown">
                    
                <img style="margin-left:105%;padding-top: 5% "src="img/iconeUser.png" width="8%" height="8%" alt="">
                    
                </li>
                </ul>
            </div>
            <div>
                
                <ul style="list-style: none;">

                <li class="nav-item dropdown">
                   
                    <a style="margin-left:65%; color: white; font-size: 110%; margin-left: 1%; padding-top: 20%" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
                       Felipe
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Configurações</a>
                        <a class="dropdown-item" href="#">Histórico</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Cancelamento</a>
                    </div>
                </li>
                </ul>
            </div>
            
            <div>
                <button type="button" class="btn btn-light float-right btn-lg" style="margin-right: 15%" >
                    Agendar
                </button>
            </div>

        </nav>

<!--        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                            <table class="form">

                                <tr>
                                    <td colspan="2">
                                        <input   class="txtB" type="text" id="txtusername" name="username" placeholder="CPF ou Email">
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2" >
                                        <input  class="txtB" type="password" id="txtpassword" name="senha" placeholder="Password">
                                    </td>
                                </tr>                                            
                                <tr>
                                    <td colspan="2">
                                        <label id="novoCliente" href="cadastro.jsp" style=" padding: 0;font-size: 12px; color: black; font-family:'Arial'; ">Ainda não nosso cliente?</label></br>
                                        <a style="color:black;"href="cadastro.jsp"value="Registrar">Registrar</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" name="remember" id="chkremember"/>
                                        <label style=" color: black; font-size: 12px;"for="chkremember">Lembrar-se</label>
                                    </td>
                                    <td>
                                        <label class="txtFP">Esqueceu a senha?</label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Sair</button>
                            <button type="submit" class="btn btn-primary btn-dark">Login</button>
                        </div>
                    </div>
            </form> 
        </div>
    </div>-->
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/jquery.mask.js"></script>
</body>
</html>
