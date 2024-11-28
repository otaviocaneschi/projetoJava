<%-- 
    Document   : cadastrarAluno
    Created on : 15 de nov. de 2024, 21:42:56
    Author     : Marcos Shigetomi/Lucas Kevin   
--%>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modelDAO.AlunoDAO"%>
<%@ page import="model.Aluno"%>

<html>
<head>
    <title>Cadastro de Aluno</title>
</head>
<body>
    <h1>Cadastro de Aluno</h1>
    <%
        // Recebe os valores do HTML
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        int idade = Integer.parseInt(request.getParameter("idade"));
        String curso = request.getParameter("curso");
        String periodo = request.getParameter("periodo");
        String email = request.getParameter("email");
        String sala = request.getParameter("sala");

        // Cria o objeto Aluno
        Aluno aluno = new Aluno();
        aluno.setCpf(cpf);
        aluno.setNome(nome);
        aluno.setIdade(idade);
        aluno.setCurso(curso);
        aluno.setPeriodo(periodo);
        aluno.setEmail(email);
        aluno.setSala(sala);

        // Chama o m�todo do DAO para cadastrar o aluno
        AlunoDAO dao = new AlunoDAO();

        // Exibe uma mensagem de sucesso ou erro
        if (dao.cadastrarAluno(aluno) == true) {
    %>
            <p>Aluno cadastrado com sucesso!</p>
    <%
        } else {
    %>
            <p>Erro ao cadastrar aluno.</p>
    <%
        }
    %>
</body>
</html>
