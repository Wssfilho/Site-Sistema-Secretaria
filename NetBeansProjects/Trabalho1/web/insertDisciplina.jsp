<%@ page import="java.sql.*" %>
<%@ page import="scr.DatabaseConnection" %>
<html>
    <head>
        <title>Inserir Disciplina</title>
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
            <h2>Inserir Disciplina</h2>
        </header>
        <main>
            <form action="insertDisciplina.jsp" method="post">
                Nome: <input type="text" name="nome" required><br>
                CodigoDisciplina <input type ="text" name ="codigoDisciplina" required><br>
                Cr�ditos: <input type="text" name="creditos" required><br>
                C�digo do Departamento: <input type="text" name="codigoDepartamento" required><br>
                <input type="submit" value="Inserir">
            </form>
            <%
                if (request.getMethod().equalsIgnoreCase("post")) {
                    String nome = request.getParameter("nome");
                    int creditos = Integer.parseInt(request.getParameter("creditos"));
                    int codigoDepartamento = Integer.parseInt(request.getParameter("codigoDepartamento"));
                    int codigoDisciplina = Integer.parseInt(request.getParameter("codigoDisciplina"));
                    Connection conn = null;
                    PreparedStatement ps = null;

                    try {
                        conn = DatabaseConnection.getConnection();
                        String sql = "INSERT INTO Disciplina (CodigoDisciplina, Nome, Creditos, CodigoDepartamento) VALUES (?,?, ?, ?)";
                        ps = conn.prepareStatement(sql);
                        ps.setInt(1, codigoDisciplina);
                        ps.setString(2, nome);
                        ps.setInt(3, creditos);
                        ps.setInt(4, codigoDepartamento);
                        ps.executeUpdate();
                        out.println("Disciplina inserida com sucesso!<br>");
                    } catch (SQLException e) {
                        if (e.getSQLState().equals("23000")) { //23000 erro para integridade referencial
                            out.println("Erro: Departamento n�o encontrado. Verifique o C�digo do Departamento.<br>");
                        } // C�digo SQL para viola��o de restri��o de integridade out.println("Erro: Departamento n�o encontrado. Verifique o C�digo do Departamento.<br>"); } 
                        else {
                            e.printStackTrace();
                            out.println("Erro ao inserir disciplina: " + e.getMessage() + "<br>");
                        }
                    } finally {
                        if (ps != null) {
                            ps.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    }
                }
            %>
            <!-- Bot�o de Voltar para a P�gina Inicial -->
            <form action="index.jsp" method="get">
                <input type="submit" value="Voltar para a P�gina Inicial" class="btn">
            </form>
        </main>
    </body>
</html>
