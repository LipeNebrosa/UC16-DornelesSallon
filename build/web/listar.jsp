<%-- 
    Document   : listar
    Created on : 20/04/2022, 08:19:34
    Author     : sala305b
--%>

<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem</title>
    </head>
    <body>
           <%
            List<Usuario> usuario = new Usuario().ListarTodos();
        %>

        <table border="1" cellspacing="0" cellpadding="5">
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
            <%
                
                
                for (Usuario u : usuario) {
                    
                    String dtNascimento = u.getDataNascimento().toString();
                    String dtNasc[] = dtNascimento.split("-");
                    String dtNascBR = dtNasc[2] + "/" + dtNasc[1] + "/" + dtNasc[0];
                    
                    String dtCadastro = u.getDataCadastro().toString();
                    String dtCad[] = dtCadastro.split("-");
                    String dtCadBR= dtCad[2] + "/" + dtCad[1] + "/" + dtCad[0];
                    
                    out.print("<tr>");

                    out.print("<td>");
                    out.print(u.getId());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(u.getNome());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(u.getCpf());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(u.getSexo());
                    out.print("</td>");
                    
                    out.print("<td>");
                    out.print(dtNascBR);
                    out.print("</td>");
                   
                    out.print("<td>");
                    out.print(u.getTelefone());
                    out.print("</td>");
                    
                    out.print("<td>");
                    out.print(u.getEmail());
                    out.print("</td>");
                    
                    out.print("<td>");
                    out.print(dtCadBR);
                    out.print("</td>");

                    out.print("<td>");
                    
                    out.print("<div style='display:inline-block'>");
                    out.print("<form action='cadastro.jsp' method='POST'>");
                    out.print("<input name='acao' type='hidden' value='editar' />");
                    out.print("<input name='id' type='hidden' value='" + u.getId() + "' />");
                    out.print("<button type='submit'>Editar</button>");
                    out.print("</form>");
                    out.print("</div>");

                    out.print("&nbsp;");
                    out.print("&nbsp;");

                    out.print("<div style='display:inline-block'>");
                    out.print("<form action='UsuarioServlet' method='POST'>");
                    out.print("<input name='acao' type='hidden' value='apagar' />");
                    out.print("<input name='id' type='hidden' value='" + u.getId()+ "' />");
                    out.print("<button type='submit'>Deletar</button>");
                    out.print("</form>");
                    out.print("</div>");

                    out.print("</td>");

                    out.print("</tr>");
                }
            %>
    </body>
</html>
