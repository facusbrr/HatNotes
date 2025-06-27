---
id: guion-ultimo
aliases: []
tags: []
---

# Proyecto Mood-Mirror: Clasificación de emociones

## Introducción

Mood-Mirror es una aplicación desarrollada en Python que detecta la
**emoción principal** de un texto escrito por un usuario, como si fuera una
entrada de diario. Utiliza procesamiento de lenguaje natural (NLP) y Machine
Learning para predecir emociones como `joy`, `sadness`, `anger`, `love`,
`sorpresa` o `fear`.

---

## Objetivo del proyecto

El objetivo principal es aplicar un modelo de Machine Learning capaz de:

- Detectar la emoción dominante en un texto.
- Responder con un mensaje personalizado.
- Prepararse para integrarse con una API y un cliente.

---

## Datos utilizados

Se utilizó un dataset con más de **20.000 ejemplos etiquetados** con emociones.
Estos fueron divididos en tres partes:

- `train.txt` (80%): para entrenar el modelo.
- `val.txt` (10%): para ajustar hiperparámetros.
- `test.txt` (10%): para evaluar el rendimiento real.

Esta división es fundamental porque:

- `train`: el modelo aprende patrones.
- `val`: se prueba mientras aprende (para evitar sobreajuste).
- `test`: prueba final con ejemplos que nunca vio.

---

## NLP: Procesamiento de Lenguaje Natural

**NLP (Natural Language Processing)** es una rama de la inteligencia artificial
que se ocupa de entender, interpretar y generar lenguaje humano con ayuda de
algoritmos y modelos matemáticos.

En este proyecto usamos:

- **TF-IDF**: para convertir palabras en números.
- **Regresión logística**: para clasificar la emoción entre 6 clases posibles.

---

## Preprocesamiento y entrenamiento

Usamos `TfidfVectorizer` para transformar los textos en vectores numéricos:

```python
train_df = pd.read_csv("../data/train.txt", sep=";", header=None,
                       names=["text", "emotion"])
tfidf = TfidfVectorizer(max_features=5000)
X_train = tfidf.fit_transform(train_df["text"])
y_train = train_df["emotion"]
```

- `fit_transform` entrena el vectorizador con el texto.
- Se limita a las 5.000 palabras más representativas.

---

## Modelo de clasificación

Se entrenó un modelo de regresión logística para predecir la emoción:

```python
from sklearn.linear_model import LogisticRegression
model = LogisticRegression()
model.fit(X_train, y_train)
```

---

## Evaluación del modelo

Se evaluó con el conjunto `test`:

```python
from sklearn.metrics import classification_report
print(classification_report(y_test, y_pred_test))
```

Este informe muestra:

- **Precision**: ¡cuántas predicciones fueron correctas!
- **Recall**: ¡cuántos casos reales detectó!
- **F1-score**: promedio entre precision y recall.
- **Accuracy general**: en este caso fue del 86%.

### 🔹 Interpretación del informe

Ejemplo para `joy`:

- Precision: 0.85 → de las veces que el modelo predijo "joy", acertó el 85%.
- Recall: 0.94 → detectó el 94% de todos los textos realmente etiquetados como "joy".
- F1-score: 0.89 → balance entre precisión y recall.

En general:

- Alto rendimiento en `joy` y `sadness`.
- Dificultades para `love` y `surprise` (menos datos).

---

## Matriz de confusión

Una matriz de confusión nos permite ver en qué clases se confunde el modelo.

- Las **filas** representan la clase **real**.
- Las **columnas** representan la clase **predicha**.
- Las celdas contienen la cantidad de ejemplos.

### 🔹 Ejemplo

- `joy` vs `joy`: 665 aciertos.
- `love` vs `joy`: 55 errores (confusión frecuente).
- `surprise` fue confundido con `joy` y `fear`.

Un cuadrado oscuro en la diagonal → aciertos. Los errores aparecen fuera de ella.

---

## Servidor API con FastAPI

Creamos una API con FastAPI para exponer el modelo:

```python
@app.post("/predict")
def predict_emotion(payload: TextIn):
    X = tfidf.transform([payload.text])
    probs = model.predict_proba(X)[0]
    idx = probs.argmax()
    emotion = model.classes_[idx]
    confidence = float(probs[idx])
    return {"emotion": emotion, "confidence": confidence}
```

Este endpoint recibe un texto y devuelve:

- `emotion`: la clase más probable.
- `confidence`: la probabilidad de esa predicción.

---

## Archivos y estructura del proyecto

```
mood-mirror/
├── train/                  # Notebook con el modelo
├── models/                # Archivos .pkl (modelo y vectorizador)
├── data/                  # train.txt, val.txt, test.txt
├── api.py                 # Servidor FastAPI
├── requirements.txt       # Dependencias
└── README.md              # Documentación
```

---

## Conclusión y próximos pasos

Este proyecto demuestra cómo usar Machine Learning y NLP para detectar
emociones.

Próximos pasos:

- Crear una interfaz visual (Streamlit).
- Visualizar emociones por día o semana.
- Usar modelos más avanzados (Transformers).

---
