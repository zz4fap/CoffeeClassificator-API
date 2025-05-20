☕ Classificador de Café com IA (Flutter + Flask + Docker + TFLite)
Este é um app Flutter que utiliza um modelo de Machine Learning integrado a uma API Flask para classificar imagens de grãos de café em cinco categorias distintas. A classificação é realizada com base em três imagens consecutivas, utilizando arquitetura cliente-servidor via API REST.

🧠 Funcionalidades
📸 Captura automática de 3 fotos com a câmera do celular.

🤖 Classificação via modelo ConvMixer usando API Flask.

✅ Resultado final por votação majoritária.

🔗 Comunicação com servidor via rede local (Docker).

🔒 Armazenamento local dos resultados (e opção futura para SQL).

🎨 Interface intuitiva e responsiva.

📂 Estrutura
bash
Copiar
Editar
/app (Flutter)
├── lib/
│   ├── main.dart
│   ├── splash_screen.dart
│   ├── transicao_page.dart
│   ├── classificador_page.dart
│   └── api.dart
├── assets/
│   ├── labels.txt
│   └── ícones, imagens, fontes...

/backend (Flask + Docker)
├── app.py
├── model.tflite
├── Dockerfile
└── requirements.txt
🚀 Como utilizar
Você pode:

✅ Baixar o APK pronto e instalar no seu dispositivo Android
📦 Ou rodar o projeto completo localmente com API Flask e o app Flutter

📱 Opção 1: Instalar o app no celular
Acesse a seção de releases deste repositório no GitHub.

Baixe o arquivo app-release.apk.

Instale em seu dispositivo Android.

Certifique-se de que o celular esteja na mesma rede que o servidor Flask.

O app solicitará permissão de câmera ao abrir pela primeira vez.

🧪 Opção 2: Rodar localmente
Clone o repositório:

bash
Copiar
Editar
git clone https://github.com/seu-usuario/classificador_cafe_flutter.git
cd classificador_cafe_flutter
Suba o servidor Flask com Docker:

bash
Copiar
Editar
cd backend
docker build -t classificador-api .
docker run -p 5000:5000 classificador-api
Configure o IP da API no arquivo lib/api.dart dentro da pasta /app com o IP da máquina onde está rodando o Docker.

Conecte seu celular por USB (modo desenvolvedor ativado):

bash
Copiar
Editar
cd ../app
flutter pub get
flutter run
📱 Tecnologias Utilizadas
Flutter (Dart)

TensorFlow Lite (modelo ConvMixer)

Flask (Python)

Docker

Plugins Flutter: camera, image_picker, path_provider, permission_handler
