<%-- 
    Document   : consultarParaAlterar
    Created on : 15 de nov. de 2024, 23:20:04
    Author     : marco
--%>

<<%@page import="modelDAO.AlunoDAO"%>
<%@page import="model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Alterar Aluno</title>
    <link rel="stylesheet" href="css2.css"> 
</head>
<body>
    <div class="container">
        <h1>Alterar Aluno</h1>
        <%
            int rgm = Integer.parseInt(request.getParameter("rgm"));

            Aluno aluno = new Aluno();
            aluno.setRgm(rgm);

            AlunoDAO alunoDAO = new AlunoDAO();
            Aluno alunoConsultado = alunoDAO.consAlunoPorRgm(aluno);

            if (alunoConsultado != null) {
        %>
            <form action="alterarAluno.jsp" method="post">
                <input type="hidden" name="rgm" value="<%= alunoConsultado.getRgm() %>">

                <label for="cpf">CPF:</label>
                <input type="text" id="cpf" name="cpf" value="<%= alunoConsultado.getCpf() %>" required>

                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nome" value="<%= alunoConsultado.getNome() %>" required>

                <label for="idade">Idade:</label>
                <input type="number" id="idade" name="idade" value="<%= alunoConsultado.getIdade() %>" required>

                <label for="curso">Curso:</label>
                <input type="text" id="curso" name="curso" value="<%= alunoConsultado.getCurso() %>" required>

                <label for="periodo">Período:</label>
                <input type="text" id="periodo" name="periodo" value="<%= alunoConsultado.getPeriodo() %>" required>

                <label for="email">E-mail:</label>
                <input type="email" id="email" name="email" value="<%= alunoConsultado.getEmail() %>" required>

                <label for="sala">Sala:</label>
                <input type="text" id="sala" name="sala" value="<%= alunoConsultado.getSala() %>" required>

                <input type="submit" value="Salvar Alterações">
            </form>
        <%
            } else {
                out.println("<p>Aluno não encontrado. Verifique o RGM informado.</p>");
            }
        %>
        <a href="alterarAluno.html">Voltar</a>
    </div>
</body>
</html>