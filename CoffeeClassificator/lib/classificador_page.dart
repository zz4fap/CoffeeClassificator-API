import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'package:collection/collection.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class ClassificadorPage extends StatefulWidget {
  const ClassificadorPage({super.key});

  @override
  State<ClassificadorPage> createState() => _ClassificadorPageState();
}

class _ClassificadorPageState extends State<ClassificadorPage> {
  List<CameraDescription> cameras = [];
  CameraController? _cameraController;
  List<String> resultados = [];
  bool carregando = false;

  @override
  void initState() {
    super.initState();
    initCamera();
    carregarModelo();
  }

  Future<void> carregarModelo() async {
    await Tflite.loadModel(
      model: "assets/modelo.tflite",
      labels: "assets/labels.txt",
    );
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
      await _cameraController!.initialize();
      setState(() {}); // atualiza a interface após inicializar
    }
  }

  Future<bool> solicitarPermissaoCamera() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      status = await Permission.camera.request();
    }
    return status.isGranted;
  }

  Future<void> tirarFotosEClassificar() async {
    final temPermissao = await solicitarPermissaoCamera();
    if (!temPermissao || _cameraController == null || !_cameraController!.value.isInitialized) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Permissão ou inicialização da câmera falhou.")),
      );
      return;
    }

    resultados.clear();
    setState(() => carregando = true);

    for (int i = 0; i < 3; i++) {
      final Directory dir = await getTemporaryDirectory();
      final String caminho = path.join(dir.path, 'foto_$i.jpg');
      await _cameraController!.takePicture().then((XFile file) async {
        final File foto = File(file.path);
        final output = await Tflite.runModelOnImage(
          path: foto.path,
          numResults: 1,
          threshold: 0.5,
        );
        if (output != null && output.isNotEmpty) {
          resultados.add(output[0]['label']);
        }
      });

      await Future.delayed(const Duration(seconds: 2)); // pausa entre as fotos
    }

    setState(() => carregando = false);
    mostrarResultado();
  }

  void mostrarResultado() {
    final frequente = resultados.isEmpty
        ? "Nenhuma imagem classificada"
        : resultados.groupListsBy((e) => e).entries
            .reduce((a, b) => a.value.length >= b.value.length ? a : b)
            .key;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Resultado"),
        content: Text("Classe mais frequente: $frequente"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    Tflite.close();
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Classificador de Café"),
      ),
      body: Center(
        child: carregando
            ? const CircularProgressIndicator()
            : _cameraController != null && _cameraController!.value.isInitialized
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: CameraPreview(_cameraController!),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: tirarFotosEClassificar,
                        child: const Text("Classificar Café"),
                      ),
                    ],
                  )
                : const Text("Inicializando câmera..."),
      ),
    );
  }
}
