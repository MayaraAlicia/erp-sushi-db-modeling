-- Banco de dados: `raion`

-- --------------------------------------------------------

-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `Cliente_id` int(11) UNSIGNED NOT NULL COMMENT 'Chave Primária',
  `nome` varchar(255) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Armazena os dados cadastrais dos clientes da lanchonete.';

-- Estrutura para tabela `estoque_movimentos`
--

CREATE TABLE `estoque_movimentos` (
  `id_movimento` int(11) NOT NULL COMMENT 'Chave primária',
  `id_produto` int(11) NOT NULL COMMENT 'FK para a tabela produtos',
  `id_funcionario` int(11) NOT NULL COMMENT 'FK para a tabela funcionarios (responsável)',
  `tipo_movimento` varchar(50) NOT NULL COMMENT 'Ex: ''Entrada'' (compra), ''Saída'' (venda), ''Ajuste''',
  `quantidade` int(11) NOT NULL COMMENT 'Positivo para entrada, negativo para saída',
  `data_movimento` datetime NOT NULL DEFAULT current_timestamp(),
  `observacao` text DEFAULT NULL COMMENT 'Ex: "Ajuste por perda", "Compra NF 123"'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Log de todas as movimentações de estoque';

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id_fornecedor` int(11) NOT NULL COMMENT 'Chave primária',
  `nome_empresa` varchar(150) NOT NULL,
  `cnpj` varchar(18) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_funcionario` int(11) NOT NULL COMMENT 'Chave primária',
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL COMMENT 'Login de acesso (e-mail único)',
  `senha` varchar(255) NOT NULL COMMENT 'Senha com hash (NUNCA texto puro)',
  `cargo` varchar(50) NOT NULL COMMENT 'Ex: Atendente, Gerente, Cozinheiro',
  `data_cadastro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Dados dos funcionários, incluindo login de acesso ao sistema';

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_pedidos`
--

CREATE TABLE `itens_pedidos` (
  `id_item_pedido` int(11) NOT NULL COMMENT 'Chave primária',
  `id_pedido` int(11) NOT NULL COMMENT 'FK para a tabela pedidos',
  `id_produto` int(11) NOT NULL COMMENT 'FK para a tabela produtos',
  `quantidade` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL COMMENT 'Preço do produto no momento da venda'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Liga o pedido aos produtos que foram vendidos';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `id_pagamento` int(11) NOT NULL COMMENT 'Chave primária',
  `id_pedido` int(11) NOT NULL COMMENT 'FK para a tabela pedidos',
  `forma_pagamento` varchar(50) NOT NULL COMMENT 'Ex: Pix, Dinheiro, Cartão de Crédito',
  `valor` decimal(10,2) NOT NULL,
  `data_pagamento` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Registra os pagamentos associados a cada pedido';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL COMMENT 'Chave primária',
  `id_cliente` int(11) NOT NULL COMMENT 'FK para a tabela clientes',
  `id_funcionario` int(11) NOT NULL COMMENT 'FK para a tabela funcionarios (quem registrou)',
  `data_pedido` datetime NOT NULL DEFAULT current_timestamp(),
  `status_pedido` varchar(50) NOT NULL DEFAULT '''Aberto''' COMMENT 'Ex: Aberto, Em preparo, Concluído, Cancelado',
  `valor_total` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Armazena o cabeçalho de cada pedido (quem, quando, valor tot';

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL COMMENT 'Chave primária',
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `estoque_atual` int(11) NOT NULL DEFAULT 0 COMMENT 'Quantidade atual em estoque',
  `id_fornecedor` int(11) DEFAULT NULL COMMENT 'FK para a tabela fornecedores'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Cardápio. Armazena os produtos (pratos, bebidas) com preço e';

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Cliente_id`);

--
-- Índices de tabela `estoque_movimentos`
--
ALTER TABLE `estoque_movimentos`
  ADD PRIMARY KEY (`id_movimento`);

--
-- Índices de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id_fornecedor`),
  ADD UNIQUE KEY `cnpj` (`cnpj`);

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `itens_pedidos`
--
ALTER TABLE `itens_pedidos`
  ADD PRIMARY KEY (`id_item_pedido`);

--
-- Índices de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`id_pagamento`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Cliente_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Chave Primária', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `estoque_movimentos`
--
ALTER TABLE `estoque_movimentos`
  MODIFY `id_movimento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária';

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária';

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária';

--
-- AUTO_INCREMENT de tabela `itens_pedidos`
--
ALTER TABLE `itens_pedidos`
  MODIFY `id_item_pedido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária';

--
-- AUTO_INCREMENT de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária';

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária';

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

