<html>
<head>
    <title>Sistema CRUD</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 10px 0;
            text-align: center;
            overflow: hidden; /* Necessário para a animação */
        }

        main {
            padding: 20px;
            display: flex;
            flex-wrap: wrap; /* Permite que os itens pularem uma linha quando necessário */
            gap: 50px; /* Espaço entre as listas */
        }

        h2 {
            color: black;
            animation: slide-in 2s ease-out; /* Adiciona a animação */
            margin: 0; /* Remove margens para evitar saltos */
        }

        @keyframes slide-in {
            from {
                transform: translateX(-100%);
            }
            to {
                transform: translateX(0);
            }
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        ul li {
            margin: 10px 0;
        }

        ul li a {
            display: block;
            width: 200px;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s; /* Transição suave para a cor de fundo */
        }

        ul li a:hover {
            background-color: #45a049;
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
            transition: background-color 0.3s, transform 0.3s; /* Transições suaves para cor e transformação */
            margin: 20px auto 0;
        }

        .btn:hover {
            background-color: #45a049;
            transform: scale(1.1); /* Aumenta o tamanho do botão quando o mouse passa sobre ele */
        }

        .container {
            display: flex;
            flex-wrap: wrap; /* Permite que os itens pularem uma linha quando necessário */
            gap: 20px; /* Espaço entre os itens */
            justify-content: center;
        }

        .item {
            display: flex;
            flex-direction: column;
            gap: 10px; /* Espaço entre os botões */
        }
    </style>
    <script>
        function animateButtonsOnHover() {
            const buttons = document.querySelectorAll('.btn');
            buttons.forEach(button => {
                button.addEventListener('mouseover', function() {
                    button.style.backgroundColor = '#45a049';
                    button.style.transform = 'scale(1.1)'; /* Aumenta o tamanho do botão */
                });
                button.addEventListener('mouseout', function() {
                    button.style.backgroundColor = '#4CAF50';
                    button.style.transform = 'scale(1)'; /* Retorna ao tamanho original */
                });
            });
        }

        window.onload = function() {
            animateButtonsOnHover(); /* Executa a função para animar os botões ao carregar a página */
        };
    </script>
</head>
<body>
    <header>
        <h2>Bem-vindo ao Sistema Secretaria</h2>
    </header>
    <main>
        <div class="container">
            <div class="item">
                <ul>
                    <li><a href="insertAluno.jsp" class="btn">Inserir Aluno</a></li>
                    <li><a href="viewAlunos.jsp" class="btn">Visualizar Alunos</a></li>
                    <li><a href="updateAluno.jsp" class="btn">Atualizar Aluno</a></li>
                    <li><a href="deleteAluno.jsp" class="btn">Deletar Aluno</a></li>
                </ul>
            </div>
            <div class="item">
                <ul id="curso">
                    <li><a href="insertCurso.jsp" class="btn">Inserir Curso</a></li>
                    <li><a href="viewCursos.jsp" class="btn">Visualizar Cursos</a></li>
                    <li><a href="updateCurso.jsp" class="btn">Atualizar Curso</a></li>
                    <li><a href="deleteCurso.jsp" class="btn">Deletar Curso</a></li>
                </ul>
                <ul id="disciplina">
                    <li><a href="insertDisciplina.jsp" class="btn">Inserir Disciplina</a></li>
                    <li><a href="viewDisciplina.jsp" class="btn">Visualizar Disciplinas</a></li>
                    <li><a href="updateDisciplina.jsp" class="btn">Atualizar Disciplina</a></li>
                    <li><a href="deleteDisciplina.jsp" class="btn">Deletar Disciplina</a></li>
                </ul>
            </div>
            <div class="item">
                <ul id="curriculo">
                    <li><a href="insertCurriculo.jsp" class="btn">Inserir Currículo</a></li>
                    <li><a href="viewCurriculo.jsp" class="btn">Visualizar Currículos</a></li>
                    <li><a href="updateCurriculo.jsp" class="btn">Atualizar Currículo</a></li>
                    <li><a href="deleteCurriculo.jsp" class="btn">Deletar Currículo</a></li>
                </ul>
            </div>
            <div class="item">
                <ul id="departamento">
                    <li><a href="insertDepartamento.jsp" class="btn">Inserir Departamento</a></li>
                    <li><a href="viewDepartamentos.jsp" class="btn">Visualizar Departamentos</a></li>
                    <li><a href="updateDepartamento.jsp" class="btn">Atualizar Departamento</a></li>
                    <li><a href="deleteDepartamento.jsp" class="btn">Deletar Departamento</a></li>
                </ul>
            </div>
            <div class="item">
                <ul id="conceito">
                    <li><a href="insertConceito.jsp" class="btn">Inserir Conceito</a></li>
                    <li><a href="viewConceito.jsp" class="btn">Visualizar Conceitos</a></li>
                    <li><a href="updateConceito.jsp" class="btn">Atualizar Conceito</a></li>
                    <li><a href="deleteConceito.jsp" class="btn">Deletar Conceito</a></li>
                </ul>
            </div>
        </div>
    </main>
</body>
</html>
