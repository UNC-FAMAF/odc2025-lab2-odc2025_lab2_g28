    .equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34


    .globl dibujar_rectangulo

dibujar_rectangulo:
    mov x6, 0              // fila 0
fila_loop:
    cmp x6, x5              // si fila actual >= alto, salto
    bge rect_done 

    mov x7, #0              // columna 0
col_loop:
    cmp x7, x4              // si columna actual >= ancho, salto
    bge siguiente_fila

    // Calcular coordenadas absolutas
    add x8, x3, x6          // y = y inicial + fila actual
    add x9, x2, x7          // x = x inicial + columna actual

    // offset = (y * SCREEN_WIDTH + x) * 4
    mov x13, #SCREEN_WIDTH     // Cargar SCREEN_WIDTH
    mul x10, x8, x13           // x10 = y * SCREEN_WIDTH
    add x10, x10, x9
    lsl x10, x10, 2

    add x11, x0, x10        // dirección absoluta del pixel
    str w12, [x11]          // escribir color

    add x7, x7, 1           // columna actual++
    b col_loop

siguiente_fila:
    add x6, x6, 1           // fila actual++
    b fila_loop

rect_done:
    ret
    