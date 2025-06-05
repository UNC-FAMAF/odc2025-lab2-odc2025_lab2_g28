Nombre y apellido 
Integrante 1: 
Integrante 2:
Integrante 3:
Integrante 4:


Descripción ejercicio 1: 


Descripción ejercicio 2:


Justificación instrucciones ARMv8:
stp y str: se han utilizado estas funciones para guardar el estado de los registros en la pila (stack) al comienzo de una función. Esto nos ha permitido que los valores originales se restauren más tarde, evitando que se pierdan por modificaciones internas de la función. 

ldp y ldr: se han utilizado para restaurar los registros que fueron guardados previamente en la pila al comienzo de la función, durante el "epílogo" de la subrutina. Esto asegura que el contexto anterior (antes de llamar a la función) se recupera correctamente.

ret: se ha utilizado esta instrucción para volver de una subrutina a nuestro archivo principal.



