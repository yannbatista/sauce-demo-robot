# 🤖 Testes Automatizados com Robot Framework - Sauce Demo

Este repositório contém testes automatizados desenvolvidos com **Robot Framework** para a aplicação [Sauce Demo](https://www.saucedemo.com/), organizados por funcionalidade: login, carrinho e checkout.

---

## ✅ Tecnologias utilizadas

- Python 3.x
- Robot Framework
- Robot Framework Browser (Playwright)

---

## 📋 Cenários de Teste

### 🔐 Login
- Login com falha (credenciais incorretas)
- Login inválido (campos vazios ou mal formatados)
- Login com sucesso

### 🛒 Carrinho
- Adicionar item ao carrinho
- Remover item do carrinho

### 💳 Checkout
- Checkout cancelado
- Checkout com informações faltantes
- Checkout com sucesso

---

## 📂 Estrutura de Pastas

```
.
├── cart/
│   ├── addToCart.robot
│   └── removeFromCart.robot
├── checkout/
│   ├── checkoutCancel.robot
│   ├── checkoutMissingInfo.robot
│   └── checkoutSuccess.robot
├── login/
│   ├── loginFail.robot
│   ├── loginInvalid.robot
│   └── loginSucess.robot
└── results/
    ├── log.html
    ├── output.xml
    └── report.html
```

---

## ⚙️ Como instalar e executar

### 1. Crie e ative um ambiente virtual

```bash
python -m venv venv

# Ativação no Windows:
venv\Scripts\activate
```

### 2. Instale as dependências

```bash
pip install robotframework
pip install robotframework-browser
rfbrowser init
```

---

## ▶️ Como rodar os testes

### Rodar todos os testes:

```bash
robot -d results .
```

### Rodar uma pasta específica (ex: login):

```bash
robot -d results login/
```

### Rodar um teste específico:

```bash
robot -d results login/loginSucess.robot
```

---

## 📊 Relatórios gerados

Após a execução, os seguintes arquivos serão gerados na pasta `results/`:

- `log.html` – Log detalhado da execução
- `report.html` – Relatório consolidado
- `output.xml` – Arquivo para integração ou parsing

---

## 👨‍💻 Autor

- [Yann Batista](https://github.com/yannbatista)
