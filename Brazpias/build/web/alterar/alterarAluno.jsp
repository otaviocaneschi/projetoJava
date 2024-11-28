<%-- 
    Document   : alterarAluno
    Created on : 15 de nov. de 2024, 23:20:29
    Author     : Marcos Shigetomi/Lucas Kevin
--%>

<%@page import="modelDAO.AlunoDAO"%>
<%@page import="model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Alterar Aluno</title>
</head>
<body>
    <h1>Resultado da Alteração</h1>
    <%
        int rgm = Integer.parseInt(request.getParameter("rgm"));
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        int idade = Integer.parseInt(request.getParameter("idade"));
        String curso = request.getParameter("curso");
        String periodo = request.getParameter("periodo");
        String email = request.getParameter("email");
        String sala = request.getParameter("sala");

        Aluno aluno = new Aluno();
        aluno.setRgm(rgm);
        aluno.setCpf(cpf);
        aluno.setNome(nome);
        aluno.setIdade(idade);
        aluno.setCurso(curso);
        aluno.setPeriodo(periodo);
        aluno.setEmail(email);
        aluno.setSala(sala);

        AlunoDAO alunoDAO = new AlunoDAO();
        boolean sucesso = alunoDAO.alterarAluno(aluno);

        if (sucesso) {
            out.println("<p>Aluno alterado com sucesso!</p>");
        } else {
            out.println("<p>Erro ao alterar aluno. Verifique os dados e tente novamente.</p>");
        }
    %>
    <a href="alterarAluno.html">Voltar</a>
</body>
</html>
