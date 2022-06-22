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


public class Usuario {
    
    private long id;
    private String nome;
    private String cpf;
    private Date dataNascimento, dataCadastro;
    private String email;
    private String senha;
    private String ddd;
    private String telefone;
    private String sexo;
    private String eh_adm;    

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getDdd() {
        return ddd;
    }

    public void setDdd(String ddd) {
        this.ddd = ddd;
    }    

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }
 

    public Date getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public String getEh_adm() {
        return eh_adm;
    }

    public void setEh_adm(String eh_adm) {
        this.eh_adm = eh_adm;
    }
    
    
    public boolean Login() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "SELECT id, nome, cpf, dataNascimento, email, telefone, eh_adm FROM usuario WHERE (cpf = ? OR email = ?) AND senha = ? ; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.getCpf());
            ps.setString(2, this.getEmail());
            ps.setString(3, this.getSenha());
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                this.setId(rs.getLong("id"));
                this.setNome(rs.getString("nome"));
                this.setCpf(rs.getString("cpf"));
                this.setDataNascimento(rs.getDate("dataNascimento"));
                this.setEmail(rs.getString("email"));
                this.setTelefone(rs.getString("telefone"));
                this.setEh_adm(rs.getString("eh_adm"));
                return true;

            } else {
                return false;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public long Cadastrar() {
        try {

            Connection conn = BancoDados.getConexao();
            String sql = "INSERT INTO usuario (nome, cpf, dataNascimento, email, senha, telefone, sexo) "
                    + "VALUES (?,?,?,?,?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, this.getNome());
            ps.setString(2, this.getCpf());
            ps.setDate(3, this.getDataNascimento());
            ps.setString(4, this.getEmail());
            ps.setString(5, this.getSenha());
            ps.setString(6, this.getTelefone());
            ps.setString(7, this.getSexo());
      
        int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                final ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    final long lastId = rs.getLong(1);
                    System.out.println("O id do registrado é:"
                            + lastId);
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
    
    public boolean Atualizar() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "UPDATE usuario SET nome = ?, cpf = ?, dataNascimento = ?, email =?, senha = ?, telefone = ?, sexo = ? "
                    + " WHERE id = ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.getNome());
            ps.setString(2, this.getCpf());
            ps.setDate(3, this.getDataNascimento());
            ps.setString(4, this.getEmail());
            ps.setString(5, this.getSenha());
            ps.setString(6, this.getTelefone());
            ps.setString(7, this.getSexo());
            ps.setLong(8, this.getId());
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                System.out.println("atualizou!");
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
    }
    
    public static boolean Excluir(long id) {
        try {
                Connection conn = BancoDados.getConexao(); //conectar com o bando de dados e enviar os dados salvos da classe Usuario.
            String sql = "DELETE FROM usuario WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, id);
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                System.out.println("EXCLUIDO");
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
}
    
public List<Usuario> ListarTodos() {
        try {

            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM usuario; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            List<Usuario> lista = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));               
                u.setNome(rs.getString("nome"));
                u.setCpf(rs.getString("cpf"));
                u.setSexo(rs.getString("sexo"));
                u.setTelefone(rs.getString("telefone"));              
               u.setDataNascimento(rs.getDate("dataNascimento"));
                u.setEmail(rs.getString("email"));
                u.setDataCadastro(rs.getDate("dtcadastro"));
                lista.add(u);
            }
            return lista;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

 public boolean BuscarPorId(String id) {

        try {

            long iduser = Long.parseLong(id);

            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM usuario WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, iduser);
            final ResultSet rs = ps.executeQuery();

            if (rs.next()) {

            this.setId(rs.getLong("id"));
            this.setNome((rs.getString("nome")));
            this.setCpf((rs.getString("cpf")));
            this.setDataNascimento(rs.getDate("dataNascimento"));
            this.setTelefone(rs.getString("telefone"));
            this.setSexo((rs.getString("sexo")));
            this.setEmail(rs.getString("email"));
            this.setDataCadastro(rs.getDate("dtcadastro"));
            this.setEh_adm(rs.getString("eh_adm"));
 
             return true;

            } else {
                return false;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
}