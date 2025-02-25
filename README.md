# SQLProject-withPython

## 📌 Análisis de Datos para Zuber: Impacto del Clima y Preferencias de los Pasajeros

### 📖 Descripción del proyecto:
En este proyecto, Zuber, una nueva empresa de viajes compartidos en Chicago, busca analizar patrones en los datos de sus competidores para comprender mejor las preferencias de los pasajeros y el impacto de factores externos en los viajes. Se exploraron datos sobre compañías de taxis, frecuencia de viajes, destinos más populares y la influencia del clima en la duración de los recorridos.

### 🎯 Objetivo del proyecto:
El objetivo principal es analizar los datos históricos de viajes en taxi en Chicago para:

- Identificar las empresas de taxis con mayor cantidad de viajes.
- Determinar los barrios con mayor número de llegadas de taxis.
- Evaluar el impacto del clima en la duración de los viajes.
- Probar la hipótesis de si los sábados lluviosos afectan significativamente la duración de los trayectos.

### 📊 Conclusiones finales:
- Barrios más populares: El barrio Loop fue el destino más frecuente con un promedio de 10,727 viajes. La diferencia en la cantidad de viajes con el siguiente barrio (River North) fue de más de 1,200 viajes.
- Empresas líderes en viajes: Flash Cab lideró con aproximadamente 20,000 viajes en dos días. Taxi Affiliation Services ocupó el segundo lugar con 11,422 viajes.
- Impacto del clima en los viajes: Se realizó una prueba de hipótesis para evaluar si la duración de los viajes varía en sábados lluviosos.
  - La prueba de Levene mostró que las varianzas eran similares (p-valor = 0.98).
  - La prueba t de Student reveló una diferencia significativa (t = 5.43, p < 0.0000001), rechazando la hipótesis nula y confirmando que los sábados lluviosos afectan la duración de los viajes.

#### Conclusión general:

- El clima tiene un impacto significativo en la duración de los viajes, lo que podría afectar la planificación de recursos para Zuber.
- La competencia en el sector de taxis sigue siendo fuerte, con empresas tradicionales aún dominando el mercado.

## 🛠️ Skills obtenidas:
- Análisis exploratorio de datos con pandas y seaborn.
- Manejo y limpieza de datos, incluyendo tratamiento de valores nulos y duplicados.
- Consultas SQL para extraer y analizar información de bases de datos relacionales.
- Pruebas de hipótesis con scipy.stats (prueba de Levene y prueba t de Student).
- Visualización de datos con matplotlib y plotly.

## 🎓 Lecciones aprendidas:
- Importancia del preprocesamiento de datos: La limpieza y validación de datos son cruciales antes del análisis.
- Impacto del clima en la movilidad urbana: Las condiciones meteorológicas influyen directamente en la duración de los viajes, lo que puede afectar la demanda y logística de transporte.
- Uso de pruebas estadísticas en la toma de decisiones: Aplicar pruebas de hipótesis permite validar supuestos con evidencia numérica en vez de simples observaciones.
