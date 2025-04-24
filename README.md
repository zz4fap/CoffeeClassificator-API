# ☕ Classificador de Café com IA (Flutter + TFLite)

Este é um app Flutter que usa um modelo de Machine Learning (TFLite) embarcado para classificar imagens de frutos de café em cinco categorias de maturação: `unripe`, `semi_ripe`, `ripe`, `overripe` e `dry`.

---

## 🧠 Funcionalidades

- 📸 Captura automática de 3 fotos com intervalo de 2 segundos.
- 🤖 Classificação com modelo TensorFlow Lite embarcado.
- ✅ Resultado com a classe mais frequente entre as 3 capturas.
- 🎨 Interface simples, direta e leve.
- 🔐 Permissões automáticas para uso de câmera.

---

## 📂 Estrutura

```
lib/
├── main.dart
├── splash_screen.dart
├── transicao_page.dart
└── classificador_page.dart

assets/
├── modelo.tflite
└── labels.txt
```

---

## 🚀 Como rodar

1. Clone o repositório:

```bash
git clone https://github.com/seu-usuario/classificador_cafe_flutter_embarcado.git
cd classificador_cafe_flutter_embarcado
```

2. Instale as dependências:

```bash
flutter pub get
```

3. Rode no dispositivo ou emulador físico (com câmera):

```bash
flutter run
```

4. Para gerar o APK:

```bash
flutter build apk
```

> ⚠️ O app usa câmera nativa, então é melhor rodar em um celular ou emulador com suporte à câmera (como Genymotion com webcam ativada).

---

## 📱 Tecnologias Utilizadas

- Flutter (Dart)
- TensorFlow Lite (via plugin tflite)
- camera
- permission_handler
- image_picker
- Lottie (animações)

---

## 📸 Prints (adicione os seus aqui)

<img src="prints/screenshot1.png" width="200" /> <img src="prints/screenshot2.png" width="200" />

---

## 📜 Licença

Este projeto é livre para uso educacional. Para usos comerciais ou integração em sistemas proprietários, entre em contato.

---

Desenvolvido com ☕ por [Seu Nome](https://github.com/seu-usuario)