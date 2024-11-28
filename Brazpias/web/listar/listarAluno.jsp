<%-- 
    Document   : listarAluno
    Created on : 15 de nov. de 2024, 23:12:21
    Author     : Marcos Shigetomi/Lucas Kevin
--%>

<%@page import="java.util.List"%>
<%@page import="modelDAO.AlunoDAO"%>
<%@page import="model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lista de Alunos</title>
    <link rel="stylesheet" type="text/css" href="css.css">
</head>
<body>
    <h1>Alunos Cadastrados</h1>
    <%
        AlunoDAO alunoDAO = new AlunoDAO();
        List<Aluno> listaAlunos = alunoDAO.listarAluno();

        if (listaAlunos != null) {
            out.println("<table border='1'>");
            out.println("<tr><th>RGM</th><th>CPF</th><th>Nome</th><th>Idade</th><th>Curso</th><th>Período</th><th>E-mail</th><th>Sala</th></tr>");
            for (Aluno aluno : listaAlunos) {
                out.println("<tr>");
                out.println("<td>" + aluno.getRgm() + "</td>");
                out.println("<td>" + aluno.getCpf() + "</td>");
                out.println("<td>" + aluno.getNome() + "</td>");
                out.println("<td>" + aluno.getIdade() + "</td>");
                out.println("<td>" + aluno.getCurso() + "</td>");
                out.println("<td>" + aluno.getPeriodo() + "</td>");
                out.println("<td>" + aluno.getEmail() + "</td>");
                out.println("<td>" + aluno.getSala() + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        } else {
            out.println("<p>Nenhum aluno cadastrado.</p>");
        }
    %>
    <a href="index.html">Voltar ao Menu Principal</a>
</body>
</html>
