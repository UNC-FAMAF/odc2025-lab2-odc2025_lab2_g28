    .equ SCREEN_WIDTH, 640
    .equ SCREEN_HEIGHT, 480
    .equ BITS_PER_PIXEL, 32

    .globl dibujar_triangulo_derecha

// x0: framebuffer base
// x2: x_inicial
// x3: y_inicial
// x4: base
// x5: altura
// w12: color
    mov w20, w12
dibujar_triangulo_derecha:
    stp x29, x30, [sp, #-16]!   // Guardar contexto
    mov x6, #0                  // fila = 0
    mov x15, x0                 // guardar framebuffer

fila_loop:
    cmp x6, x5
    bge fin

    // ancho_actual = base * fila / altura
    mul x7, x4, x6
    udiv x7, x7, x5

    // Coordenadas Y
    add x8, x3, x6  // y = y_inicial + fila

    // Loop de columnas (desde 0 hasta ancho_actual)
    mov x9, #0

col_loop:
    cmp x9, x7
    bge siguiente_fila

    // x = x_inicial + columna
    add x10, x2, x9

    // offset = (y * SCREEN_WIDTH + x) * 4
    mov x11, #SCREEN_WIDTH
    mul x12, x8, x11
    add x12, x12, x10
    lsl x12, x12, #2

    add x13, x15, x12
    str w20, [x13]

    add x9, x9, #1
    b col_loop

siguiente_fila:
    add x6, x6, #1
    b fila_loop

fin:
    ldp x29, x30, [sp], #16
    ret
    