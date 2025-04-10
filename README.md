# API de Classificação de Frutos do Café ☕

Esta API utiliza um modelo de deep learning para classificar imagens de frutos do café em diferentes estágios de maturação.

## 🚀 Como usar

### Pré-requisitos

- Python 3.9+
- Docker (opcional para containerização)
- Arquivo do modelo `my_model.h5` (coloque na mesma pasta)

### 📦 Instalar dependências

```bash
pip install -r requirements.txt
```

### ▶️ Executar localmente

```bash
python app.py
```

### 🐳 Usar com Docker

```bash
docker build -t classificador-flask .
docker run -d -p 5000:5000 classificador-flask
```

### 📤 Enviar imagem

Você pode testar com [Postman](https://www.postman.com/) ou `curl`:

```bash
curl -X POST -F imagem=@sua_imagem.jpg http://localhost:5000/classificar
```

### 🔁 Resposta esperada

```json
{
  "classe_id": 2,
  "classe_nome": "maduro",
  "probabilidades": [0.01, 0.05, 0.89, 0.03, 0.02]
}
```

---