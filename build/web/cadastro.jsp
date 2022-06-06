<%-- 
    Document   : cadastro
    Created on : 13/04/2022, 11:34:40
    Author     : sala305b
--%>
<%@page import="modelo.Usuario"%>
<%

    String acao = "cadastrar", id = "", nome = "", cpf = "", telefone = "", sexo = "", dtNascimento = "", email = "", adm = "";
    String selected = "";
    String btnCad = "Cadastrar";

    Usuario user = new Usuario();

    if (request.getParameter("id") != null) {
        id = request.getParameter("id");
    }
    if (request.getParameter("acao") != null) {
        acao = request.getParameter("acao");
        if (acao.equals("editar")) {
            btnCad = "Atualizar";
            boolean achou = user.BuscarPorId(id);

            if (achou) {
                nome = user.getNome();
                cpf = user.getCpf();
                telefone = user.getTelefone();
                sexo = user.getSexo();
                dtNascimento = String.valueOf(user.getDataNascimento());
                email = user.getEmail();
                adm = user.getEh_adm();
            }

        }
    }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

        <title>Registro do Cliente</title>
    </head>
    <body>
        <style>
            body{
                font-family: "Arial";
                background-image: url("img/barbearia.jpg");
                background-position: 0% 20%;
                background-size: 100%;
                background-repeat: no-repeat;

            }
            .form{

                border-top-left-radius:  12px;
                border-top-right-radius:  12px;
                border-bottom-left-radius: 12px;
                border-bottom-right-radius: 12px;

                padding: 1%;
                margin: auto;
                text-align: center;
                height:400px;
                width:21%;
                background-color: #ffffff;
                border:1px;
                border-color: #c9c9c9;
                border-style: groove;
                border-radius:3px;
            }

            .bt{
                width: 120px;
                height:40px;               
                background-image: linear-gradient(#696969, black);
                color:white;
                border-style:groove;
                border-color: #2781cf;
                border:1px;
                border-radius:3px;

                border-top-left-radius:  8px;
                border-top-right-radius:  8px;
                border-bottom-left-radius: 8px;
                border-bottom-right-radius: 8px;
            }

            .form-control{
                margin-bottom: 5px
            }
        </style>
    </head>
<body>

    <form action="UsuarioServlet" method="POST">
        <input type="hidden" name="acao" value="<%=acao%>">
        <div class="container">    
            <div class="row">
                <div class="d-flex col justify-content-center">
                    <blockquote class="blockquote text-center">
                    <h3>Olá!</h3>
                    <label>Vamos fazer o seu cadastro!</label>                
                    </blockquote>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="txtnome">Nome Completo: </label>
                    </br>
                    <input class="form-control" size="35" type ="text" id="txtnome" name="nome" value="<%=nome%>"/>
                </div>
            </div>
            <div class="row">                    
                <div class="col">
                    <label for="txtCPF">CPF: </label>
                    </br>
                    <input class="form-control" size="20" type ="text" id="txtCPF" name="CPF" value="<%=cpf%>" />

                </div>
            </div>
            <div class="row">
                <div class="col">            
                    <label for="txtDataNascimento">Data de Nascimento: </label>
                    </br>
                    <input class="form-control" size="20" type ="date" id="txtDataNascimento" name="dataNascimento" value="<%=dtNascimento%>"/>                      
                </div>                
            </div>
            <div class="row">
                <div class="col">
                    <label for="sltEscolaridade">Sexo: </label>
                    </br>
                    <select class="form-control" id="sltSexo" name="sexo">
                        <option value= null ></option>
                        <option value="M" <%//=selected; if(sexo.equals("M")){selected = ""}%>>Masculino</option>
                        <option value="F"<%//(sexo.equals("F") ? ="selected": =""));%>>Feminino</option>
                        <option value="O"<%//(sexo.equals("O") ? ="selected": =""));%>>Outro</option>
                    </select>
                </div>                   
            </div>
            <div class="row">
                <div class="col">
                    <label for="txtemail">E-mail: </label>
                    </br>
                    <input class="form-control" type ="text" id="txtemail" name="email" placeholder="exemplo@123.com" value="<%=email%>"/>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="txtTelefone">Telefone:  </label>
                    </br>
                    <input class="form-control" type="text" id="txtTelefone" name="dddTelefone"  value="<%=telefone%>"/>
                </div>
            </div>    
            <div class="row">
                <div class="col">
                    <label for="txtSenha">Senha: </label></br>

                    <input class="form-control" type ="password" id="txtSenha" name="senha" value=""/>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="txtconfirmasenha">Confirma senha: </label>
                    </br>
                    <input class="form-control"  type ="password" id="txconfrimasenhat" name="confirmasenha" value=""/>
                </div>
            </div>
            </br>
            <div class="row">
                <div class="d-flex col justify-content-center">
                    
                    <input type="hidden" name="id" value="<%=id%>">
                    <input class="btn btn-dark " type="submit" value="<%=btnCad%>">
                </div>

            </div>

        </div>


    </div>

</form>

<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.mask.js"></script>

<script type="text/javascript">

    jQuery(document).ready(function ($) {

        $("#txtCPF").mask("000.000.000-00");
        $("#txtTelefone").mask("(00) 00000-0000");

    });
</script>





<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>


</body>
</html>
