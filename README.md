
# 💪 Calculadora de IMC com Autenticação - Flutter App

Este é um aplicativo Flutter completo que implementa um sistema de **autenticação de usuários**, **cadastro** e uma **calculadora de Índice de Massa Corporal (IMC)**. O projeto foi desenvolvido seguindo boas práticas de desenvolvimento, incluindo o padrão de arquitetura MVC, persistência de dados com SQflite e organização visual com estilos centralizados.

---

## 📱 Funcionalidades

### 🔐 Tela de Login

* Campos para **e-mail** e **senha** com validação:

  * E-mail em formato válido.
  * Senha com no mínimo 8 caracteres, incluindo letras e números.
* Autenticação baseada nos dados armazenados localmente (SQflite).
* Link para **cadastro de novo usuário**.

### 📝 Tela de Cadastro

* Campos para **nome**, **sobrenome**, **e-mail** e **senha**.
* Validações de:

  * Formato do e-mail.
  * Complexidade da senha.
  * Verificação se o e-mail já está cadastrado.
* Redirecionamento automático para a tela de login após o cadastro.

### ⚖️ Tela da Calculadora de IMC

* Acessível apenas após login.
* Boas-vindas personalizadas com o nome do usuário e saudação conforme o horário (Bom dia/tarde/noite).
* Campos para inserir **peso (kg)** e **altura (cm)**.
* Cálculo do IMC com base nas informações fornecidas.
* Exibição de resultado com mensagem e **cor personalizada** de acordo com a classificação do IMC.
* Botão para **limpar os campos**.
* Função de **logout** que retorna à tela de login.

---

## 🧱 Arquitetura

A aplicação foi construída utilizando o padrão **MVC (Model-View-Controller)**:

```
lib/
│
├── controllers/     # Controladores responsáveis pela lógica
├── models/          # Modelos de dados (Usuário, IMC)
├── views/           # Telas (Login, Cadastro, Calculadora)
├── database/        # Configuração do banco de dados (SQflite)
├── utils/           # Validações, helpers, constantes
├── styles/          # Definições de cores, textos, tamanhos e temas
└── main.dart        # Inicialização da aplicação
```

---

## 🎨 Estilo Visual

* Estilos (cores, tamanhos, espaçamentos, etc.) definidos em arquivos separados em `lib/styles/`.
* Utilização de **fontes personalizadas** (definidas em `pubspec.yaml`).

---

## 🧠 Validações e Mensagens

* **E-mail**: Formato padrão com `@` e domínio.
* **Senha**: Mínimo de 8 caracteres, contendo **letras e números**.
* Feedback claro ao usuário em caso de erro, como:

  * "E-mail já cadastrado"
  * "Senha inválida"
  * "Campos obrigatórios"

---

## 💾 Persistência de Dados

* Uso de **SQflite** para salvar e consultar dados dos usuários localmente.
* Verificação de e-mail duplicado antes do cadastro.
* Armazenamento de informações persistentes como nome e login.

---

## 🚀 Como Executar

### Pré-requisitos

* Flutter instalado (>= 3.0.0)
* Android Studio ou VSCode com plugins do Flutter
* Emulador ou dispositivo físico

### Passos

```bash
git clone https://github.com/seu-usuario/flutter-imc-app.git
cd flutter-imc-app
flutter pub get
flutter run
```

---

## 🔤 Fontes Personalizadas

A fonte personalizada utilizada está configurada no arquivo `pubspec.yaml` e aplicada globalmente via `ThemeData`.

---

## 📊 Cálculo do IMC

A classificação segue a referência do Hospital Israelita Albert Einstein:

| Classificação      | IMC            | Cor da Mensagem |
| ------------------ | -------------- | --------------- |
| Magreza            | Menor que 18,5 | Azul            |
| Normal             | 18,5 - 24,9    | Verde           |
| Sobrepeso          | 25 - 29,9      | Amarelo         |
| Obesidade Grau I   | 30 - 34,9      | Laranja         |
| Obesidade Grau II  | 35 - 39,9      | Vermelho        |
| Obesidade Grau III | 40 ou mais     | Vermelho Escuro |

---





