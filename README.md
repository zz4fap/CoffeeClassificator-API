
# ☕ Classificador de Café com IA (Flutter + Flask + Docker + TFLite)

Este é um app Flutter que utiliza um modelo de Machine Learning integrado a uma API Flask para classificar imagens de grãos de café em cinco categorias distintas. A classificação é realizada com base em três imagens consecutivas, utilizando arquitetura cliente-servidor via API REST.

---

## 🧠 Funcionalidades

- 📸 Captura automática de 3 fotos com a câmera do celular  
- 🤖 Classificação via modelo ConvMixer usando API Flask  
- ✅ Resultado final por votação majoritária  
- 🔗 Comunicação com servidor via rede local (Docker)  
- 🔒 Armazenamento local dos resultados (e opção futura para SQL)  
- 🎨 Interface intuitiva e responsiva  

---

## 🚀 Como utilizar

Você pode:

- ✅ Acesse a seção de releases deste repositório no GitHub. 
- 📦 Baixe o arquivo app-release.apk.
- ✅ Instale em seu dispositivo Android.
---

### 📱 Opção 1: Instalar o app no celular

1. Acesse a seção de Releases deste repositório no GitHub  
2. Baixe o arquivo app-release.apk  
3. Instale em seu dispositivo Android  
4. Permita o acesso à câmera ao abrir o app pela primeira vez  
5. Certifique-se de estar conectado à mesma rede do servidor Flask  

---

## 📱 Tecnologias Utilizadas

- Flutter (Dart)  
- TensorFlow Lite (modelo ConvMixer)  
- Flask (Python)  
- Docker  
- Plugins Flutter:  
  - camera  
  - image_picker  
  - path_provider  
  - permission_handler  


