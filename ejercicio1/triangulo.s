    .equ SCREEN_WIDTH,      640
    .equ SCREEN_HEIGHT,     480
    .equ BITS_PER_PIXEL,    32

    .globl dibujar_triangulo_simple

dibujar_triangulo_simple:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    mov x7, #0  // fila o columna

loop_principal:
    cmp x7, x4
    bge fin

    // x8 = índice, x9 = tamaño - índice
    mov x8, x7
    mov x9, x4
    sub x9, x9, x7

    // Detectar dirección
    cmp x5, #0
    beq tri_up
    cmp x5, #1
    beq tri_down
    cmp x5, #2
    beq tri_left
    cmp x5, #3
    beq tri_right
    b fin

// △ Triángulo hacia arriba
tri_up:
    mov x10, x4
    sub x10, x10, x7
    add x10, x3, x10    // y
    add x11, x2, x9     // x inicio
    mov x12, x7         // ancho
    b pintar_h

// ▽ Triángulo hacia abajo
tri_down:
    add x10, x3, x7
    add x11, x2, x9
    mov x12, x7
    b pintar_h

// ◁ Triángulo hacia la izquierda
tri_left:
    mov x10, x4
    sub x10, x10, x7
    add x10, x2, x10    // x
    add x11, x3, x9     // y
    mov x12, x7
    b pintar_v

// ▷ Triángulo hacia la derecha
tri_right:
    add x10, x2, x7     // x
    add x11, x3, x9     // y
    mov x12, x7
    b pintar_v

// ----------- Pinta línea horizontal
pintar_h:
    mov x14, #0
linea_h:
    cmp x14, x12
    bge sig_fila

    add x18, x11, x14   // x
    mov x19, x10        // y

    // offset = (y * SCREEN_WIDTH + x) * 4
    mov x20, #SCREEN_WIDTH
    mul x21, x19, x20
    add x21, x21, x18
    lsl x21, x21, #2

    add x22, x0, x21
    str w12, [x22]

    add x14, x14, #1
    b linea_h

// ----------- Pinta línea vertical
pintar_v:
    mov x14, #0
linea_v:
    cmp x14, x12
    bge sig_fila

    add x18, x10, x14   // x
    mov x19, x11        // y

    mov x20, #SCREEN_WIDTH
    mul x21, x19, x20
    add x21, x21, x18
    lsl x21, x21, #2

    add x22, x0, x21
    str w12, [x22]

    add x14, x14, #1
    b linea_v

sig_fila:
    add x7, x7, #1
    b loop_principal

fin:
    ldp x29, x30, [sp], #16
    ret
    