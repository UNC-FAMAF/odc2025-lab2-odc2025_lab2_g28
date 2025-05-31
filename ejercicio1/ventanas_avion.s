	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
	.equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

    .globl ventanas_avion
    .extern dibujar_rectangulo

ventanas_avion:

// x2 = x_inicial
// x3 = y_inicial
// x4 = ancho rectangulo
// x5 = alto rectangulo
// w12 = color rectangulo

    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.
//----------- VENTANA LARGA --------------
    mov x0, x0
    mov x2, #211         // x_inicial
    mov x3, #110         // y_inicial
    mov x4, #19          // ancho
    mov x5, #5           // alto
    movz w12, #0x0000    // color 
    movk w12, #0x0000, lsl 16

    bl dibujar_rectangulo

//----------- VENTANAS INDIVIDUALES --------------
    mov x0, x0
    mov x2, #234          // x_inicial
    mov x3, #110          // y_inicial
    mov x4, #7           // ancho
    mov x5, #5           // alto
    movz w12, #0x0000    // color 
    movk w12, #0x0000, lsl 16

    bl dibujar_rectangulo

    mov x0, x0
    mov x2, #246
    mov x3, #110
    mov x4, #7
    mov x5, #5
    movz w12, #0x0000    // color
    movk w12, #0x0000, lsl 16

    bl dibujar_rectangulo

    mov x0, x0
    mov x2, #258
    mov x3, #110
    mov x4, #7
    mov x5, #5
    movz w12, #0x0000    // color 
    movk w12, #0x0000, lsl 16

    bl dibujar_rectangulo

    mov x0, x0
    mov x2, #270
    mov x3, #110
    mov x4, #7
    mov x5, #5
    movz w12, #0x0000    // color 
    movk w12, #0x0000, lsl 16

    bl dibujar_rectangulo

  // Restaura los registros que se guardaron
    ldp x29, x30, [sp], #16  // Restaura FP y LR y ajusta SP de vuelta.

    ret
