from flask import Flask, request, jsonify
from tensorflow.keras.preprocessing import image
from tensorflow.keras.models import load_model
import numpy as np
import os

app = Flask(__name__)

# Carregar o modelo treinado
model = load_model('my_model.h5')

# Dicionário de classes
labels = {
    0: 'verde',
    1: 'semi-maduro',
    2: 'maduro',
    3: 'passa',
    4: 'seco'
}

def classificar_imagem(file):
    try:
        # Carrega a imagem diretamente do arquivo recebido
        img = image.load_img(file, target_size=(256, 256))
        img_array = image.img_to_array(img)
        img_array = np.expand_dims(img_array, axis=0)
        img_array /= 255.0

        # Predição
        predicao = model.predict(img_array)
        classe_prevista = int(np.argmax(predicao, axis=1))

        return {
            "classe_id": classe_prevista,
            "classe_nome": labels[classe_prevista],
            "probabilidades": predicao[0].tolist()
        }

    except Exception as e:
        return {"erro": str(e)}

@app.route('/classificar', methods=['POST'])
def classificar():
    if 'imagem' not in request.files:
        return jsonify({"erro": "Arquivo de imagem não encontrado na requisição."}), 400

    imagem = request.files['imagem']
    resultado = classificar_imagem(imagem)

    if "erro" in resultado:
        return jsonify(resultado), 500

    return jsonify(resultado)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)