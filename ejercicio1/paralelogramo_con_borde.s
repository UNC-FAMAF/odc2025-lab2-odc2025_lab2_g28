	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
	.equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

    .global paralelogramo_con_borde

paralelogramo_con_borde:
    mov w20, w12   // respaldo del color del borde

    stp x29, x30, [sp, #-16]!   // Prologo

    mov x6, #0                  // fila = 0
    mov x15, x0                 // framebuffer base

fila_loop:
    cmp x6, x5
    bge fin

    // x13 = desplazamiento para esta fila
    mul x13, x6, x16            // desplazamiento = fila * inclinación

    mov x7, #0                  // columna = 0

col_loop:
    cmp x7, x4
    bge siguiente_fila

    // Evaluar si es borde (fila o columna en borde)
    cmp x6, x17 // fila superior
    blt usar_color_borde

    sub x10, x5, x17 //fila inferior
    cmp x6, x10
    bge usar_color_borde

    cmp x7, x17 //columna superior
    blt usar_color_borde

    sub x11, x4, x17 //columna inferior
    cmp x7, x11
    bge usar_color_borde

    // No es borde, usar color de relleno
    mov w14, w13
    b pintar_pixel

usar_color_borde:
    mov w14, w20

pintar_pixel:
    // Calcular coordenadas absolutas
    add x8, x3, x6          // y = y_inicial + fila
    add x9, x2, x7          // x = x_inicial + columna
    add x9, x9, x13         // aplicar desplazamiento

    // offset = (y * SCREEN_WIDTH + x) * 4
    mov x10, #SCREEN_WIDTH
    mul x11, x8, x10
    add x11, x11, x9
    lsl x11, x11, #2        // *4

    add x12, x15, x11
    str w14, [x12]

    add x7, x7, #1
    b col_loop

siguiente_fila:
    add x6, x6, #1
    b fila_loop

fin:
    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.
    
    ret
