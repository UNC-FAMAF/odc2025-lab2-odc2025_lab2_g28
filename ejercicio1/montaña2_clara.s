   .equ SCREEN_WIDTH,          640
    .equ SCREEN_HEIGHT,         480
    .equ BITS_PER_PIXEL,    32

    .equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
    .equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

    .globl montaña2_clara
    .extern dibujar_circulo
    .extern dibujar_rectangulo

montaña2_clara:


    sub sp, sp, #24          // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]   // Guarda FP y LR en la pila
    str x19, [sp, #0]        // Guarda x19 en la pila

    mov x19, x0             // Reestablezco x0


//PARTE CLARA
    mov x1, 62               // centro x
    mov x2, 398              // centro y
    mov x3, 55               // radio
    movz x4, 0x69, lsl 16    // Color Verde claro 0x69BD2F 
	movk x4, 0xBD2F, lsl 0   
    bl dibujar_circulo

    movz x12, 0x69, lsl 16   // Color Verde claro 0x69BD2F  
	movk x12, 0xBD2F, lsl 0
	mov x2, 0                // x inicial (columna)
	mov x3, 343              // y inicial (fila)
	mov x4, 52               // Ancho
	mov x5, 68               // Alto
	bl dibujar_rectangulo

	mov x2, 0                // x inicial (columna)
	mov x3, 342              // y inicial (fila)
	mov x4, 39               // Ancho
	mov x5, 1                // Alto
	bl dibujar_rectangulo


//SOMBRA 3
    /*movz x5, 0x69, lsl 16
    movk x5, 0xBD2F, lsl 0
    mov x1,               // x inicial
    mov x2, 370              // y inicial
    mov x3, 55               // ancho del paralelogramo
    mov x4, 20               // alto
    mov x6, 1                // desplazamiento
    bl dibujar_paralelogramo
    */
    /*
	movz x12, 0x69, lsl 16   // Color Linea  
	movk x12, 0xBD2F, lsl 0
	mov x2, 185              // x inicial (columna)
	mov x3, 400              // y inicial (fila)
	mov x4, 75               // Ancho
	mov x5, 12               // Alto
	bl dibujar_rectangulo
*/




    ldr x21, [sp, #0]        // Restaura x21
    ldp x29, x30, [sp, #8]   // Restaura FP y LR
    add sp, sp, #24          // Ajusta SP de vuelta

    

    ret
