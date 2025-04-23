<?php
$servername = "localhost";
$username = "";
$password = "";
$dbname = "";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Definir a quantidade de produtos por página
$limite = 9; // Para manter múltiplos de 3 colunas
$pagina = isset($_GET['pagina']) ? intval($_GET['pagina']) : 1;
$offset = ($pagina - 1) * $limite;

// Pesquisa personalizada
$searchQuery = "WHERE 1=1"; 
if (!empty($_GET['search_id'])) {
    $search_id = $_GET['search_id'];
    $searchQuery .= " AND p.id='$search_id'";
}
if (!empty($_GET['search_idtrator'])) {
    $search_idtrator = $_GET['search_idtrator'];
    $searchQuery .= " AND p.idtrator='$search_idtrator'";
}
if (!empty($_GET['search_user'])) {
    $search_user = $_GET['search_user'];
    $searchQuery .= " AND p.eq_user='$search_user'";
}

// Obtenção dos produtos com paginação
$sql = "SELECT p.id, p.idtrator, p.nome, p.valor, p.quantidade, p.eq_user, 
               (SELECT imagem FROM imagens_produto WHERE produto_id = p.id LIMIT 1) AS imagem, 
               p.leilao, p.nuvem, p.cidadeTrator, p.estadoTrator, p.destacar
        FROM cadastro_produto p
        $searchQuery
        GROUP BY p.id
        ORDER BY p.destacar DESC, p.id DESC
        LIMIT $limite OFFSET $offset";



$result = $conn->query($sql);

// Contar o total de produtos para calcular páginas
$sqlTotal = "SELECT COUNT(*) AS total FROM cadastro_produto p $searchQuery";
$resultTotal = $conn->query($sqlTotal);
$totalProdutos = $resultTotal->fetch_assoc()['total'];
$totalPaginas = ceil($totalProdutos / $limite);

$conn->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Produtos</title>
    <style>
        body {
            background-color: #6d0505;
            font-family: Arial, sans-serif;
            color: white;
            text-align: center;
        }
      .form-container {
    display: flex;
    flex-wrap: nowrap;
    gap: 20px; /* Espaçamento uniforme entre os elementos */
    align-items: flex-end; /* Mantém alinhamento correto como botão */
    justify-content: center;
    margin-bottom: 20px;
    padding: 20px;
    background-color: #2e2e2e;
    border-radius: 8px;
}

.form-group {
    flex: 1;
    min-width: 200px;
}
.destacado {
    border: 3px solid yellow; /* Contorno amarelo */
    background-color: #ffeb3b; /* Fundo amarelo claro */
}


.search-btn {
    padding: 8px 16px; /* Ajusta o tamanho para ficar mais proporcional */
    font-size: 16px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s ease;
    height: 40px; /* Define uma altura fixa para que fique alinhado */
    margin-left: 15px; /* Espaçamento correto entre os elementos */
}

.search-btn:hover {
    background-color: #45a049;
    transform: scale(1.05);
}





        input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
   


        .product-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
}

.product-card {
    width: calc(33.33% - 20px); /* Mantém três colunas */
    max-width: 300px;
    border-radius: 10px;
    background: linear-gradient(135deg, #222831, #393e46);
    padding: 15px;
    text-align: center;
    transition: all 0.3s ease-in-out;
}

/* Ajuste para telas menores */
@media (max-width: 900px) {
    .product-card {
        width: calc(50% - 20px); /* Ajusta para duas colunas */
    }
}

@media (max-width: 600px) {
    .product-card {
        width: 100%; /* Ajusta para uma coluna */
    }
}


.product-card:hover {
    transform: scale(1.05);
    box-shadow: 0px 0px 15px rgba(255, 255, 255, 0.1);
}

        .product-img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .word-cloud {
            text-align: center;
            max-width: 100%;
            margin-top: 10px;
        }
        .word-cloud span {
            display: inline-block;
            margin: 3px;
            color: #ffd700;
            font-weight: bold;
        }
        .pagination {
            text-align: center;
            margin-top: 20px;
        }
        .pagination a {
            display: inline-block;
            padding: 8px 15px;
            margin: 5px;
            background-color: #ff9800;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .pagination a:hover {
            background-color: #e67e22;
        }
        .btn {
            background-color: #ff9800;
            color: white;
            padding: 12px 24px;
            font-size: 18px;
            text-decoration: none;
            border-radius: 8px;
            text-align: center;
            display: inline-block;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3);
        }
        
        .btn:hover {
            background-color: #e67e22;
            transform: scale(1.05);
        }
        .btn-inicio {
            background-color: #4CAF50;
        }
        .btn-inicio:hover {
            background-color: #45a049;
        }
        .btn-visualizar {
            background-color: #007bff;
        }
        .btn-visualizar:hover {
            background-color: #0056b3;
        }
       
}

    </style>
</head>
<body>
    <h2>Produtos</h2>
    <center><a href="../" class="btn btn-inicio">🏠 Início</a></center>
<br>
    <!-- Formulários de Pesquisa -->
    <form method="get" action="" class="form-container">
        <div class="form-group">
            <label for="search_id">Pesquisar por ID:</label>
            <input type="number" id="search_id" name="search_id">
        </div>
        <div class="form-group">
            <label for="search_idtrator">Pesquisar por Contrato:</label>
            <input type="number" id="search_idtrator" name="search_idtrator">
        </div>
        <div class="form-group">
            <label for="search_user">Pesquisar por Usuário:</label>
            <input type="text" id="search_user" name="search_user">
        </div>
        <div class="form-group">
            <input type="submit" value="Pesquisar" class="search-btn">
        </div>
    </form>

    <div class="product-container">
        <?php
        if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        // Definir classe para destaque
        $classeDestacado = ($row["destacar"] == 1) ? "destacado" : "";
        
        echo "<div class='product-card $classeDestacado'>";
        echo "<img src='" . htmlspecialchars($row["imagem"]) . "' class='product-img'>";
        echo "<h3>" . htmlspecialchars($row["nome"]) . "</h3>";
        echo "<p><strong>ID:</strong> " . htmlspecialchars($row["id"]) . "</p>";
        echo "<p><strong>Contrato:</strong> " . htmlspecialchars($row["idtrator"]) . "</p>";
        echo "<p><strong>Usuário:</strong> " . htmlspecialchars($row["eq_user"]) . "</p>";
        echo "<p><strong>Valor:</strong> R$ " . number_format($row["valor"], 2, ',', '.') . "</p>";
        echo "<p><strong>Horas:</strong> " . htmlspecialchars($row["quantidade"]) . "</p>";
        echo "<p><strong>Cidade:</strong> " . htmlspecialchars($row["cidadeTrator"]) . "</p>";
        echo "<p><strong>Estado:</strong> " . htmlspecialchars($row["estadoTrator"]) . "</p>";

        // Criar nuvem de palavras para este produto
        if (!empty($row["nuvem"])) {
            $palavrasNuvem = explode(" ", htmlspecialchars($row["nuvem"]));
            $frequenciaNuvem = array_count_values($palavrasNuvem);

            echo "<div class='word-cloud'>";
            foreach ($frequenciaNuvem as $palavra => $contagem) {
                $tamanho = 10 + ($contagem * 4);
                echo "<span style='font-size: {$tamanho}px;'>{$palavra}</span>";
            }
            echo "</div>";
        }

        echo "<p><a href='/produto.php?id=" . $row["id"] . "' class='btn btn-visualizar'>🔎 Visualizar</a></p>";
        echo "</div>";
    }
} else {
    echo "<p class='message'>Nenhum produto encontrado.</p>";
}

        ?>
    </div>

    <!-- Paginação -->
    <div class='pagination'>
        <?php for ($i = 1; $i <= $totalPaginas; $i++) { ?>
            <a href="?pagina=<?php echo $i; ?>"><?php echo $i; ?></a>
        <?php } ?>
    </div>
</body>
</html>
