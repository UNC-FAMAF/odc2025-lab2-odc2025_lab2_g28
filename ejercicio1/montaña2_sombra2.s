    .equ SCREEN_WIDTH,          640
    .equ SCREEN_HEIGHT,         480
    .equ BITS_PER_PIXEL,    32

    .equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
    .equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

    .globl montaña2_sombra2
    .extern dibujar_circulo
    .extern dibujar_rectangulo

montaña2_sombra2:


    sub sp, sp, #24          // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]   // Guarda FP y LR en la pila
    str x19, [sp, #0]        // Guarda x19 en la pila

    mov x19, x0             // Reestablezco x0

    mov x1, 54               // centro x
    mov x2, 407              // centro y
    mov x3, 22               // radio
    movz x4, 0x11, lsl 16    // Color Verde claro 0x69BD2F 
	movk x4, 0x1F34, lsl 0   
    bl dibujar_circulo

	movz x12, 0x11, lsl 16   // Color
	movk x12, 0x1F34, lsl 0
	mov x2, 0              // x inicial (columna)
	mov x3, 341              // y inicial (fila)
	mov x4, 3               // Ancho
	mov x5, 1               // Alto
	bl dibujar_rectangulo

	mov x2, 0              // x inicial (columna)
	mov x3, 342              // y inicial (fila)
	mov x4, 4               // Ancho
	mov x5, 4               // Alto
	bl dibujar_rectangulo

	mov x2, 0              // x inicial (columna)
	mov x3, 346              // y inicial (fila)
	mov x4, 5               // Ancho
	mov x5, 3               // Alto
	bl dibujar_rectangulo

    mov x2, 0              // x inicial (columna)
	mov x3, 349              // y inicial (fila)
	mov x4, 6               // Ancho
	mov x5, 4               // Alto
	bl dibujar_rectangulo

    mov x2, 0              // x inicial (columna)
	mov x3, 353              // y inicial (fila)
	mov x4, 7               // Ancho
	mov x5, 6               // Alto
	bl dibujar_rectangulo

    mov x2, 0              // x inicial (columna)
	mov x3, 359              // y inicial (fila)
	mov x4, 8               // Ancho
	mov x5, 5               // Alto
	bl dibujar_rectangulo


    movz x5, 0x11, lsl 16
    movk x5, 0x1F34, lsl 0
    mov x1, 0                // x inicial
    mov x2, 364              // y inicial
    mov x3, 8               // ancho del paralelogramo
    mov x4, 8               // alto
    mov x6, 1               // desplazamiento
    bl dibujar_paralelogramo

    mov x1, 0                // x inicial
    mov x2, 372              // y inicial
    mov x3, 15               // ancho del paralelogramo
    mov x4, 10               // alto
    mov x6, 2               // desplazamiento
    bl dibujar_paralelogramo

    mov x1, 0                // x inicial
    mov x2, 380              // y inicial
    mov x3, 32               // ancho del paralelogramo
    mov x4, 15               // alto
    mov x6, 3               // desplazamiento
    bl dibujar_paralelogramo

//RELLENO

	movz x12, 0x11, lsl 16   // Color
	movk x12, 0x1F34, lsl 0
	mov x2, 0              // x inicial (columna)
	mov x3, 365              // y inicial (fila)
	mov x4, 10               // Ancho
	mov x5, 30               // Alto
	bl dibujar_rectangulo

	movz x12, 0x11, lsl 16   // Color
	movk x12, 0x1F34, lsl 0
	mov x2, 10              // x inicial (columna)
	mov x3, 375              // y inicial (fila)
	mov x4, 10               // Ancho
	mov x5, 10               // Alto
	bl dibujar_rectangulo

    movz x12, 0x11, lsl 16   // Color
	movk x12, 0x1F34, lsl 0
	mov x2, 0              // x inicial (columna)
	mov x3, 385              // y inicial (fila)
	mov x4, 40               // Ancho
	mov x5, 30               // Alto
	bl dibujar_rectangulo





    ldr x21, [sp, #0]        // Restaura x21
    ldp x29, x30, [sp, #8]   // Restaura FP y LR
    add sp, sp, #24          // Ajusta SP de vuelta

    

    ret
