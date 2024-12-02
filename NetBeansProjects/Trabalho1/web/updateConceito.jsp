<%@ page import="java.sql.*" %>
<%@ page import="scr.DatabaseConnection" %>
<html>
<head>
    <title>Atualizar Conceito</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 10px 0;
            text-align: center;
        }

        main {
            padding: 20px;
        }

        h2 {
            color: black;
            animation: slide-in 2s ease-out;
            margin: 0;
        }

        @keyframes slide-in {
            from {
                transform: translateX(-100%);
            }
            to {
                transform: translateX(0);
            }
        }

        form {
            margin-top: 20px;
        }

        input[type="text"], input[type="submit"] {
            padding: 10px;
            margin: 5px 0;
            width: 100%;
            box-sizing: border-box;
            font-size: 1em;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        .btn {
            display: block;
            width: 200px;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
            margin: 20px auto 0;
        }

        .btn:hover {
            background-color: #45a049;
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <header>
        <h2>Atualizar Conceito</h2>
    </header>
    <main>
        <form action="updateConceito.jsp" method="post">
            Código do Aluno: <input type="text" name="codigoAluno" required><br>
            Código da Disciplina: <input type="text" name="codigoDisciplina" required><br>
            Ano/Semestre: <input type="text" name="anoSemestre" required><br>
            Novo Conceito: <input type="text" name="novoConceito" required><br>
            <input type="submit" value="Atualizar">
        </form>
        <%
            if (request.getMethod().equalsIgnoreCase("post")) {
                int codigoAluno = Integer.parseInt(request.getParameter("codigoAluno"));
                int codigoDisciplina = Integer.parseInt(request.getParameter("codigoDisciplina"));
                String anoSemestre = request.getParameter("anoSemestre");
                String novoConceito = request.getParameter("novoConceito");

                Connection conn = null;
                PreparedStatement ps = null;

                try {
                    conn = DatabaseConnection.getConnection();
                    String sql = "UPDATE Conceito SET Conceito = ? WHERE CodigoAluno = ? AND CodigoDisciplina = ? AND AnoSemestre = ?";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, novoConceito);
                    ps.setInt(2, codigoAluno);
                    ps.setInt(3, codigoDisciplina);
                    ps.setString(4, anoSemestre);
                    ps.executeUpdate();
                    out.println("Conceito atualizado com sucesso!<br>");
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("Erro ao atualizar conceito: " + e.getMessage() + "<br>");
                } finally {
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                }
            }
        %>
        <!-- Botão de Voltar para a Página Inicial -->
        <form action="index.jsp" method="get">
            <input type="submit" value="Voltar para a Página Inicial" class="btn">
        </form>
    </main>
</body>
</html>
