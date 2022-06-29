package modelo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import util.BancoDados;

public class Horario {

    private int id;
    private Date data;
    private String horario;
    private String nomeCliente;
    private String cpf;
    private int idFuncionario;
    private int idServico;
    private int idCliente;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNomeCliente() {
        return nomeCliente;
    }

    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public int getIdFuncionario() {
        return idFuncionario;
    }

    public void setIdFuncionario(int idFuncionario) {
        this.idFuncionario = idFuncionario;
    }

    public int getIdServico() {
        return idServico;
    }

    public void setIdServico(int idServico) {
        this.idServico = idServico;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    /////////////
    
    public long CadastrarHorario() {
        try {

            Connection conn = BancoDados.getConexao();
            String sql = "INSERT INTO agenda ( dtagenda, horario, idcliente) VALUES (?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            ps.setDate(1, this.getData());
            ps.setString(2, this.getHorario());
            ps.setInt(3, this.getIdCliente());

            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {

                final ResultSet rs = ps.getGeneratedKeys();

                if (rs.next()) {
                    final long lastId = rs.getLong(1);
                    System.out.println("O id do horario registrado é: " + lastId);
                    return lastId;
                } else {
                    return 0;
                }
            } else {
                return 0;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public boolean Excluir(long id) {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "DELETE FROM agenda WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, id);
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                System.out.println("HORARIO EXCLUIDO");
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
    }

    public List<Horario> ListarHorarios() {
        try {

            Connection conn = BancoDados.getConexao();
            String sql = "SELECT usuario.nome,cpf , agenda.* FROM agenda INNER JOIN usuario ON agenda.idcliente = usuario.id ORDER BY dtagenda,horario ASC;";
            PreparedStatement ps = conn.prepareStatement(sql);
            List<Horario> lista = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Horario h = new Horario();
                h.setId(rs.getInt("id"));
                h.setData(rs.getDate("dtagenda"));
                h.setNomeCliente(rs.getString("nome"));
                h.setCpf(rs.getString("cpf"));
                h.setHorario(rs.getString("horario"));
                h.setIdCliente(rs.getInt("idcliente"));
                lista.add(h);
            }
            return lista;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public List<Horario> ListarHorariosCliente(int id) {
        try {

            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM agenda WHERE idcliente = ? ORDER BY dtagenda,horario ASC; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            List<Horario> lista = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Horario h = new Horario();
                h.setId(rs.getInt("id"));
                h.setData(rs.getDate("data"));
                h.setHorario(rs.getString("horario"));
                h.setIdCliente(rs.getInt("idcliente"));
                lista.add(h);
            }
            return lista;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

}
