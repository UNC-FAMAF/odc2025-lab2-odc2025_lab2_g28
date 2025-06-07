Nombre y apellido 
Integrante 1: Camila Yazmin Mugica
Integrante 2: Lucio Jose Lopez Saranz
Integrante 3: Agustina Rollan Jimenez
Integrante 4: Agustina Sosa


Descripción ejercicio 1: Primero creamos funciones básicas para dibujar figuras simples, lo que nos ayudó a hacer dibujos más complejos de forma fácil y mantener el código ordenado. En el archivo principal (app.s) pintamos un fondo celeste y luego llamamos a funciones que dibujan cada parte de la imagen (nubes, montaña, camino, avión, etc.) directamente sobre el framebuffer

Descripción ejercicio 2: para hacerlo solo participamos Yazmin Mugica, Agustina Rollan Jimenez y Agustina Sosa ya que nuestro compañero no quiso hacerlo porque no iba a promocionar. 
Recreamos la famosa escena del beso de spiderman pero cambiando a los personajes por miles morales y hello kitty, todo sucediendo en una ciudad al atardecer 


Justificación instrucciones ARMv8:
* stp y str: se han utilizado estas funciones para guardar el estado de los registros en la pila (stack) al comienzo de una función. Esto nos ha permitido que los valores originales se restauren más tarde, evitando que se pierdan por modificaciones internas de la función. 

* ldp y ldr: se han utilizado para restaurar los registros que fueron guardados previamente en la pila al comienzo de la función, durante el "epílogo" de la subrutina. Esto asegura que el contexto anterior (antes de llamar a la función) se recupera correctamente.

* ret: se ha utilizado esta instrucción para volver de una subrutina a nuestro archivo principal.



