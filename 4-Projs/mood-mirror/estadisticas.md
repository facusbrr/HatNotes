---
id: estadisticas
aliases: []
tags: []
---

# Classification Report

| Clase            | precision | recall | f1‑score | support |
| :--------------- | :-------: | :----: | :------: | :-----: |
| **anger**        |   0.90    |  0.82  |   0.86   |   275   |
| **fear**         |   0.89    |  0.79  |   0.84   |   224   |
| **joy**          |   0.84    |  0.96  |   0.89   |   695   |
| **love**         |   0.82    |  0.59  |   0.69   |   159   |
| **sadness**      |   0.90    |  0.93  |   0.91   |   581   |
| **surprise**     |   0.85    |  0.52  |   0.64   |   66    |
| **accuracy**     |           |        |   0.87   |  2000   |
| **macro avg**    |   0.87    |  0.77  |   0.81   |  2000   |
| **weighted avg** |   0.87    |  0.87  |   0.86   |  2000   |

- Support: número de ejemplos reales de cada clase (por ejemplo, joy tiene 695 instancias).

- Precision (VP/(VP+FP)): de todas las predicciones que el modelo etiquetó como
  “anger”, el 90 % realmente lo eran.

- Recall (VP/(VP+FN)): de todas las instancias reales de “anger”, el modelo detectó
  el 82 %.

- F1‑score (media armónica): balance entre precision y recall; útil cuando hay desbalance.

## Observaciones clases

- joy: recall muy alto (0.96) → casi no pierde casos de alegría, pero precision
  algo menor (0.84) indica que confunde alegría con otras categorías en algunos casos.

- sadness: tanto precision (0.90) como recall (0.93) excelentes → clase muy bien
  aprendida.

- anger/fear: buenos valores (~0.90/0.80), el modelo distingue bien el enojo y el
  miedo.

- love y surprise: recall bajos (0.59 y 0.52) → el modelo pierde muchos ejemplos
  reales de esas dos clases (los confunde como otras emociones); podrías recopilar
  más datos o ajustar pesos para estas clases minoritarias (solo 159 y 66 ejemplos).

- Accuracy general: 87 % de las 2 000 predicciones fueron correctas.

- Macro avg: media simple de métricas por clase (útil para ver el desempeño sin
  ponderar por support).

- Weighted avg: media ponderada por support, coincide con accuracy global en este
  caso.

## Matriz de Confusión

Cada celda (i, j) muestra cuántas veces una clase real i fue predicha como clase
j:

- Diagonal principal (en azul oscuro) = verdaderos positivos de cada clase:
  - joy: 665 aciertos
  - sadness: 541 aciertos
  …

  Fuera de la diagonal = errores:

- En “love” (fila 4), 55 ejemplos reales de amor fueron clasificados como “joy”
  → explica el bajo recall en love.
- En “surprise” (fila 6), 12 casos reales de “surprise” se clasificaron como
  “fear” y 16 como “joy” → indica confusión con esas clases.
- En “anger” (fila 1), 23 casos reales de enojo fueron etiquetados como “sadness”.

## ¿Por qué importa?

Te muestra dónde el modelo se confunde con más frecuencia.

- Permite orientar acciones de mejora: por ejemplo, si love se confunde con joy,
  tal vez debas añadir ejemplos más claros de “love” o usar técnicas de aumento
  de datos (data augmentation).

- Detectas clases minoritarias con bajo rendimiento: surprise tiene sólo 34 TP y
  32 FN+FP = baja detección.
