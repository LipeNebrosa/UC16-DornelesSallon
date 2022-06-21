package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.Usuario;

public final class sobre_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

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

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Dornelles Salon</title>\n");
      out.write("\n");
      out.write("        <!-- Required meta tags -->\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("\n");
      out.write("        <!-- Bootstrap CSS -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/estilo.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"principal\">\n");
      out.write("            <div>\n");
      out.write("\n");
      out.write("                <img class=\"logoleao\" src=\"img/Logoo.png\" width=\"47%\" height=\"47%\" alt=\"\">\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\">\n");
      out.write("\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"navbarNavAltMarkup\">\n");
      out.write("                    <ul class=\"navbar-nav\">\n");
      out.write("                        <li class=\"nav-item active\">\n");
      out.write("                            <a class=\"nav-link\" href=\"#\">Home <span class=\"sr-only\">(current)</span></a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"nav-item\">\n");
      out.write("                            <a class=\"nav-link\" href=\"#\">Sobre</a>\n");
      out.write("                        </li>                    \n");
      out.write("                        <li class=\"nav-item\">\n");
      out.write("                            <a class=\"nav-link\" href=\"servicos.jsp\">Serviços</a>\n");
      out.write("                        </li>\n");
      out.write("\n");
      out.write("                    </ul>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <div>\n");
      out.write("                    <ul >\n");
      out.write("\n");
      out.write("                        <li class=\"nav-item dropdown\">\n");
      out.write("\n");
      out.write("                            <img style=\"margin-left:100%; margin-top: 5% \"src=\"img/iconeUser.png\" width=\"8%\" height=\"8%\" alt=\"\">\n");
      out.write("\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>  \n");
      out.write("                \n");
      out.write("                <div>\n");
      out.write("                    <ul style=\"list-style: none; margin-right: 0;\">\n");
      out.write("\n");
      out.write("                        <li class=\"nav-item dropdown\">\n");
      out.write("                                \n");
      out.write("                          \n");
      out.write("                            <a style=\"color: white; font-size: 110%; margin-top: 18%\" class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" ");
      out.print(mnUser);
      out.write(">\n");
      out.write("                                ");
      out.print(nomeUser);
      out.write("\n");
      out.write("                            </a>    \n");
      out.write("                            <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n");
      out.write("                                <a class=\"dropdown-item\" href=\"#\">Meus agendamentos</a>\n");
      out.write("                                <a class=\"dropdown-item\" href=\"#\">Histórico</a>\n");
      out.write("                                <a class=\"dropdown-item\" href=\"home.jsp?exitsession=true\">Sair</a>\n");
      out.write("                            </div>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div>\n");
      out.write("                    <button id=\"bt\" type=\"button\" class=\"btn btn-light float-right btn-lg\" style=\"margin-right: 15%\" data-toggle=\"modal\" \n");
      out.write("                            data-target=\"#modal-login\">\n");
      out.write("                        Agendar\n");
      out.write("                    </button>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </nav>\n");
      out.write("\n");
      out.write("            <!--carrosel-->\n");
      out.write("            <!--        <div id=\"meio\" >\n");
      out.write("                        <img id=\"imgctr\" src=\"img/barbearia.jpg\">\n");
      out.write("                    </div>-->\n");
      out.write("            <!--fim carrosel-->\n");
      out.write("\n");
      out.write("            <div class=\"modal fade\" id=\"modal-login\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n");
      out.write("                <form action=\"UsuarioServlet\" method=\"POST\">\n");
      out.write("                    <div class=\"modal-dialog\">\n");
      out.write("                        <div class=\"modal-content\">\n");
      out.write("                            <div class=\"modal-header\">\n");
      out.write("                                <h5 class=\"modal-title\" id=\"exampleModalLabel\" style=\"color:black; \">Login</h5>\n");
      out.write("                                <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("                                    <span aria-hidden=\"true\">&times;</span>\n");
      out.write("                                </button>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"modal-body\">\n");
      out.write("\n");
      out.write("                                <input type=\"hidden\" name=\"acao\" value=\"login\">\n");
      out.write("                                <div class=\"container\">\n");
      out.write("\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col\">\n");
      out.write("                                            <input   class=\"form-control\" type=\"text\" id=\"txtusername\" name=\"username\" placeholder=\"CPF ou Email\">\n");
      out.write("                                        </div>\n");
      out.write("                                    </div >\n");
      out.write("\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col\">\n");
      out.write("                                            <input  class=\"form-control\" type=\"password\" id=\"txtpassword\" name=\"senha\" placeholder=\"Password\">\n");
      out.write("                                        </div>\n");
      out.write("                                    </div >\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col\">\n");
      out.write("                                            <input type=\"checkbox\" name=\"remember\" id=\"chkremember\"/>\n");
      out.write("                                            <label style=\" color: black; font-size: 12px;\"for=\"chkremember\">Lembrar-se</label>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"col\">\n");
      out.write("                                            <label class=\"text-muted\">Esqueceu a senha?</label>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div >\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"d-flex col justify-content-center \">\n");
      out.write("                                            <label id=\"novoCliente\" href=\"cadastro.jsp\" style=\" padding: 0;font-size: 12px; color: black; font-family:'Arial'; \">Ainda não nosso cliente?</label>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div >\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"d-flex col justify-content-center \">\n");
      out.write("                                            <button type=\"button\" class=\"btn btn-secondary justify-content-center\" data-toggle=\"modal\" data-target=\"#modal-registro\" data-dismiss=\"modal\">\n");
      out.write("                                                Registrar\n");
      out.write("                                            </button>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div >\n");
      out.write("\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"modal-footer\">\n");
      out.write("                                <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Sair</button>\n");
      out.write("                                <button type=\"submit\" class=\"btn btn-primary btn-dark\">Login</button>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </form> \n");
      out.write("            </div>\n");
      out.write("            <!----------------------------------------------------MODAL DO REGISTRO---------------------------------------------------------------------------------------------------------------------------------------------------------------->\n");
      out.write("            <div class=\"modal fade\" id=\"modal-registro\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n");
      out.write("                <div class=\"modal-dialog\" role=\"document\">\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <div class=\"d-flex col-lg justify-content-center\">\n");
      out.write("                                <blockquote class=\"blockquote text-center\">\n");
      out.write("                                    <h3>Olá!</h3>\n");
      out.write("                                    <label>Vamos fazer o seu cadastro!</label>           \n");
      out.write("                                </blockquote>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"d-flex col-md-1 justify-content-center\">\n");
      out.write("                                <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Fechar\">\n");
      out.write("                                    <span aria-hidden=\"true\">&times;</span>\n");
      out.write("                                </button>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("                            <form action=\"UsuarioServlet\" method=\"POST\">\n");
      out.write("                                <input type=\"hidden\" name=\"acao\" value=\"cadastrar\" >\n");
      out.write("                                <div class=\"container\">    \n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col\">\n");
      out.write("                                            <label for=\"txtnome\">Nome Completo: </label>\n");
      out.write("                                            </br>\n");
      out.write("                                            <input required class=\"form-control R\" size=\"35\" type =\"text\" id=\"txtnome\" name=\"nome\" />\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"row\">                    \n");
      out.write("                                        <div class=\"col\">\n");
      out.write("                                            <label for=\"txtCPF\">CPF: </label>\n");
      out.write("                                            </br>\n");
      out.write("                                            <input required class=\"form-control R\" size=\"20\" type =\"text\" id=\"txtCPF\" name=\"CPF\"  />\n");
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col\">            \n");
      out.write("                                            <label for=\"txtDataNascimento\">Data de Nascimento: </label>\n");
      out.write("                                            </br>\n");
      out.write("                                            <input required class=\"form-control R\" size=\"20\" type =\"date\" id=\"txtDataNascimento\" name=\"dataNascimento\" />                      \n");
      out.write("                                        </div>                \n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col\">\n");
      out.write("                                            <label for=\"sltEscolaridade\">Sexo: </label>\n");
      out.write("                                            </br>\n");
      out.write("                                            <select required class=\"form-control R\" id=\"sltSexo\" name=\"sexo\">\n");
      out.write("                                                <option value= \"X\" ></option>\n");
      out.write("                                                <option value=\"M\" >Masculino</option>\n");
      out.write("                                                <option value=\"F\">Feminino</option>\n");
      out.write("                                                <option value=\"O\">Outro</option>\n");
      out.write("                                            </select>\n");
      out.write("                                        </div>                   \n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col\">\n");
      out.write("                                            <label for=\"txtemail\">E-mail: </label>\n");
      out.write("                                            </br>\n");
      out.write("                                            <input required  class=\"form-control R\" type =\"email\" id=\"txtemail\" name=\"email\" placeholder=\"exemplo@123.com\" />\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col\">\n");
      out.write("                                            <label for=\"txtTelefone\">Telefone:  </label>\n");
      out.write("                                            </br>\n");
      out.write("                                            <input required class=\"form-control R\" type=\"text\" id=\"txtTelefone\" name=\"dddTelefone\"  />\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>    \n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col\">\n");
      out.write("                                            <label for=\"txtSenha\">Senha: </label></br>\n");
      out.write("\n");
      out.write("                                            <input required class=\"form-control R\" type =\"password\" id=\"txtSenha\" name=\"senha\" />\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col\">\n");
      out.write("                                            <label for=\"txtconfirmasenha\">Confirma senha: </label>\n");
      out.write("                                            </br>\n");
      out.write("                                            <input required class=\"form-control R\"  type =\"password\" id=\"txconfrimasenhat\" name=\"confirmasenha\" />\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    </br>\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"d-flex col justify-content-center\">\n");
      out.write("\n");
      out.write("                                            <input type=\"hidden\" name=\"id\" >\n");
      out.write("                                            <button class=\"btn btn-dark \" type=\"submit\">Registrar</button>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                        </div>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <!--------------------------------------------------- FIM MODAL DO REGISTRO---------------------------------------------------------------------------------------------------------------------------------------------------------------->\n");
      out.write("            <!--------------------------------------------------- INICIO DO SOBRE---------------------------------------------------------------------------------------------------------------------------------------------------------------->\n");
      out.write("            <h1>Sobre</h1>\n");
      out.write("            \n");
      out.write("            <img src=\"img/ftsobre.jpg\"/>\n");
      out.write("                \n");
      out.write("            \n");
      out.write("            <!--------------------------------------------------- FIM SOBRE---------------------------------------------------------------------------------------------------------------------------------------------------------------->\n");
      out.write("            <footer id=\"myFooter\">\n");
      out.write("                <div class=\"container-fluid\">\n");
      out.write("                    <div class=\"row\">                                \n");
      out.write("\n");
      out.write("                        <div class=\"col-sm-6\">\n");
      out.write("                            <h5>Contatos</h5>\n");
      out.write("                            <ul>\n");
      out.write("                                <li><a href=\"https://www.instagram.com/dornelles__salon/\">Instagram</a></li>\n");
      out.write("                                <li><a href=\"https://www.facebook.com/alievertonsouza\">Facebook</a></li>\n");
      out.write("                                <li><a>Telefones</a></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div> \n");
      out.write("                        <div class=\"col-sm-6\">\n");
      out.write("                            <h5>Localização</h5>\n");
      out.write("\n");
      out.write("                            <iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3744.552094930679!2d-40.2366429703511!3d-20.194366508466654!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xb81f220927caaf%3A0xc526b40c635f6dbd!2sDornelles%20Salon!5e0!3m2!1spt-BR!2sbr!4v1654266203171!5m2!1spt-BR!2sbr\" \n");
      out.write("                                    width=\"400\" height=\"130\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>        \n");
      out.write("            </footer>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\" src=\"js/jquery.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"js/bootstrap.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"js/jquery.mask.js\"></script>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("\n");
      out.write("            jQuery(document).ready(function ($) {\n");
      out.write("\n");
      out.write("                $(\"#txtCPF\").mask(\"000.000.000-00\");\n");
      out.write("                $(\"#txtTelefone\").mask(\"(00) 00000-0000\");\n");
      out.write("\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
