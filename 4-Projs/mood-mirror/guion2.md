---
id: guion2
aliases: []
tags: []
---

# Introducción

Es una aplicación que puede detectar emociones en un texto que escribe el usuario
como si fuera una entrada de diario personal—, y responde con una emoción dominante
y un nivel de confianza.

## ¿Qué resuelve Mood-Mirror?

Muchas veces, cuando escribimos cómo nos sentimos, no siempre es fácil ponerle
un nombre a esa emoción.

Mood-Mirror intenta resolver eso usando inteligencia artificial. A partir de lo que
escribís, el modelo detecta si estás alegre, triste, enojado, con miedo, sorprendido
o si sentís amor.

## ¿Cómo funciona?

📌 1. Dataset

Usamos un dataset real disponible en Kaggle, con más de 20.000 textos cortos ya
etiquetados con una emoción.

Dividimos ese dataset en tres partes:

- Entrenamiento (train): 80 %
- Validación (val): 10 %
- Test final (test): 10 %

## Preprocesamiento (TF‑IDF)

Como los modelos no entienden texto directamente, usamos una técnica llamada
TF‑IDF:

- Cuenta cuántas veces aparece cada palabra (TF)
- Le resta importancia a las palabras comunes (IDF)
- Y con eso genera una representación numérica de cada texto
- Es como convertir una frase en una lista de números que el modelo sí puede procesar.

## Entrenamiento del modelo

Con esas representaciones, entrenamos un modelo de clasificación llamado Regresión
Logística, que aprendió a asociar patrones de palabras con emociones.

Luego, lo validamos con el conjunto val y guardamos el modelo entrenado y el vectorizador
con joblib.

## Evaluación

Usamos el conjunto test para medir el desempeño real del modelo, y obtuvimos:

- Precisión general: 87 %
- F1-score alto para clases como joy y sadness
- Un poco más de dificultad para emociones con menos datos como love y surprise
- También generamos una matriz de confusión para ver exactamente en qué se confunde
  el modelo.

## Servidor FastAPI

Para exponer el modelo, creamos una API REST con FastAPI.
Esta API tiene un único endpoint /predict, que:

- Recibe un texto en formato JSON
- Lo transforma con TF‑IDF
- Lo pasa por el modelo
- Y devuelve la emoción detectada junto con una probabilidad de confianza

## Conclusión

Mood-Mirror es un proyecto simple, pero poderoso: con solo unas líneas de texto,
puede darte una idea de cómo te sentís, usando técnicas de procesamiento de lenguaje
natural y machine learning.

Como próximos pasos me gustaría:

- Mejorar la detección de emociones minoritarias
- Hacer una interfaz visual con Streamlit
- Permitir guardar entradas y hacer un seguimiento emocional con el tiempo

🙋 Preguntas posibles

- ¿Qué es TF‑IDF? Técnica para representar texto como números, basada en
  frecuencia de palabras.

- ¿Por qué regresión logística? Es simple, rápida, y funciona bien con este
  tipo de tareas de clasificación.

- ¿Qué pasa si no hay suficientes datos para una emoción? El modelo la predice
  con menor precisión. Se puede mejorar con más datos o técnicas como class_weight.

- ¿Qué harías distinto si tuvieras más tiempo? Probar modelos como RandomForest,
  XGBoost o incluso una red neuronal (LSTM o Transformers).
