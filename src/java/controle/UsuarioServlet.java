/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import com.google.gson.Gson;
import com.sun.xml.rpc.processor.modeler.j2ee.xml.homeType;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Funcionario;
import modelo.Horario;
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
            case "editarViaAdm":
                editarUsuarioViaAdm(request, response);
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
            case "cadHorario":
                cadastrarHorario(request, response);
                break;
            case "apagarAgendamento":
                deletarAgendamento(request, response);
                break;
            case "cadFuncionario":
                cadastrarFuncionario(request, response);
                break;

            default:
                response.sendRedirect("home.jsp?msg=erro-parametro-servlet");

        }
    }

    private void logarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String login = request.getParameter("username");
        String senha = request.getParameter("senha");

        Usuario user = new Usuario();
        user.setEmail(login);
        user.setCpf(login.replace(".", "").replace("-", "").replace(" ", ""));
        user.setSenha(senha);
        boolean logou = user.Login();

        if (logou) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", user);

            session.setAttribute("statusLogin", true);
            response.sendRedirect("home.jsp");

        } else {

            response.sendRedirect("home.jsp?msg=erroLogin");
        }
    }

    private void cadastrarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String nome = request.getParameter("nome").trim();
        String cpf = request.getParameter("CPF").replace(".", "").replace("-", "").replace(" ", "");
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

        boolean jaTemCadastro = user.BuscarPorCPF(cpf);

        if (jaTemCadastro) {
            response.sendRedirect("home.jsp?msg=CPF-JA-CADASTRADO");
        } else {
            long novoId = user.Cadastrar();
            if (novoId > 0) {
                boolean logou = user.Login();

                if (logou) {
                    HttpSession session = request.getSession();
                    session.setAttribute("usuario", user);
                    session.setAttribute("statusLogin", true);
                    response.sendRedirect("home.jsp?msg=CADASTRADO");

                } else {

                    response.sendRedirect("home.jsp?msg=cadastrado-erro-Login");
                }

            } else {
                response.sendRedirect("home.jsp?msg=ERRO-CADASTRO");

            }
        }

    }

    private void editarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String senha = request.getParameter("senha");
        String novaSenha = request.getParameter("novasenha");
        String cpf = request.getParameter("attCPF").replace(".", "").replace("-", "").replace(" ", "");
        Usuario user = new Usuario();
        Usuario loginUser = new Usuario();

        loginUser.setCpf(cpf);
        loginUser.setSenha(senha);

        boolean loginVerificador = loginUser.Login();

        if (loginVerificador) {
            user.setId(Long.parseLong(request.getParameter("id")));
            user.setNome(request.getParameter("nome"));
            user.setCpf(cpf);
            user.setDataNascimento(Date.valueOf(request.getParameter("attNascimento")));
            user.setTelefone(request.getParameter("dddTelefone"));
            user.setEmail(request.getParameter("email"));
            user.setSexo(request.getParameter("sexo"));

            if (novaSenha == null || novaSenha.equals("")) {
                user.setSenha(senha);
            } else {
                user.setSenha(novaSenha);
            }

            boolean atualizou = user.Atualizar();

            if (atualizou) {

                response.sendRedirect("home.jsp?msg=ATUALIZOU");

            } else {
                response.sendRedirect("home.jsp?msg=ERRO-ATUALIZACAO");

            }
        } else {
            response.sendRedirect("home.jsp?msg=ERRO_LOGIN_DA_ATUALIZACAO");
        }
    }

    private void editarUsuarioViaAdm(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String novaSenha = request.getParameter("novasenha");
        String cpf = request.getParameter("CPF").replace(".", "").replace("-", "").replace(" ", "");
        Usuario user = new Usuario();
        Usuario loginUser = new Usuario();

        loginUser.setCpf(cpf);

        user.setId(Long.parseLong(request.getParameter("id")));
        user.setNome(request.getParameter("nome"));
        user.setCpf(cpf);
        user.setDataNascimento(Date.valueOf(request.getParameter("dataNascimento")));
        user.setTelefone(request.getParameter("dddTelefone"));
        user.setEmail(request.getParameter("email"));
        user.setSexo(request.getParameter("sexo"));

        if (novaSenha != null) {
            user.setSenha(novaSenha);
        }

        boolean atualizou = user.Atualizar();

        if (atualizou) {

            response.sendRedirect("adm-listar.jsp?msg=ATUALIZOU");

        } else {
            response.sendRedirect("adm-listar.jsp?msg=ERRO-ATUALIZACAO");

        }

    }

    private void deletarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        boolean apagou = Usuario.Excluir(Long.parseLong(request.getParameter("id")));
        if (apagou) {
            response.sendRedirect("adm-listar.jsp?msg=CLIENTE-DELETADO");
        } else {
            response.sendRedirect("adm-listar.jsp?msg=ERRO_EXCLUSAO_ADM");
        }

    }

    private void deletarAgendamento(HttpServletRequest request, HttpServletResponse response) throws IOException {
        boolean apagou = Horario.Excluir(Long.parseLong(request.getParameter("id")));
        if (apagou) {
            response.sendRedirect("adm.jsp?msg=agd-deletado");
        } else {
            response.sendRedirect("adm.jsp?msg=ERRO_EXCLUSAO_AGENDAMENTO");
        }

    }

    private void cadastrarHorario(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Horario hora = new Horario();

        hora.setData(Date.valueOf(request.getParameter("dataAgendamento")));
        hora.setHorario(request.getParameter("hora"));
        hora.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));

        long cadastrou = hora.CadastrarHorario();
        HashMap<String, String> dicionario = new HashMap<>();

        if (cadastrou > 0) {
            dicionario.put("msg", "Agendado com sucesso!");
            dicionario.put("erro", "false");
            dicionario.put("icone", "success");
        } else {
            dicionario.put("msg", "Erro no cadastro do horario :( ");
            dicionario.put("erro", "true");
            dicionario.put("icone", "error");
        }
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        response.addHeader("Access-Control-Allow-Origin", "*");
        PrintWriter out = response.getWriter();
        String json = new Gson().toJson(dicionario);
        // finally output the json string       
        out.print(json);
    }

    private void cadastrarFuncionario(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Funcionario funcionario = new Funcionario();
        Usuario user = new Usuario();

        String cpf = request.getParameter("CPF").replace(".", "").replace("-", "").replace(" ", ""),
                apelido = request.getParameter("nome"),
                cargo = request.getParameter("cargo");

        if (request.getParameter("CPF") != null) {
            boolean achouCpf = user.BuscarPorCPF(cpf);
            if (achouCpf) {
                String idUsuario = String.valueOf(user.getId());
                if (Funcionario.TornarADM(apelido, cargo, cpf, idUsuario, "S")) {
                    response.sendRedirect("adm-cadF.jsp?msg=FUNCIO-CAD");
                }else{
                     response.sendRedirect("adm-cadF.jsp?msg=ERRO-CAD-FUNCIO");
                }
            } else {
                response.sendRedirect("adm-cadF.jsp?msg=CPF-NAO-CADASTRADO");
            }

        } else {
            response.sendRedirect("adm-cadF.jsp?msg=CPF-NULL-FUNC");
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
