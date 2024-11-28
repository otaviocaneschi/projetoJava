/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelDAO;

import model.Aluno;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import util.ConectaDB;

/**
 *
 * @author alunocmc
 */
public class AlunoDAO {

    //cadastro
    public boolean cadastrarAluno(Aluno aluno) throws ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); 
            Statement stmt = conexao.createStatement();

            String sql = "INSERT INTO aluno (cpf, nome, idade, curso, periodo, email, sala) VALUES ('" 
                            + aluno.getCpf() + "', '"
                            + aluno.getNome() + "', "
                            + aluno.getIdade() + ", '"
                            + aluno.getCurso() + "', '"
                            + aluno.getPeriodo() + "', '"
                            + aluno.getEmail() + "', '"
                            + aluno.getSala() + "')";

            stmt.executeUpdate(sql);
            conexao.close();

            return true;

        } catch (SQLException ex) {
            System.out.println("Erro ao cadastrar aluno: " + ex.toString());
            return false;
        }
    }
    
    
    //alterar
    public boolean alterarAluno(Aluno aluno) throws ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();

            String sql = "UPDATE aluno SET cpf='" + aluno.getCpf() + "', " +
                         "nome='" + aluno.getNome() + "', " +
                         "idade=" + aluno.getIdade() + ", " +
                         "curso='" + aluno.getCurso() + "', " +
                         "periodo='" + aluno.getPeriodo() + "', " +
                         "email='" + aluno.getEmail() + "', " +
                         "sala='" + aluno.getSala() + "' " +
                         "WHERE rgm = " + aluno.getRgm();

            stmt.executeUpdate(sql);
            conexao.close();
            
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar aluno: " + ex.toString());
            return false;
        }
    }
    
    //deletar
    public boolean deletarAluno(Aluno aluno) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); 
            Statement stmt = conexao.createStatement();                                   
                        
            String sql = "DELETE from aluno where rgm = " + aluno.getRgm();
            
            stmt.executeUpdate(sql);            
            conexao.close();            
            
            return true;
            
        }catch(SQLException ex){
            System.out.println("Erro ao deletar aluno:" + ex);
            return false;
        }
    } 
    
    
    //listar
    public List<Aluno> listarAluno() throws ClassNotFoundException {
        List<Aluno> lista = new ArrayList<>(); 
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar(); 
            Statement stmt = conexao.createStatement();                                   

            String sql = "SELECT * FROM aluno";
            ResultSet rs = stmt.executeQuery(sql); 

            int n_reg = 0;
            while (rs.next()) {  
                Aluno aluno = new Aluno();
                aluno.setRgm(rs.getInt("rgm"));  
                aluno.setCpf(rs.getString("cpf"));  
                aluno.setNome(rs.getString("nome"));  
                aluno.setIdade(rs.getInt("idade"));                
                aluno.setCurso(rs.getString("curso"));                
                aluno.setPeriodo(rs.getString("periodo"));
                aluno.setEmail(rs.getString("email"));                
                aluno.setSala(rs.getString("sala")); 

                lista.add(aluno);
                n_reg++;
            }

            conexao.close();

            if (n_reg == 0) {
                return null;
            } else {
                return lista;
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao consultar alunos: " + ex);
            return null;
        }
    }
    
    
    //consulta individual
    public Aluno consAlunoPorRgm(Aluno aluno) throws ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();                                   

            String sql = "SELECT * from aluno where rgm = '" + aluno.getRgm() + "'";
            ResultSet rs = stmt.executeQuery(sql); 

            int n_reg = 0;
            if (rs.next()) {                 
                aluno.setRgm(Integer.parseInt(rs.getString("rgm")));  
                aluno.setCpf(rs.getString("cpf"));  
                aluno.setNome(rs.getString("nome"));  
                aluno.setIdade(Integer.parseInt(rs.getString("idade")));  
                aluno.setCurso(rs.getString("curso"));  
                aluno.setPeriodo(rs.getString("periodo"));  
                aluno.setEmail(rs.getString("email"));  
                aluno.setSala(rs.getString("sala"));  
                n_reg++;
            }
            
            conexao.close();

            if (n_reg == 0) {
                return null;
            } else {
                return aluno;
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex);
            return null;
        }
    }
    
    
}
