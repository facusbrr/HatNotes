---
id: recopilacion
aliases: []
tags: []
---

# Recopilacion Seminario

## Coco SSD

Coco ssd - un proyecto usando TensorFlow.js con el modelo COCO-SSD,
que al principio solo detectaba objetos en imágenes. Lo adaptamos para que ahora
pueda detectar objetos en videos cargados por el usuario, directamente en el navegador
sin necesidad de instalar nada. El diseño lo mejoramos con Bootstrap para que sea
más claro. Técnicamente usamos JavaScript para manejar el video y un canvas donde
dibujamos los cuadros de detección en tiempo real. El modelo reconoce hasta 90 clases
de objetos como personas, autos, animales, bicicletas, etc., y analizamos cada fotograma
usando model.detect(video) mientras el video corre. Todo el procesamiento lo hace
el navegador.

## PoseNet

Es un modelo de inteligencia artificial diseñado para el reconocimiento de poses
humanas a partir de imágenes o videos. Su funcionamiento se basa en la detección
de puntos clave en el cuerpo de un individuo, identificando las articulaciones más
relevantes, como los hombros, codos, muñecas, caderas, rodillas y tobillos. A partir
de estos puntos, PoseNet genera un esqueleto digital, permitiendo visualizar la postura
y el movimiento de la persona en tiempo real.

## MediaPipeFaceDetector

Es un modelo de inteligencia artificial diseñado para la detección de rostros humanos
en imágenes o videos en tiempo real. Su funcionamiento se basa en localizar la cara
dentro del cuadro y extraer puntos clave faciales, como los ojos, la nariz, la boca
y el contorno del rostro. Estos puntos permiten identificar con precisión la ubicación
y orientación de la cara, facilitando tareas como el seguimiento facial, la medición
de distancias entre rasgos y la visualización de regiones específicas del rostro.
Gracias a su eficiencia y velocidad, es ideal para aplicaciones interactivas en la
web y dispositivos móviles.

## Equipo 7: el proyecto trata de posenet

Sirve para identificar y rastrear puntos clave del cuerpo humano (como articulaciones)
en imágenes o videos, ya sea en tiempo real usando la cámara o en archivos cargados,
este proyecto tambien dibuja círculos en los puntos clave y líneas para formar un
esqueleto, permitiendo analizar posturas con dos modelos: Lightning (rápido) o Thunder
(más preciso).

## Clasificador KNN

El modelo modificado es una versión mejorada del clasificador KNN original, adaptado
para un caso de uso específico: la detección de gestos utilizando emojis. Este modelo
utiliza TensorFlow.js y el clasificador KNN, junto con MobileNet para la clasificación
de imágenes.

## DeepLabSegmenter

Es un modelo de inteligencia artificial especializado en la segmentación semántica
de imágenes y video en tiempo real, utilizando la cámara del dispositivo. Su principal
función es analizar cada píxel de la imagen y asignarle una etiqueta de clase, lo
que permite identificar y distinguir objetos y regiones dentro de una escena, como
personas, vehículos, edificios, naturaleza, entre otros. Este sistema se basa en
la arquitectura DeepLab y ofrece compatibilidad con tres modelos preentrenados: Pascal
VOC, Cityscapes y ADE20K, cada uno optimizado para diferentes contextos urbanos,
interiores y escenas generales.

## MobileNetClassifier

Es un modelo de inteligencia artificial especializado en la clasificación de imágenes
y videos, diseñado para ejecutarse directamente en el navegador gracias a TensorFlow.js.
Su principal función es analizar el contenido visual y asignarle etiquetas de clase
con un nivel de probabilidad, permitiendo identificar objetos como animales, herramientas,
alimentos, dispositivos y mucho más. A diferencia de modelos más pesados, MobileNet
optimizado para ser liviano y eficiente, ideal para entornos con recursos limitados
como dispositivos móviles o laptops sin GPU. Nuestra aplicación permite cargar
imágenes o videos desde el dispositivo o mediante una URL, alternando entre ambos
modos con facilidad. En el caso de los videos, el modelo procesa…

## BlazePose

El modelo BlazePose de TensorFlow está diseñado para detección y seguimiento del
cuerpo humano en imágenes o video. Detecta puntos clave (keypoints) que representa
las principales articulaciones y partes del cuerpo, como la cabeza, el cuello, los
hombros, codos, muñecas, dedos, etc.. Se diferencia de otros modelos por la capacidad
de detectar 33 puntos claves (otros modelos solo admiten 17).
Utilizamos el modelo para recrear un juego, que consiste en cortar las frutas que
se muestran en pantalla, al entrar en contacto con las manos.

## Grupo Alonso

Este proyecto es una aplicación web que utiliza TensorFlow.js para detectar rostros
en tiempo real mediante la cámara del usuario. Permite identificar expresiones faciales
como sonrisa, guiño, ojos cerrados y hablar, además de detectar la rotación de
la cabeza.. Se utiliza el modelo MediaPipeFaceMesh de TensorFlow para obtener puntos
clave del rostro. Los resultados se visualizan sobre un canvas superpuesto al video
en vivo. El número de rostros detectados se actualiza en tiempo real junto con los
indicadores visuales de ojos y emociones.

## BodyPix

Este proyecto es una aplicación web interactiva que utiliza el modelo BodyPix de
TensorFlow.js para segmentar personas en imágenes, videos y la cámara web en tiempo
real. Permite al usuario seleccionar entre usar la webcam, cargar una imagen o un
video, y muestra el resultado segmentado en un canvas, resaltando la figura humana
sobre el fondo original. Todo el procesamiento se realiza en el navegador, sin necesidad
de servidores externos.

## PoseNett

Este proyecto hace uso de PoseNet, un modelo de inteligencia artificial capaz de
identificar posturas humanas a partir de imágenes o secuencias de video. Su tarea
principal consiste en localizar puntos específicos del cuerpo como las articulaciones
de hombros, codos, muñecas, caderas, rodillas y tobillos y, a partir de ellos, construir
una representación digital del esqueleto. Esto permite interpretar y mostrar en tiempo
real la posición y el movimiento de una persona.

## Speech Command

Speech Commands es un modelo de inteligencia artificial diseñado para reconocer comandos
de voz simples en tiempo real. Funciona capturando audio a través del micrófono y
convirtiéndolo en un espectrograma, una representación visual del sonido. Luego,
una red neuronal analiza ese espectrograma para identificar palabras clave como
"yes", "no", "stop" o "go". Esto permite controlar aplicaciones con la voz desde
el navegador, sin necesidad de servidores externos.

## MediaPipeHands

El modelo MediaPipe Hands de TensorFlow permite detectar y rastrear manos
humanas en imágenes o video en tiempo real. Reconoce hasta 21 puntos clave
por mano, incluyendo la palma y cada articulación de los dedos, lo que permite
identificar gestos con gran precisión. A diferencia de modelos más simples,
puede seguir una o ambas manos incluso en movimiento o parcialmente ocultas.

## Face Landmarks Detection

Este proyecto es una aplicación web que utiliza TensorFlow.js para detectar rostros
en tiempo real mediante la cámara del usuario. Permite identificar expresiones faciales
como sonrisa, guiño, ojos cerrados y hablar, además de detectar la rotación de
la cabeza..Se utiliza el modelo MediaPipeFaceMesh de TensorFlow para obtener puntos
clave del rostro. Los resultados se visualizan sobre un canvas superpuesto al video
en vivo. El número de rostros detectados se actualiza en tiempo real junto con los
indicadores visuales de ojos y emociones.

## Question and Answer

El sistema desarrollado es una aplicación web interactiva que permite realizar
preguntas en lenguaje natural, en español, sobre un texto cargado por el usuario,
y obtener respuestas automáticas generadas por un modelo de inteligencia artificial.
Este modelo se basa en tecnologías avanzadas de Procesamiento de Lenguaje Natural
(PLN) y se ejecuta completamente en el navegador.

## Universal Sentence Encoder

El proyecto consiste en una interfaz de preguntas y respuestas (Q&A).
Utiliza el modelo pre entrenado Universal Sentence Encoder (USE). Este
modelo transforma oraciones en vectores numéricos de 512 dimensiones,
capturando su significado semántico. Permite procesar un dataset textual
con pares de preguntas y respuestas sobre el libro de tensorflow en forma de
embeddings. Al realizar una consulta, su vector se compara con los existentes
devolviendo los más similares.
