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

### Descripción de los datos
Una base de datos con información sobre viajes en taxi en Chicago:

- tabla `neighborhoods`: datos sobre los barrios de la ciudad

  - name: nombre del barrio
  - neighborhood_id: código del barrio

- tabla `cabs`: datos sobre los taxis

  - cab_id: código del vehículo
  - vehicle_id: ID técnico del vehículo
  - company_name: la empresa propietaria del vehículo

- tabla `trips`: datos sobre los viajes

  - trip_id: código del viaje
  - cab_id: código del vehículo que opera el viaje
  - start_ts: fecha y hora del inicio del viaje (tiempo redondeado a la hora)
  - end_ts: fecha y hora de finalización del viaje (tiempo redondeado a la hora)
  - duration_seconds: duración del viaje en segundos
  - distance_miles: distancia del viaje en millas
  - pickup_location_id: código del barrio de recogida
  - dropoff_location_id: código del barrio de finalización

- tabla `weather_records`: datos sobre el clima

  - record_id: código del registro meteorológico
  - ts: fecha y hora del registro (tiempo redondeado a la hora)
  - temperature: temperatura cuando se tomó el registro
  - description: breve descripción de las condiciones meteorológicas, por ejemplo, "lluvia ligera" o "nubes dispersas"

### Esquema de la tabla
`diagrama_er.png`

----------
## Instrucciones para el proyecto
- **Paso 1. Escribe un código para analizar los datos sobre el clima en Chicago en noviembre de 2017 desde el sitio web (Python)**
    https://practicum-content.s3.us-west-1.amazonaws.com/data-analyst-eng/moved_chicago_weather_2017.html
- **Paso 2. Análisis exploratorio de datos (SQL)**
  - Encuentra el número de viajes en taxi para cada empresa de taxis del 15 al 16 de noviembre de 2017. Nombra el campo resultante trips_amount y muéstralo junto con el campo company_name. Ordena los resultados por el campo trips_amount en orden descendente.
  - Encuentra la cantidad de viajes para cada empresa de taxis cuyo nombre contenga las palabras "Yellow" o "Blue" del 1 al 7 de noviembre de 2017. Nombra la variable resultante trips_amount. Agrupa los resultados por el campo company_name.
  - En noviembre de 2017 las empresas de taxis más populares fueron Flash Cab y Taxi Affiliation Services. Encuentra el número de viajes de estas dos empresas y asigna a la variable resultante el nombre trips_amount. Junta los viajes de todas las demás empresas en el grupo "Other". Agrupa los datos por nombres de empresas de taxis. Nombra el campo con nombres de empresas de taxis company. Ordena el resultado en orden descendente por trips_amount.
- **Paso 3. Prueba la hipótesis de que la duración de los viajes desde el Loop hasta el Aeropuerto Internacional O'Hare cambia los sábados lluviosos.**
  - Recupera los identificadores de los barrios de O'Hare y Loop de la tabla neighborhoods.
  - Para cada hora recupera los registros de condiciones meteorológicas de la tabla weather_records. Usando el operador CASE, divide todas las horas en dos grupos: "Bad" si el campo description contiene las palabras "rain" o "storm" y "Good" para los demás. Nombra el campo resultante weather_conditions. La tabla final debe incluir dos campos: fecha y hora (ts) y weather_conditions.
- Recupera de la tabla trips todos los viajes que comenzaron en el Loop (neighborhood_id: 50) y finalizaron en O'Hare (neighborhood_id: 63) un sábado. Obtén las condiciones climáticas para cada viaje. Utiliza el método que aplicaste en la tarea anterior. Recupera también la duración de cada viaje.
- Ignora los viajes para los que no hay datos disponibles sobre las condiciones climáticas.
- **Paso 4. Análisis exploratorio de datos (Python)**
Además de los datos que recuperaste en las tareas anteriores te han dado un segundo archivo. Ahora tienes estos dos CSV:

  - `project_sql_result_01.csv`. Contiene los siguientes datos:

    - company_name: nombre de la empresa de taxis
    - trips_amount: el número de viajes de cada compañía de taxis el 15 y 16 de noviembre de 2017.
  - `project_sql_result_04.csv`. Contiene los siguientes datos:
    - dropoff_location_name: barrios de Chicago donde finalizaron los viajes
    - average_trips: el promedio de viajes que terminaron en cada barrio en noviembre de 2017.

Para estos dos datasets ahora necesitas:
- identificar los 10 principales barrios en términos de finalización
- hacer gráficos: empresas de taxis y número de viajes, los 10 barrios principales por número de finalizaciones

- **Paso 5. Prueba de hipótesis (Python)**

  - `project_sql_result_07.csv': el resultado de la última consulta. Contiene datos sobre viajes desde el Loop hasta el Aeropuerto Internacional O'Hare. Recuerda, estos son los valores de campo de la tabla:

    - start_ts: fecha y hora de recogida
    - weather_conditions: condiciones climáticas en el momento en el que comenzó el viaje
    - duration_seconds: duración del viaje en segundos


Prueba la hipótesis:
"La duración promedio de los viajes desde el Loop hasta el Aeropuerto Internacional O'Hare cambia los sábados lluviosos".

Establece el valor del nivel de significación (alfa) por tu cuenta.

Explica:
- cómo planteaste las hipótesis nula y alternativa
- qué criterio usaste para probar las hipótesis y por qué

-------

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
