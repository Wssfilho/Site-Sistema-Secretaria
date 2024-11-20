<%@ page import="java.sql.*" %>
<%@ page import="scr.DatabaseConnection" %>
<html>
<head>
    <title>Visualizar Currículos</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        input[type="submit"], .btn {
            padding: 10px;
            margin: 20px 0;
            width: 100%;
            box-sizing: border-box;
            font-size: 1em;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
        }

        input[type="submit"]:hover, .btn:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <header>
        <h2>Visualizar Currículos</h2>
    </header>
    <main>
        <table>
            <tr>
                <th>Código do Curso</th>
                <th>Código da Disciplina</th>
                <th>Obrigatória/Opcional</th>
            </tr>
            <%
                if (request.getMethod().equalsIgnoreCase("get")) {
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        conn = DatabaseConnection.getConnection();
                        String sql = "SELECT * FROM Curriculo ORDER BY CodigoCurso";
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            int codigoCurso = rs.getInt("CodigoCurso");
                            int codigoDisciplina = rs.getInt("CodigoDisciplina");
                            String obrigatoriaOpcional = rs.getString("ObrigatoriaOpcional");
            %>
            <tr>
                <td><%= codigoCurso %></td>
                <td><%= codigoDisciplina %></td>
                <td><%= obrigatoriaOpcional %></td>
            </tr>
            <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("Erro ao visualizar currículos: " + e.getMessage() + "<br>");
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                }
            %>
        </table>
        <!-- Botão de Voltar para a Página Inicial -->
        <form action="index.jsp" method="get">
            <input type="submit" value="Voltar para a Página Inicial" class="btn">
        </form>
    </main>
</body>
</html>
