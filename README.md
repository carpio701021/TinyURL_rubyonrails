# Supuestos

## Requerimientos funcionales:

- Dada una URL, nuestro servicio debe generar un alias más corto y único. Esto se llama un enlace corto. `http://localhost:3000/tinyurls`

- Cuando los usuarios acceden a un enlace corto, nuestro servicio debería redirigirlos al enlace original. `http://localhost:3000/<enlace corto>`

- Los usuarios, opcionalmente, deberían poder elegir un enlace corto personalizado para sus URL. `Campo abierto para poder ser editado (validado por si hay repetidos)`

- Los enlaces caducarán después de un intervalo de tiempo predeterminado estándar. Los usuarios deben poder especificar el tiempo de caducidad. `El tiempo predeterminado es de 5 días después. Validacion de url expirada.`

## Requerimientos no funcionales:

- La redirección de URL debería ocurrir en tiempo real con una latencia mínima. `La condición está en el redirect. Me hubiera gustado usar redis para mantener en cache las urls pero por tiempo ya no lo implementé`
- Los enlaces acortados no deben ser adivinables (no predecibles).

## Requisitos extendidos (puntos extra):

- Analítica; Por ejemplo, ¿cuántas veces sucedió una redirección? `Incluido contador de redirecciones`
- Nuestro servicio también debe ser accesible a través de una simple API REST (sin autenticación) por otros servicios. `Rails expone los servicios RESTful de forma predeterminada para poder ser consumidos como API.`

