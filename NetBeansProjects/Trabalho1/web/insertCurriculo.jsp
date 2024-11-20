<%@ page import="java.sql.*" %>
<%@ page import="scr.DatabaseConnection" %>
<html>
<head>
    <title>Inserir Curriculo</title>
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
        <h2>Inserir Curriculo</h2>
    </header>
    <main>
        <form action="insertCurriculo.jsp" method="post">
            Código do Curso: <input type="text" name="codigoCurso" required><br>
            Código da Disciplina: <input type="text" name="codigoDisciplina" required><br>
            Obrigatória/Opcional: <input type="text" name="obrigatoriaOpcional" required><br>
            <input type="submit" value="Inserir">
        </form>
        <%
            if (request.getMethod().equalsIgnoreCase("post")) {
                int codigoCurso = Integer.parseInt(request.getParameter("codigoCurso"));
                int codigoDisciplina = Integer.parseInt(request.getParameter("codigoDisciplina"));
                String obrigatoriaOpcional = request.getParameter("obrigatoriaOpcional");

                Connection conn = null;
                PreparedStatement ps = null;

                try {
                    conn = DatabaseConnection.getConnection();
                    String sql = "INSERT INTO Curriculo (CodigoCurso, CodigoDisciplina, ObrigatoriaOpcional) VALUES (?, ?, ?)";
                    ps = conn.prepareStatement(sql);
                    ps.setInt(1, codigoCurso);
                    ps.setInt(2, codigoDisciplina);
                    ps.setString(3, obrigatoriaOpcional);
                    ps.executeUpdate();
                    out.println("Curriculo inserido com sucesso!<br>");
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("Erro ao inserir curriculo: " + e.getMessage() + "<br>");
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
