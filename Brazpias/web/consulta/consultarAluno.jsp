<%-- 
    Document   : consultaAluno
    Created on : 15 de nov. de 2024, 23:15:07
    Author     : marco
--%>

<%@page import="modelDAO.AlunoDAO"%>
<%@page import="model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Consulta de Aluno</title>
</head>
<body>
    <h1>Resultado da Consulta</h1>
    <%
        int rgm = Integer.parseInt(request.getParameter("rgm"));

        Aluno aluno = new Aluno();
        aluno.setRgm(rgm);

        AlunoDAO alunoDAO = new AlunoDAO();
        Aluno alunoConsultado = alunoDAO.consAlunoPorRgm(aluno);

        if (alunoConsultado != null) {
            out.println("<p><strong>RGM:</strong> " + alunoConsultado.getRgm() + "</p>");
            out.println("<p><strong>CPF:</strong> " + alunoConsultado.getCpf() + "</p>");
            out.println("<p><strong>Nome:</strong> " + alunoConsultado.getNome() + "</p>");
            out.println("<p><strong>Idade:</strong> " + alunoConsultado.getIdade() + "</p>");
            out.println("<p><strong>Curso:</strong> " + alunoConsultado.getCurso() + "</p>");
            out.println("<p><strong>Período:</strong> " + alunoConsultado.getPeriodo() + "</p>");
            out.println("<p><strong>E-mail:</strong> " + alunoConsultado.getEmail() + "</p>");
            out.println("<p><strong>Sala:</strong> " + alunoConsultado.getSala() + "</p>");
        } else {
            out.println("<p>Aluno não encontrado.</p>");
        }
    %>
    <a href="index.html">Voltar ao Menu Principal</a>
</body>
</html>
