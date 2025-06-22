---
id: guion
aliases: []
tags: []
---

# Guion

## Apertura amigable

“Hola a todos, soy [tu nombre], y hoy les voy a contar sobre Mood‑Mirror,
una pequeña aplicación en Python que ayuda a identificar cómo te sientes con solo
escribir unas pocas líneas de tu diario.”

## El desafío

¿Alguna vez te pasó que escribís en tu diario y, después de un rato, no sabés
si tu texto refleja más tristeza, alegría o enojo? La idea de Mood‑Mirror es
justamente ponerle un poquito de ciencia a ese proceso: que una máquina te diga
qué emoción predomina en tu escrito y te dé un mensaje alentador.”

## Datos y preparación

Para entrenar al modelo usamos un dataset público de Kaggle con miles de
entradas etiquetadas con emociones como ‘joy’, ‘sadness’, ‘anger’, etc.
Dividimos esos datos en tres partes:

- Train (80 % de los datos): para enseñarle al modelo.
- Val (10 %): para ajustar detalles.
- Test (10 %): para ver qué tan bien funciona, con datos que nunca vio.

## Cómo convertimos texto en números (TF‑IDF)

Las computadoras no entienden palabras, solo números. Así que usamos TF‑IDF:

- TF cuenta cuántas veces aparece cada palabra en tu frase.
- IDF hace que las palabras muy comunes tengan menos importancia.
- El resultado es un vector numérico para cada frase, que el modelo puede procesar.

## Entrenamiento del modelo

Con esos vectores entrenamos una regresión logística, que básicamente aprende
a trazar una frontera entre clases de emociones. Le mostramos ejemplos de frases
marcadas con ‘joy’, ‘sadness’, etc., y él aprende los patrones de palabras que
distinguen cada emoción.

## Evaluación

Probamos el modelo en el conjunto de test y obtuvimos alrededor de un 87 % de accuracy.

- Para emociones como ‘joy’ o ‘sadness’ el modelo acierta más del 90 % de las veces.
- Para ‘love’ y ‘surprise’, que tienen menos ejemplos, acierta menos (alrededor
  de 60 %).
- La matriz de confusión nos ayudó a ver exactamente en qué se equivoca: por ejemplo,
  a veces confunde ‘love’ con ‘joy’.”

## Predicción en vivo

Después guardamos el modelo y el vectorizador en archivos (.pkl) para no
tener que reentrenar cada vez. Esto nos permite exponerlo en una API (con FastAPI)
y luego crear un cliente sencillo (por ejemplo, con Streamlit) donde el usuario pega
su texto y recibe:

- La emoción detectada.
- Un mensaje de ánimo o reflexión.
- Un gráfico de cómo ha variado su estado de ánimo si guarda varias entradas.”

### Ejemplo práctico

Supongamos que yo escribo:

Hoy tuve un día difícil, me siento agotado y un poco frustrado.

- El sistema analiza el texto, lo convierte en vectores, y devuelve:
- Emoción: tristeza
- Mensaje: ‘Es normal sentirse así después de un día duro. Date un respiro y
  recuerda lo que lograste.’

## Conclusión y próximos pasos

Mood‑Mirror es un primer paso para aplicar NLP y Machine Learning
a algo tan personal como un diario.

- Aumentar datos de emociones menos frecuentes (‘love’, ‘surprise’).
- Integrar la API y el cliente web móvil.
- Explorar modelos más avanzados (por ejemplo, una red neuronal ligera basada en
  Transformers).
