<%@ page import="java.sql.*" %>
<%@ page import="scr.DatabaseConnection" %>
<html>
<head>
    <title>Inserir Aluno</title>
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
    <script>
        function animateSubmitButton() {
            const submitButton = document.querySelector('input[type="submit"]');
            submitButton.addEventListener('mouseover', function() {
                submitButton.style.backgroundColor = '#45a049';
                submitButton.style.transform = 'scale(1.05)';
            });
            submitButton.addEventListener('mouseout', function() {
                submitButton.style.backgroundColor = '#4CAF50';
                submitButton.style.transform = 'scale(1)';
            });
        }

        window.onload = function() {
            animateSubmitButton();
        };
    </script>
</head>
<body>
    <header>
        <h2>Inserir Aluno</h2>
    </header>
    <main>
        <form action="insertAluno.jsp" method="post">
            Nome: <input type="text" name="nome" required><br>
            Código do Curso: <input type="text" name="codigoCurso" required><br>
            <input type="submit" value="Inserir">
        </form>
        <form action="index.jsp" method="get">
            <input type="submit" value="Voltar para a Página Inicial" class="btn">
        </form>

        <%
            if (request.getMethod().equalsIgnoreCase("post")) {
                String nome = request.getParameter("nome");
                int codigoCurso = Integer.parseInt(request.getParameter("codigoCurso"));

                Connection conn = null;
                PreparedStatement ps = null;

                try {
                    conn = DatabaseConnection.getConnection();
                    String sql = "INSERT INTO Aluno (Nome, CodigoCurso) VALUES (?, ?)";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, nome);
                    ps.setInt(2, codigoCurso);
                    ps.executeUpdate();
                    out.println("Aluno inserido com sucesso!<br>");
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("Erro ao inserir aluno: " + e.getMessage() + "<br>");
                } finally {
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                }
            }
        %>
    </main>
</body>
</html>
