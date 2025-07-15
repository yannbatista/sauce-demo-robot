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

python -m venv venv

# Ativação no Windows:
venv\Scripts\activate

pip install robotframework
pip install robotframework-browser
rfbrowser init

robot -d results login/loginSucess.robot

