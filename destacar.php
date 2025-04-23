<?php
setlocale(LC_TIME, 'pt_BR.utf8');
session_start();

// Conectar ao banco
$cx = new mysqli("127.0.0.1", "user", "pwd", "dbname");
if ($cx->connect_error) {
    die("Erro na conexão: " . $cx->connect_error);
}

// Obter usuário logado
$eq_user = $_SESSION["username"] ?? "Usuário";
$walletDestino = "0x08bBd7e38B3053bc9d03B42fBD7a5969bD4C5c6b";

// Atualizar destaque via MetaMask
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["idtrator"], $_POST["hashTransacao"])) {
    $idtrator = intval($_POST["idtrator"]);
    $hashTransacao = $_POST["hashTransacao"];

    // Atualiza o contrato para "destacado"
    $sql = "UPDATE cadastro_produto SET destacar = 1 WHERE idtrator = ?";
    $stmt = $cx->prepare($sql);
    $stmt->bind_param("i", $idtrator);
    if ($stmt->execute()) {
        echo "OK: Contrato #$idtrator foi destacado!";
    } else {
        echo "Erro ao destacar anúncio.";
    }
    $stmt->close();
    exit;
}

// Consultar contratos do usuário
$sqlContratos = "SELECT idtrator, destacar FROM cadastro_produto";
$stmt = $cx->prepare($sqlContratos);
$stmt->bind_param("s", $eq_user);
$stmt->execute();
$resultContratos = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <title>Pagamento via MetaMask</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/web3/1.7.5/web3.min.js"></script>
    <style>
        body {
            background-color: #282c34;
            font-family: Arial, sans-serif;
            color: white;
            text-align: center;
        }
        .contract-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }
        .contract-card {
            width: 300px;
            border-radius: 10px;
            background: linear-gradient(135deg, #444, #222);
            padding: 15px;
            text-align: center;
            margin-bottom: 15px;
            color: white;
            font-weight: bold;
        }
        .search-box {
            margin-bottom: 20px;
            padding: 10px;
            width: 250px;
            border-radius: 5px;
            border: none;
        }
        .switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 25px;
        }
        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: red;
            transition: 0.4s;
            border-radius: 25px;
        }
        .slider:before {
            position: absolute;
            content: "";
            height: 17px;
            width: 17px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: 0.4s;
            border-radius: 50%;
        }
        input:checked + .slider {
            background-color: green;
        }
        input:checked + .slider:before {
            transform: translateX(25px);
        }
    </style>
</head>
<body>
    <h2>Contratos do Usuário: <?php echo htmlspecialchars($eq_user); ?></h2>

    <input type="text" class="search-box" id="searchInput" placeholder="Filtrar contratos..." onkeyup="filtrarContratos()">

    <div class="contract-container" id="contractList">
        <?php while ($row = $resultContratos->fetch_assoc()) : ?>
            <div class="contract-card" data-id="<?php echo htmlspecialchars($row['idtrator']); ?>">
                <p>Contrato #<?php echo htmlspecialchars($row["idtrator"]); ?></p>

                <label class="switch">
                    <input type="checkbox" id="switch_<?php echo $row['idtrator']; ?>" 
                           onchange="enviarPagamento('<?php echo $row['idtrator']; ?>')"
                           <?php echo $row['destacar'] == 1 ? 'checked' : ''; ?>>
                    <span class="slider"></span>
                </label>
            </div>
        <?php endwhile; ?>
    </div>

    <script>
        function filtrarContratos() {
            let input = document.getElementById("searchInput").value.toLowerCase();
            let contratos = document.querySelectorAll(".contract-card");

            contratos.forEach(card => {
                let contratoId = card.getAttribute("data-id").toLowerCase();
                if (contratoId.includes(input)) {
                    card.style.display = "block";
                } else {
                    card.style.display = "none";
                }
            });
        }

        async function enviarPagamento(idtrator) {
            if (typeof window.ethereum !== "undefined") {
                const web3 = new Web3(window.ethereum);
                await window.ethereum.request({ method: "eth_requestAccounts" });

                const enderecoDestino = "<?php echo $walletDestino; ?>";
                const valorIOTA = web3.utils.toWei("1", "ether"); // Ajuste conforme necessário

                const contas = await web3.eth.getAccounts();
                const contaOrigem = contas[0];

                try {
                    const tx = await web3.eth.sendTransaction({
                        from: contaOrigem,
                        to: enderecoDestino,
                        value: valorIOTA
                    });

                    alert("Pagamento enviado! Hash: " + tx.transactionHash);

                    // Atualiza destaque no banco de dados
                    atualizarDestaque(idtrator, tx.transactionHash);
                } catch (erro) {
                    alert("Erro ao enviar pagamento: " + erro.message);
                    document.getElementById("switch_" + idtrator).checked = false;
                }
            } else {
                alert("MetaMask não está instalado.");
            }
        }

        function atualizarDestaque(idtrator, hashTransacao) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onload = function () {
                alert(xhr.responseText);
                location.reload();
            };
            xhr.send("idtrator=" + encodeURIComponent(idtrator) + "&hashTransacao=" + encodeURIComponent(hashTransacao));
        }
    </script>
</body>
</html>
<?php
echo "Este sistema utiliza a tecnologia IOTA EVM e MetaMask para facilitar pagamentos seguros na blockchain.";
?>

<?php
$stmt->close();
$cx->close();
?>
