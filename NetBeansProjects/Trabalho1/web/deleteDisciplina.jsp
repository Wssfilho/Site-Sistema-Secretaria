<%@ page import="java.sql.*" %>
<%@ page import="scr.DatabaseConnection" %>
<html>
<head>
    <title>Deletar Disciplina</title>
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
        <h2>Deletar Disciplina</h2>
    </header>
    <main>
        <form action="deleteDisciplina.jsp" method="post">
            Código da Disciplina: <input type="text" name="codigoDisciplina" required><br>
            <input type="submit" value="Deletar">
        </form>
        <%
            if (request.getMethod().equalsIgnoreCase("post")) {
                int codigoDisciplina = Integer.parseInt(request.getParameter("codigoDisciplina"));

                Connection conn = null;
                PreparedStatement ps = null;

                try {
                    conn = DatabaseConnection.getConnection();
                    
                    // Deleta as referências na tabela curriculo
                    String sql = "DELETE FROM Curriculo WHERE CodigoDisciplina = ?";
                    ps = conn.prepareStatement(sql);
                    ps.setInt(1, codigoDisciplina);
                    ps.executeUpdate();

                    // Deleta a disciplina na tabela disciplina
                    sql = "DELETE FROM Disciplina WHERE CodigoDisciplina = ?";
                    ps = conn.prepareStatement(sql);
                    ps.setInt(1, codigoDisciplina);
                    ps.executeUpdate();

                    out.println("Disciplina deletada com sucesso!<br>");
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("Erro ao deletar disciplina: " + e.getMessage() + "<br>");
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
