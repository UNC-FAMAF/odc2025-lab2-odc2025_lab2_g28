.equ SCREEN_WIDTH,          640
.equ SCREEN_HEIGHT,         480
.equ BITS_PER_PIXEL,    32

.equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
.equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

.global dibujar_camino
.extern dibujar_rectangulo

dibujar_camino:

    sub sp, sp, #24          // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]   // Guarda FP y LR en la pila
    str x19, [sp, #0]        // Guarda x19 en la pila

    mov x19, x0             // Reestablezco x0

	//------------------ Linea entre montañas y camino ---------------
	mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0x31, lsl 16     // Color Linea  
	movk x12, 0x3B38, lsl 0
	mov x2, 0                  // x inicial (columna)
	mov x3, 411                // y inicial (fila)
	mov x4, 640                // Ancho
	mov x5, 1                  // Alto
	bl dibujar_rectangulo      // Llamada funcion
	
	//------------------ Camino (parte clara) ---------------
	mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0x83, lsl 16     // Color Camino (parte clara)  
	movk x12, 0x7E87, lsl 0
	mov x2, 0                  // x inicial (columna)
	mov x3, 412                // y inicial (fila)
	mov x4, 640                // Ancho
	mov x5, 39                 // Alto
	bl dibujar_rectangulo      // Llamada funcion

	//------------------ Camino (parte oscura) ---------------
	mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0x62, lsl 16     // Color Camino (parte oscura)
	movk x12, 0x5B6D, lsl 0
	mov x2, 0                  // x inicial (columna)
	mov x3, 451                // y inicial (fila)
	mov x4, 640                // Ancho
	mov x5, 29                 // Alto
	bl dibujar_rectangulo      // Llamada funcion

	//------------------ Linea entre montañas y camino ---------------
	mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0x31, lsl 16     // Color linea
	movk x12, 0x3B38, lsl 0
	mov x2, 0                  // Columna
	mov x3, 411                // Fila
	mov x4, 640                // Ancho
	mov x5, 1                  // Alto
	bl dibujar_rectangulo      // Llamada a funcion dibujar_rectangulos
	
	//------------------ Camino (parte clara) ---------------
	mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0x83, lsl 16     // Color camino (parte clara)
	movk x12, 0x7E87, lsl 0
	mov x2, 0                  // Columna
	mov x3, 412                // Fila
	mov x4, 640                // Ancho
	mov x5, 39                 // Alto
	bl dibujar_rectangulo      // Llamada a funcion dibujar_rectangulos

	//------------------ Camino (parte oscura) ---------------
	mov x0, x19
	movz x12, 0x62, lsl 16     // Color camino (parte oscura) 
	movk x12, 0x5B6D, lsl 0
	mov x2, 0                  // Columna
	mov x3, 451                // Fila
	mov x4, 640                // Ancho
	mov x5, 29                 // Alto
	bl dibujar_rectangulo      // Llamada a funcion dibujar_rectangulos

    ldr x19, [sp, #0]        // Restaura x19
    ldp x29, x30, [sp, #8]   // Restaura FP y LR
    add sp, sp, #24          // Ajusta SP de vuelta

    ret
