package modelo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.BancoDados;

/**
 *
 * @author sala305b
 */
public class Funcionario {

    private String matricula;
    private String nome, apelido;
    private String cargo, cpf;
    private long idUsuario, id;
    private Date dtcadastro;
    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public long getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(long idUsuario) {
        this.idUsuario = idUsuario;
    }

    public static boolean TornarADM(String apelido, String cargo, String cpf, String idUsuario, String eh_adm) {

        try {
            Connection conn = BancoDados.getConexao();
            String sql = "INSERT INTO funcionario ( nome, cargo, idUsuario) VALUES (?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, apelido);
            ps.setString(2, cargo);
            ps.setString(3, idUsuario);
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                if (Usuario.TornarADM(cpf, "S")) {
                    System.out.println("Adm registrado com sucesso!");
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Erro registro de adm: " + e.getMessage());
            return false;
        }

    }
    
    public List<Funcionario> ListarFuncionarios() {
        try {

            Connection conn = BancoDados.getConexao();
            String sql = "SELECT u.nome as nomeusuario, u.cpf , f.* FROM bdbarbearia.funcionario f JOIN bdbarbearia.usuario u ON f.idUsuario = u.id;";
            PreparedStatement ps = conn.prepareStatement(sql);
            List<Funcionario> lista = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Funcionario h = new Funcionario();
                h.setMatricula(rs.getString("matricula"));
                h.setNome(rs.getString("nomeusuario"));
                h.setApelido(rs.getString("nome"));
                h.setCargo(rs.getString("cargo"));
                h.setCpf(rs.getString("cpf"));
                h.setDtcadastro(rs.getDate("dtcadastro"));
                h.setIdUsuario(rs.getLong("idUsuario"));
                
                lista.add(h);
            }
            return lista;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public String getApelido() {
        return apelido;
    }

    public void setApelido(String apelido) {
        this.apelido = apelido;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public Date getDtcadastro() {
        return dtcadastro;
    }

    public void setDtcadastro(Date dtcadastro) {
        this.dtcadastro = dtcadastro;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
