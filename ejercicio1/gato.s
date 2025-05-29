
.equ SCREEN_WIDTH,      640
.equ SCREEN_HEIGHT,     480
.equ BITS_PER_PIXEL,    32

.global gato
.extern dibujar_triangulo
.extern dibujar_circulo
.extern dibujar_rectangulo

gato:

sub sp, sp, #24             // Reservar espacio
str x19, [sp, #0]           // Guardar x19
stp x29, x30, [sp, #8]      // Guardar FP y LR
mov x29, sp                 // Establecer nuevo FP

mov x19, x0                 // GUARDAR framebuffer en x19


    //cabeza--

    mov x1, 400              // centro x
    mov x2, 348              // centro y
    mov x3, 14               // radio
    movz x4, 0xFFFF, lsl 16    // Color 
	movk x4, 0xA500, lsl 0   

    bl dibujar_circulo

    mov x1, 407 //x
    mov x2, 327 //y
    mov x3, 10//altura
    movz x4, 0xFFFF, lsl 16    // Color naranja
	movk x4, 0xA500, lsl 0   

    bl dibujar_triangulo

    mov x1, 409 //x
    mov x2, 330 //y
    mov x3, 7//altura
    movz x4, 0xFFFF, lsl 16    // Color amarillo
	movk x4, 0xD090, lsl 0   

    bl dibujar_triangulo

    mov x1, 391 //x
    mov x2, 327 //y
    mov x3, 10//altura
    movz x4, 0xFFFF, lsl 16    // Color naranja
	movk x4, 0xA500, lsl 0   


    bl dibujar_triangulo

    mov x1, 390 //x
    mov x2, 330 //y
    mov x3, 7//altura
    movz x4, 0xFFFF, lsl 16    // Color amarillo
	movk x4, 0xD090, lsl 0   

    bl dibujar_triangulo

    //union oreja cabeza
    mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFFF, lsl 16     // Color Linea  
	movk x12, 0xA500, lsl 0
	mov x2, 383                  // x inicial (columna)
	mov x3, 337                // y inicial (fila)
	mov x4, 7                // Ancho
	mov x5, 10                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

    mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFFF, lsl 16     // Color Linea  
	movk x12, 0xA500, lsl 0
	mov x2, 410                  // x inicial (columna)
	mov x3, 337                // y inicial (fila)
	mov x4, 7                // Ancho
	mov x5, 10                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

    //cuerpo

    mov x1, 400              // centro x
    mov x2, 381              // centro y
    mov x3, 19               // radio
    movz x4, 0xFFFF, lsl 16    // Color 
	movk x4, 0xA500, lsl 0   

    bl dibujar_circulo

    mov x1, 400              // centro x
    mov x2, 405              // centro y
    mov x3, 22               // radio
    movz x4, 0xFFFF, lsl 16    // Color 
	movk x4, 0xA500, lsl 0   

    bl dibujar_circulo

    //patas

    mov x1, 408 //x
    mov x2, 418 //y
    mov x3, 7//altura
    movz x4, 0xFFFF, lsl 16    // Color amarillo
	movk x4, 0xD090, lsl 0   

    bl dibujar_triangulo

    mov x1, 393 //x
    mov x2, 418 //y
    mov x3, 7//altura
    movz x4, 0xFFFF, lsl 16    // Color amarillo
	movk x4, 0xD090, lsl 0   

    bl dibujar_triangulo

    //cuello

	mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFFF, lsl 16     // Color Linea  
	movk x12, 0xA500, lsl 0
	mov x2, 389                  // x inicial (columna)
	mov x3, 350                // y inicial (fila)
	mov x4, 22                // Ancho
	mov x5, 45                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

    //cola

    mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFFF, lsl 16     // Color Linea  
	movk x12, 0xA500, lsl 0
	mov x2, 397                  // x inicial (columna)
	mov x3, 415                // y inicial (fila)
	mov x4, 7                // Ancho
	mov x5, 15                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

    mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFFF, lsl 16     // Color   
	movk x12, 0xA500, lsl 0
	mov x2, 397                  // x inicial (columna)
	mov x3, 430                // y inicial (fila)
	mov x4, 53               // Ancho
	mov x5, 7                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

    mov x1, 447              // centro x
    mov x2, 433              // centro y
    mov x3, 4               // radio
    movz x4, 0xFFFF, lsl 16    // Color 
	movk x4, 0xA500, lsl 0   

    bl dibujar_circulo

    mov x1, 399              // centro x
    mov x2, 433              // centro y
    mov x3, 4               // radio
    movz x4, 0xFFFF, lsl 16    // Color 
	movk x4, 0xA500, lsl 0   

    bl dibujar_circulo

    mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFFF, lsl 16     // Color Linea  
	movk x12, 0xA500, lsl 0
	mov x2, 445                  // x inicial (columna)
	mov x3, 420                // y inicial (fila)
	mov x4, 7                // Ancho
	mov x5, 15                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

    mov x1, 447              // centro x
    mov x2, 420              // centro y
    mov x3, 4               // radio
    movz x4, 0xFFFF, lsl 16    // Color 
	movk x4, 0xA500, lsl 0   

    bl dibujar_circulo

    // detalle pelo (naranja mas oscuro)

    mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFB2, lsl 16     // Color   
	movk x12, 0x7300, lsl 0
	mov x2, 400                  // x inicial (columna)
	mov x3, 370                // y inicial (fila)
	mov x4, 2               // Ancho
	mov x5, 20                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

    mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFB2, lsl 16     // Color   
	movk x12, 0x7300, lsl 0
	mov x2, 402                  // x inicial (columna)
	mov x3, 370                // y inicial (fila)
	mov x4, 6               // Ancho
	mov x5, 2                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

    mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFB2, lsl 16     // Color   
	movk x12, 0x7300, lsl 0
	mov x2, 402                  // x inicial (columna)
	mov x3, 375                // y inicial (fila)
	mov x4, 8               // Ancho
	mov x5, 2                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

    mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFB2, lsl 16     // Color   
	movk x12, 0x7300, lsl 0
	mov x2, 402                  // x inicial (columna)
	mov x3, 380                // y inicial (fila)
	mov x4, 10               // Ancho
	mov x5, 2                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

    mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFB2, lsl 16     // Color   
	movk x12, 0x7300, lsl 0
	mov x2, 394                  // x inicial (columna)
	mov x3, 370                // y inicial (fila)
	mov x4, 6               // Ancho
	mov x5, 2                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

    mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFB2, lsl 16     // Color   
	movk x12, 0x7300, lsl 0
	mov x2, 392                  // x inicial (columna)
	mov x3, 375                // y inicial (fila)
	mov x4, 8               // Ancho
	mov x5, 2                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

    mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFB2, lsl 16     // Color   
	movk x12, 0x7300, lsl 0
	mov x2, 390                  // x inicial (columna)
	mov x3, 380                // y inicial (fila)
	mov x4, 10               // Ancho
	mov x5, 2                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

    mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFB2, lsl 16     // Color   
	movk x12, 0x7300, lsl 0
	mov x2, 399                  // x inicial (columna)
	mov x3, 370                // y inicial (fila)
	mov x4, 2               // Ancho
	mov x5, 17                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

    mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFB2, lsl 16     // Color   
	movk x12, 0x7300, lsl 0
	mov x2, 400                  // x inicial (columna)
	mov x3, 367                // y inicial (fila)
	mov x4, 2               // Ancho
	mov x5, 20                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

    mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFB2, lsl 16     // Color   
	movk x12, 0x7300, lsl 0
	mov x2, 401                  // x inicial (columna)
	mov x3, 387                // y inicial (fila)
	mov x4, 2               // Ancho
	mov x5, 20                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

    mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFB2, lsl 16     // Color   
	movk x12, 0x7300, lsl 0
	mov x2, 392                  // x inicial (columna)
	mov x3, 396                // y inicial (fila)
	mov x4, 22               // Ancho
	mov x5, 2                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

    mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFB2, lsl 16     // Color   
	movk x12, 0x7300, lsl 0
	mov x2, 389                  // x inicial (columna)
	mov x3, 400                // y inicial (fila)
	mov x4, 24               // Ancho
	mov x5, 2                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

    mov x0, x19                // Guarda la dirección base del framebuffer en x0
	movz x12, 0xFFB2, lsl 16     // Color   
	movk x12, 0x7300, lsl 0
	mov x2, 389                  // x inicial (columna)
	mov x3, 410                // y inicial (fila)
	mov x4, 27               // Ancho
	mov x5, 2                  // Alto
	bl dibujar_rectangulo      // Llamada funcion

ldr x19, [sp, #0]
ldp x29, x30, [sp, #8]
add sp, sp, #24
ret



