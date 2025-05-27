
.equ SCREEN_WIDTH,      640
.equ SCREEN_HEIGHT,     480
.equ BITS_PER_PIXEL,    32

.globl dibujar_triangulo

dibujar_triangulo:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    // x0: framebuffer
    // x1: x (centro base)
    // x2: y (inicio arriba)
    // x3: altura
    // w4: color

    mov x5, #0              // fila = 0
    mov x15, x0             // framebuffer base

fila_loop:
    cmp x5, x3
    bge fin

    // columnas = 2*fila + 1
    lsl x6, x5, #1          // x6 = 2*fila
    add x6, x6, #1          // x6 = columnas

    sub x7, x1, x5          // x_inicial_fila = x - fila
    add x8, x2, x5          // y = y + fila

    mov x9, #0              // columna actual = 0

col_loop:
    cmp x9, x6
    bge sig_fila

    add x10, x7, x9         // x = x_inicial + columna

    // offset = (y * SCREEN_WIDTH + x) * 4
    mov x11, #SCREEN_WIDTH
    mul x12, x8, x11
    add x12, x12, x10
    lsl x12, x12, #2

    add x13, x15, x12
    str w4, [x13]

    add x9, x9, #1
    b col_loop

sig_fila:
    add x5, x5, #1
    b fila_loop

fin:
    ldp x29, x30, [sp], #16
    ret
