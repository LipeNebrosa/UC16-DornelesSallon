package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.BancoDados;

/**
 *
 * @author sala305b
 */
public class Funcionario {

    private String matricula;
    private String nome;
    private String cargo;
    private long idUsuario;

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
}
