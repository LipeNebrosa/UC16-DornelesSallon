package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import util.BancoDados;

public class Horario {

    private int id;
    private String data;
    private String horario;
    private int idFuncionario;
    private int idServico;
    private int idCliente;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
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
            String sql = "INSERT INTO agenda ( data, horario, idcliente) VALUES (?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, this.getData());
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
            String sql = "SELECT * FROM agenda; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            List<Horario> lista = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Horario h = new Horario();
                h.setId(rs.getInt("id"));
                h.setData(rs.getString("data"));
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
            String sql = "SELECT * FROM agenda WHERE idcliente = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            List<Horario> lista = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Horario h = new Horario();
                h.setId(rs.getInt("id"));
                h.setData(rs.getString("data"));
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
