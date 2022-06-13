/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;

/**
 *
 * @author sala305b
 */
@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao") != null ? request.getParameter("acao") : "";

        switch (acao) {
            case "editar":
                editarUsuario(request, response);
                break;
            case "apagar":
                deletarUsuario(request, response);
                break;
            case "cadastrar":
                cadastrarUsuario(request, response);
                break;
            case "login":
                logarUsuario(request, response);
                break;
            default:
                response.sendRedirect("home.jsp");

        }
    }

    private void logarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String login = request.getParameter("username");
        String senha = request.getParameter("senha");
        String redirecionamento = "home.jsp";

        Usuario user = new Usuario();
        user.setEmail(login);
        user.setCpf(login.replace(".","").replace("-", "").replace(" ",""));
        user.setSenha(senha);
        boolean logou = user.Login();

        if (user.getEh_adm() != null) {
            if (user.getEh_adm().equals("S")) {
                redirecionamento = "adm.jsp";
            }
        }

        if (logou) {
            //retirando senha do dados do usuario pra evitar facil acesso/visualização.
            user.setSenha(" ");
            
            HttpSession session = request.getSession();
            session.setAttribute("usuario", user);
            
            session.setAttribute("statusLogin", true);
            //substituir variavel de redirecionamento quando tela de falha estiverem prontas.
            response.sendRedirect(redirecionamento);
            
        } else {
            //falta implementar tela na home.jsp indicando falha no login. Fazer com if/else lendo este atributo.
            request.setAttribute("erroLogin", true);
            response.sendRedirect("home.jsp");
        }
    }

    private void cadastrarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String nome = request.getParameter("nome").trim();
        String cpf = request.getParameter("CPF").replace(".","").replace("-", "").replace(" ","");
        Date dataNascimento = Date.valueOf(request.getParameter("dataNascimento"));
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String dddtelefone = request.getParameter("dddTelefone");
        String sexo = request.getParameter("sexo");
        
        

        Usuario user = new Usuario();
        user.setNome(nome);
        user.setCpf(cpf);
        user.setDataNascimento(dataNascimento);
        user.setEmail(email);
        user.setSenha(senha);
        user.setTelefone(dddtelefone);
        user.setSexo(sexo);
        long novoId = user.Cadastrar();
        if (novoId > 0) {

            request.setAttribute("idcliente", novoId);
            request.getRequestDispatcher("listar.jsp").forward(request, response);

            response.sendRedirect("homecliente.jsp");

        } else {
            String mensagem
                    = "<h1>CADASTRO NÃO CONCLUIDO</h1>";
            response.getWriter().print(mensagem);

        }
    }

    private void editarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("CPF");
        Date dataNascimento = Date.valueOf(request.getParameter("dataNascimento"));
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String dddtelefone = request.getParameter("dddTelefone");
        String sexo = request.getParameter("sexo");

        Usuario user = new Usuario();
        user.setId(Long.parseLong(id));
        user.setNome(nome);
        user.setCpf(cpf);
        user.setDataNascimento(dataNascimento);
        user.setEmail(email);
        user.setSenha(senha);

        user.setTelefone(dddtelefone);
        user.setSexo(sexo);
        boolean atualizou = user.Atualizar();
        if (atualizou) {

            response.sendRedirect("listar.jsp");

        } else {
            String mensagem
                    = "<h1>ATUALIZAÇÃO NÃO CONCLUIDA</h1>";
            response.getWriter().print(mensagem);

        }
    }

    private void deletarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        boolean apagou = Usuario.Excluir(Long.parseLong(request.getParameter("id")));
        if (apagou) {
            response.sendRedirect("listar.jsp");
        } else {
            String mensagem
                    = "<h1>EXCLUSÃO NÃO CONCLUIDA</h1>";
            response.getWriter().print(mensagem);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
