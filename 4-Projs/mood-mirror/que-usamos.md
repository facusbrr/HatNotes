---
id: que-usamos
aliases: []
tags: []
---

# ¿Qué usamos para construirlo?

- Modelo de clasificación de texto (por ejemplo: TF-IDF + regresión logística,
  o un modelo preentrenado como DistilBERT si querés ir más lejos).
- Dataset de emociones (como Emotion Dataset con +20K entradas)
- Librerías: sklearn, pandas, matplotlib, seaborn, joblib, streamlit o gradio para
  la interfaz.

## Ejemplo de funcionamiento

Entrada del usuario:
“Hoy me siento agotado, como si nada de lo que hago tuviera sentido.”

```json
{
  "emoción": "tristeza",
  "mensaje": "Recuerda que es válido sentirte así. Descansar también es avanzar."
}
```
