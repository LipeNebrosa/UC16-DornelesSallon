package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.Usuario;

public final class homecliente_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
 String nomecli = "Usuario";
Usuario u = new Usuario();

if(request.getAttribute("idlogado") != null){
    String id = (String)request.getAttribute("idlogado");
    boolean achou = u.BuscarPorId(id);
    if (achou) {
       nomecli = u.getNome();
        
    }
    
}



      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Dornelles Salon</title>\r\n");
      out.write("\r\n");
      out.write("        <!-- Required meta tags -->\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\r\n");
      out.write("\r\n");
      out.write("        <!-- Bootstrap CSS -->\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.css\">\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <style>\r\n");
      out.write("        btn btn-primary{\r\n");
      out.write("\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .navbar {\r\n");
      out.write("            z-index: 10;\r\n");
      out.write("            height: 100px;\r\n");
      out.write("            border-radius:25px;\r\n");
      out.write("\r\n");
      out.write("        }\r\n");
      out.write("        body{\r\n");
      out.write("            font-family: \"Arial\";\r\n");
      out.write("            background-image: url(\"img/barbearia.jpg\");\r\n");
      out.write("            background-position: 0% 20%;\r\n");
      out.write("            background-size: 100%;\r\n");
      out.write("            background-repeat: no-repeat;\r\n");
      out.write("            color:white;\r\n");
      out.write("            margin-top: 50px;\r\n");
      out.write("            margin-left: 50px;\r\n");
      out.write("            margin-right: 50px;\r\n");
      out.write("\r\n");
      out.write("        }\r\n");
      out.write("        .logoleao{\r\n");
      out.write("            position:absolute;\r\n");
      out.write("            z-index: 11;\r\n");
      out.write("            float:left;\r\n");
      out.write("            left:50px;\r\n");
      out.write("            margin-top: -2%;\r\n");
      out.write("\r\n");
      out.write("        }\r\n");
      out.write("        .navbar-collapse{\r\n");
      out.write("            margin-left: 320px;\r\n");
      out.write("            font-size: 150%;\r\n");
      out.write("            font-weight: lighter;\r\n");
      out.write("        }\r\n");
      out.write("        .nav-link{\r\n");
      out.write("            margin-right: 20px;\r\n");
      out.write("        }\r\n");
      out.write("        .txtL{\r\n");
      out.write("            font-size: 170%;\r\n");
      out.write("\r\n");
      out.write("        }\r\n");
      out.write("        .txtB{\r\n");
      out.write("            width: 80%;\r\n");
      out.write("            height: 85%;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        }\r\n");
      out.write("        .bt{\r\n");
      out.write("            width: 40%;\r\n");
      out.write("            height:40px;           \r\n");
      out.write("            background-image: linear-gradient(#696969, black);\r\n");
      out.write("            color:white;\r\n");
      out.write("            border-style:groove;\r\n");
      out.write("            border-color: #2781cf;\r\n");
      out.write("            border:1px;\r\n");
      out.write("            border-radius:3px;\r\n");
      out.write("\r\n");
      out.write("            border-top-left-radius:  6%;\r\n");
      out.write("            border-top-right-radius: 6% ;\r\n");
      out.write("            border-bottom-left-radius: 6%;\r\n");
      out.write("            border-bottom-right-radius: 6%;\r\n");
      out.write("        }\r\n");
      out.write("        .btR{\r\n");
      out.write("            width: 50%;\r\n");
      out.write("            height:40px;           \r\n");
      out.write("            background-image: linear-gradient(#696969, black);\r\n");
      out.write("            color:white;\r\n");
      out.write("            border-style:groove;\r\n");
      out.write("            border-color: #2781cf;\r\n");
      out.write("            border:1px;\r\n");
      out.write("            border-radius:3px;\r\n");
      out.write("\r\n");
      out.write("            border-top-left-radius:  6%;\r\n");
      out.write("            border-top-right-radius: 6% ;\r\n");
      out.write("            border-bottom-left-radius: 6%;\r\n");
      out.write("            border-bottom-right-radius: 6%;\r\n");
      out.write("        }\r\n");
      out.write("        .txtFP{\r\n");
      out.write("            font-size: 12px;\r\n");
      out.write("            text-align: right;\r\n");
      out.write("            color:#337AB7 ;\r\n");
      out.write("\r\n");
      out.write("            border-top-left-radius:  8px;\r\n");
      out.write("            border-top-right-radius:  8px;\r\n");
      out.write("            border-bottom-left-radius: 8px;\r\n");
      out.write("            border-bottom-right-radius: 8px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .modal-body{\r\n");
      out.write("            margin-left: auto;\r\n");
      out.write("            margin-right: auto;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("\r\n");
      out.write("        <div>\r\n");
      out.write("            <a class=\"logoleao\" href=\"home.jsp\">\r\n");
      out.write("                <img src=\"img/Logoo.png\" width=\"47%\" height=\"47%\" alt=\"\">\r\n");
      out.write("            </a>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\">\r\n");
      out.write("\r\n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbarNavAltMarkup\">\r\n");
      out.write("                <ul class=\"navbar-nav\">\r\n");
      out.write("                    <li class=\"nav-item active\">\r\n");
      out.write("                        <a class=\"nav-link\" href=\"#\">Home <span class=\"sr-only\">(current)</span></a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"nav-item\">\r\n");
      out.write("                        <a class=\"nav-link\" href=\"#\">Sobre</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    \r\n");
      out.write("                    <li class=\"nav-item\">\r\n");
      out.write("                        <a class=\"nav-link\">Serviços</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                   \r\n");
      out.write("                </ul>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("              <ul >\r\n");
      out.write("\r\n");
      out.write("                <li class=\"nav-item dropdown\">\r\n");
      out.write("                    \r\n");
      out.write("                <img style=\"margin-left:105%;padding-top: 5% \"src=\"img/iconeUser.png\" width=\"8%\" height=\"8%\" alt=\"\">\r\n");
      out.write("                    \r\n");
      out.write("                </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div>\r\n");
      out.write("                \r\n");
      out.write("                <ul style=\"list-style: none;\">\r\n");
      out.write("\r\n");
      out.write("                <li class=\"nav-item dropdown\">\r\n");
      out.write("                   \r\n");
      out.write("                    <a style=\"margin-left:65%; color: white; font-size: 110%; margin-left: 1%; padding-top: 20%\" class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-expanded=\"false\">\r\n");
      out.write("                       Felipe\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\r\n");
      out.write("                        <a class=\"dropdown-item\" href=\"#\">Configurações</a>\r\n");
      out.write("                        <a class=\"dropdown-item\" href=\"#\">Histórico</a>\r\n");
      out.write("                        <div class=\"dropdown-divider\"></div>\r\n");
      out.write("                        <a class=\"dropdown-item\" href=\"#\">Cancelamento</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            <div>\r\n");
      out.write("                <button type=\"button\" class=\"btn btn-light float-right btn-lg\" style=\"margin-right: 15%\" >\r\n");
      out.write("                    Agendar\r\n");
      out.write("                </button>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </nav>\r\n");
      out.write("\r\n");
      out.write("<!--        <div class=\"modal fade\" id=\"exampleModal\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\r\n");
      out.write("            <form action=\"UsuarioServlet\" method=\"POST\">\r\n");
      out.write("                <div class=\"modal-dialog\">\r\n");
      out.write("                    <div class=\"modal-content\">\r\n");
      out.write("                        <div class=\"modal-header\">\r\n");
      out.write("                            <h5 class=\"modal-title\" id=\"exampleModalLabel\" style=\"color:black; \">Login</h5>\r\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\r\n");
      out.write("                                <span aria-hidden=\"true\">&times;</span>\r\n");
      out.write("                            </button>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"modal-body\">\r\n");
      out.write("\r\n");
      out.write("                            <input type=\"hidden\" name=\"acao\" value=\"login\">\r\n");
      out.write("                            <table class=\"form\">\r\n");
      out.write("\r\n");
      out.write("                                <tr>\r\n");
      out.write("                                    <td colspan=\"2\">\r\n");
      out.write("                                        <input   class=\"txtB\" type=\"text\" id=\"txtusername\" name=\"username\" placeholder=\"CPF ou Email\">\r\n");
      out.write("                                    </td>\r\n");
      out.write("                                </tr>\r\n");
      out.write("\r\n");
      out.write("                                <tr>\r\n");
      out.write("                                    <td colspan=\"2\" >\r\n");
      out.write("                                        <input  class=\"txtB\" type=\"password\" id=\"txtpassword\" name=\"senha\" placeholder=\"Password\">\r\n");
      out.write("                                    </td>\r\n");
      out.write("                                </tr>                                            \r\n");
      out.write("                                <tr>\r\n");
      out.write("                                    <td colspan=\"2\">\r\n");
      out.write("                                        <label id=\"novoCliente\" href=\"cadastro.jsp\" style=\" padding: 0;font-size: 12px; color: black; font-family:'Arial'; \">Ainda não nosso cliente?</label></br>\r\n");
      out.write("                                        <a style=\"color:black;\"href=\"cadastro.jsp\"value=\"Registrar\">Registrar</a>\r\n");
      out.write("                                    </td>\r\n");
      out.write("                                </tr>\r\n");
      out.write("                                <tr>\r\n");
      out.write("                                    <td>\r\n");
      out.write("                                        <input type=\"checkbox\" name=\"remember\" id=\"chkremember\"/>\r\n");
      out.write("                                        <label style=\" color: black; font-size: 12px;\"for=\"chkremember\">Lembrar-se</label>\r\n");
      out.write("                                    </td>\r\n");
      out.write("                                    <td>\r\n");
      out.write("                                        <label class=\"txtFP\">Esqueceu a senha?</label>\r\n");
      out.write("                                    </td>\r\n");
      out.write("                                </tr>\r\n");
      out.write("                            </table>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"modal-footer\">\r\n");
      out.write("                            <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Sair</button>\r\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-primary btn-dark\">Login</button>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("            </form> \r\n");
      out.write("        </div>\r\n");
      out.write("    </div>-->\r\n");
      out.write("    <script type=\"text/javascript\" src=\"js/jquery.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"js/bootstrap.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"js/jquery.mask.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
