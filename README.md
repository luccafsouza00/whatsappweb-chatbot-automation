# 🤖 WhatsAppWeb Chatbot Automation

## 📌 Sobre o Projeto
Este projeto foi criado para interagir de forma automatizada com um **chatbot no WhatsApp**. Ele permite realizar fluxos de conversação do bot, garantindo respostas automatizadas conforme um arquivo JSON de configuração.

## 🚀 Como Funciona
1. **Arquivo JSON de Configuração**
   - O funcionamento do projeto depende de um arquivo JSON.
   - Cada chave do JSON serve apenas como **identificação da interação**.
   - O valor associado a cada chave é uma **lista contendo a pergunta feita pelo chatbot e a resposta automatizada que deve ser enviada**.

2. **Armazenamento da Sessão do WhatsApp**
   - Na **primeira execução**, será necessário escanear o **QR Code do WhatsApp**.
   - Após o login, as credenciais da sessão serão armazenadas de forma automática.

## 📂 Estrutura do Projeto
```
📁 meu-projeto
 ├── 📂 Resources/             # Diretório de recursos
 │   ├── 📂 flows/            # Fluxos onde se orgazina os arquivos json com perguntas e repostas
 │   ├── 📜 base.resource     # Recursos base
 │   ├── 📜 keywords.resource # Palavras-chave de automação
 │   ├── 📜 locators.yaml     # Mapeamento de elementos
 ├── 📂 TestSuite/             # Conjunto de testes
 │   ├── 📜 WhtasApp.robot    # Arquivo de testes do WhatsApp
 ├── 📂 venv/                  # Ambiente virtual
 ├── 📂 logs/                  # Diretório onde são armazenados os logs da execução
 ├── 📜 requirements.txt       # Dependências do projeto
 ├── 📜 README.md              # Documentação do projeto
```

## 🔧 Configuração do Ambiente
### 1️⃣ Criar um ambiente virtual (recomendado)
```bash
python -m venv venv
source venv/bin/activate  # macOS/Linux
venv\Scripts\activate     # Windows
```

### 2️⃣ Instalar dependências
```bash
pip install -r requirements.txt
```

## ▶️ Como Rodar o Projeto
Após configurar o ambiente e definir o arquivo JSON de perguntas e respostas, execute:
```bash
robot -d logs .
```
- O comando **`robot -d logs .`** executa os testes e salva os logs na pasta `logs/`.
- Caso seja a **primeira execução**, será necessário **escanear o QR Code do WhatsApp**.

## 📄 Exemplo de Arquivo JSON (`config.json`)
```json
{
    "disponibilidade": ["Poderia responder no momento?", "Sim"],
    "agendamento": ["Você deseja agendar um horário?", "Sim, para amanhã às 14h"]
}
```

## ⚠️ Observações Importantes
- **O projeto foi desenvolvido em macOS**, então o armazenamento da sessão pode se comportar **de forma diferente em outros sistemas operacionais**.
- Caso tenha problemas ao executar em outro sistema, pode ser necessário ajustar a configuração de armazenamento da sessão.

## 📌 Contribuições
Contribuições são bem-vindas! Sinta-se à vontade para abrir **Issues** e **Pull Requests**. 🚀

## 📜 Licença
Este projeto está sob a licença **MIT**. Sinta-se livre para usá-lo e modificá-lo conforme necessário.

