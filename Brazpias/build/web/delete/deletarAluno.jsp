<%-- 
    Document   : deletarAluno
    Created on : 15 de nov. de 2024, 23:08:03
    Author     : Marcos Shigetomi/Lucas Kevin
--%>

<%@page import="modelDAO.AlunoDAO"%>
<%@page import="model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Deletar Aluno</title>
</head>
<body>
    <h1>Resultado da Exclusão</h1>
    <%
        int rgm = Integer.parseInt(request.getParameter("rgm"));

        Aluno aluno = new Aluno();
        aluno.setRgm(rgm);

        AlunoDAO alunoDAO = new AlunoDAO();
        boolean sucesso = alunoDAO.deletarAluno(aluno);

        if (sucesso) {
            out.println("<p>Aluno deletado com sucesso!</p>");
        } else {
            out.println("<p>Erro ao deletar aluno. Verifique o RGM e tente novamente.</p>");
        }
    %>
    <a href="index.html">Voltar ao Menu Principal</a>
</body>
</html>
