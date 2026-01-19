# **🍱 Yuzu ERP**

Sistema de Gerenciamento Alimentício
Este projeto foi desenvolvido como Projeto Integrador na FATEC Assis, unindo as disciplinas de Engenharia de Software e Banco de Dados. O sistema é um ERP (Enterprise Resource Planning) focado na gestão de lanchonetes e restaurantes, visando centralizar operações que antes eram feitas manualmente.


## **📋 O Problema**
O estabelecimento enfrentava dificuldades com o controle manual de pedidos e entregas, falta de integração entre o estoque e o financeiro, além de falhas no registro do histórico de consumo dos clientes.

## ⚠️ Nota sobre Confidencialidade:
Este projeto foi desenvolvido com base em um cenário real para fins acadêmicos. No entanto, em respeito à ética profissional e à privacidade da empresa envolvida, todos os dados sensíveis — incluindo nomes, CNPJs, endereços, contatos e valores financeiros — foram anonimizados ou substituídos por dados fictícios. O objetivo deste repositório é puramente demonstrar competências técnicas em Engenharia de Software e Modelagem de Dados.

## **🚀 Funcionalidades Principais**
O sistema é modular e abrange as seguintes áreas:

- Clientes: Cadastro e gestão de histórico.
- Pedidos: Registro e acompanhamento em tempo real.
- Estoque: Atualização automática de entradas e saídas.
- Financeiro: Controle de pagamentos e métodos variados.
- Gestão Interna: Cadastro de funcionários, cargos e fornecedores.

## **⚙️ Requisitos do Sistema**

### *Requisitos Funcionais (RF)*

- RF01: Permitir o cadastro, consulta e atualização de clientes (nome, telefone, endereço).
- RF02: Permitir o cadastro, consulta e atualização de produtos (pratos, bebidas, preços).
- RF03: Permitir o cadastro e gerenciamento de fornecedores.
- RF04: Permitir o cadastro e gerenciamento de funcionários (atendentes, cozinheiros, entregadores).
- RF05: Registrar novos pedidos, associando-os a um cliente e a um funcionário.
- RF06: Permitir que um pedido contenha múltiplos produtos (itens do pedido).
- RF07: Controlar o status do pedido (ex: "Em preparo", "Saiu para entrega", "Entregue").
- RF08: Registrar os pagamentos de cada pedido, identificando o método (Pix, cartão, dinheiro).
- RF09: Controlar a quantidade de produtos em estoque.
- RF10: Dar baixa automática no estoque dos ingredientes/produtos vendidos após a confirmação de um pedido.
- RF11: Gerar relatórios de vendas por período (diário, semanal, mensal).

### *Requisitos Não Funcionais (RNF)*

- RNF01: O sistema deve ser acessível via navegador (interface web), sendo responsivo para uso em computadores (caixa) e tablets (atendentes).
- RNF02: O sistema deve garantir segurança com autenticação por login e senha, com diferentes níveis de permissão.
- RNF03: O tempo de resposta para registrar um novo pedido deve ser inferior a 3 segundos.
- RNF04: O sistema deve ter uma interface intuitiva e de fácil aprendizado, para agilizar o treinamento de novos funcionários.
- NF05: O sistema deve ter alta disponibilidade (ficar online) durante os horários de pico do restaurante (almoço e jantar).
- RNF06: Os dados devem ser armazenados em banco de dados relacional com rotinas de backup automáticas.


### **🛠️ Modelagem de Dados (MER)**
O banco de dados foi projetado para garantir a integridade referencial e a eficiência nas consultas.

Entidades e Atributos:
- clientes (cliente_id, nome, telefone, endereco, data_cadastro)
- funcionarios (funcionario_id, nome, cargo, telefone, email, login, senha, ativo)
- fornecedores (fornecedor_id, nome, cnpj, telefone, email, endereco)
- produtos (produto_id, nome, categoria, preco, quantidade_estoque, fornecedor_id, ativo)
- pedidos (pedido_id, cliente_id, funcionario_id, data_pedido, status, valor_total)
- itens_pedidos (item_id, pedido_id, produto_id, quantidade, preco_unitario, subtotal)
- pagamentos (pagamento_id, pedido_id, metodo, valor_pago, data_pagamento)
- estoque_movimentos (movimento_id, produto_id, tipo, quantidade, data_movimento, observacao, funcionario_id)

### Relacionamentos:
- Um cliente pode realizar vários pedidos.
- Um pedido pertence a um único cliente.
- Um pedido pode conter vários itens de pedido.
- Cada item de pedido está vinculado a um único pedido.
- Cada item de pedido está associado a um único produto.
- Um produto pode aparecer em vários itens de pedido.
- Uma categoria pode possuir vários produtos.
- Cada produto pertence a uma única categoria.
- Um cliente pode possuir vários endereços cadastrados.
- Cada endereço pertence a um único cliente.
- Um funcionário pode registrar vários pedidos.
- Cada pedido é registrado por um único funcionário.
- Cada pedido possui um único pagamento associado.
- Cada pagamento está vinculado a um único pedido.
- Cada pedido gera uma única entrega.
- Cada entrega está vinculada a um único pedido.

### Modelo Relacional (exemplo de chaves)
● Clientes(cliente_id PK)

● Funcionarios(funcionario_id PK)

● Fornecedores(fornecedor_id PK)

● Produtos(produto_id PK, fornecedor_id FK)

● Pedidos(pedido_id PK, cliente_id FK, funcionario_id FK)

● ItensPedidos(item_id PK, pedido_id FK, produto_id FK)

● Pagamentos(pagamento_id PK, pedido_id FK)

● EstoqueMovimentos(movimento_id PK, produto_id FK)

## **📂 Estrutura do Repositório**
Para facilitar a exploração do projeto, os arquivos SQL foram divididos logicamente:

- schema.sql: Contém os scripts de criação de todas as tabelas e chaves primárias/estrangeiras.
- seed.sql: Scripts de inserção de dados fictícios para teste do sistema.
- queries.sql: Consultas SQL simuladas (Ex: produtos com estoque baixo, total vendido por funcionário).

## **🖼️ Diagramas de Arquitetura**

<img width="381" height="336" alt="Captura de tela 2026-01-19 190930" src="https://github.com/user-attachments/assets/9d9d1db5-7764-444b-aa93-3d77d537ae29" />

- Diagrama de Casos de Uso UML

  

<img width="341" height="454" alt="Captura de tela 2026-01-19 190043" src="https://github.com/user-attachments/assets/254a95da-4a3c-4543-9c69-46184336e934" />

- Modelo MER
