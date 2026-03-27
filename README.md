# 🍔 Sistema de Pedidos - Banco de Dados (SQL)

Projeto de modelagem e implementação de banco de dados para um sistema de pedidos (estilo lanchonete), utilizando SQL e boas práticas de relacionamento entre tabelas.

---
Link modelagem: https://dbdiagram.io/d/69bb1d56fb2db18e3bb3fbbb

## 📌 Objetivo

Criar uma estrutura de banco de dados capaz de gerenciar:

* Clientes
* Produtos
* Pedidos
* Itens de cada pedido

Com integridade referencial e consultas eficientes.

---

## 🧱 Estrutura do Banco

O banco de dados é composto por 4 tabelas principais:

### 👤 clientes

Armazena os dados dos clientes.

* id (PK)
* nome
* telefone
* criado_em

---

### 🍟 produtos

Armazena os produtos disponíveis.

* id (PK)
* nome
* preco
* criado_em

---

### 🧾 pedidos

Representa os pedidos realizados pelos clientes.

* id (PK)
* cliente_id (FK)
* status
* criado_em

🔗 Relacionamento:

* Um cliente pode ter vários pedidos

---

### 📦 itens_pedido

Armazena os itens de cada pedido.

* id (PK)
* pedido_id (FK)
* produto_id (FK)
* quantidade
* preco_unitario

🔗 Relacionamentos:

* Um pedido pode ter vários itens
* Um produto pode estar em vários pedidos

---

## 🔗 Relacionamentos (Resumo)

* **clientes 1:N pedidos**
* **pedidos 1:N itens_pedido**
* **produtos 1:N itens_pedido**

---

## 🧪 Dados de Teste

O projeto já inclui inserts para facilitar testes:

* 2 clientes cadastrados
* 3 produtos
* 1 pedido com múltiplos itens

---

## 🔍 Consultas Implementadas

### 📌 Listar pedidos com cliente

Retorna os pedidos vinculados aos seus respectivos clientes.

---

### 📌 Listar itens de um pedido

Exibe os produtos, quantidades e valores de um pedido específico.

---

### 📌 Calcular total do pedido

Realiza o cálculo do valor total com base nos itens:

* quantidade × preço_unitário

---

## 🚀 Como Executar

1. Crie um banco de dados no PostgreSQL
2. Execute o script SQL completo:

```sql
-- cole aqui o script completo e execute
```

3. Execute as consultas para testar os dados

---

## 🛠️ Tecnologias Utilizadas

* SQL
* PostgreSQL

---

## 💡 Conceitos Aplicados

* Modelagem relacional
* Chaves primárias e estrangeiras
* Integridade referencial
* Normalização básica
* JOINs
* Agregações com SUM()

---

## 📈 Possíveis Melhorias

* Adicionar tabela de pagamentos
* Criar controle de status mais robusto (ENUM)
* Implementar usuários/funcionários
* Adicionar índice para performance
* Criar procedures ou views

---

## 👨‍💻 Autor

Desenvolvido por Thiago 🚀
Projeto acadêmico com foco em prática de banco de dados e backend.

---
