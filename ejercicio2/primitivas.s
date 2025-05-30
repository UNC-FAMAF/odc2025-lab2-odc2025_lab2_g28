.equ SCREEN_WIDTH,          640
.equ SCREEN_HEIGHT,         480
.equ BITS_PER_PIXEL,    32

.equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
.equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

.global dibujar_circulo
.globl dibujar_rectangulo
.globl dibujar_paralelogramo

// ---------------- FUNCIÓN PARA DIBUJAR UN CIRCULO ---------------------


dibujar_circulo:

    sub sp, sp, #32
    stp x29, x30, [sp, #16]             // Guarda FP y LR
    stp x19, x20, [sp, #0]              // Guarda x19 y x20

// Guardar registros temporales

    mov x22, x0                         // Guarda framebuffer base en x22
    mov x23, x1                         // centro_x en x23
    mov x24, x2                         // centro_y en x24
    mov x25, x3                         // radio en x25
    mov w26, w4                         // color en w26

// y loop: desde -r hasta +r

    sub x14, xzr, x25                   // x14 = -radio

circulo_y_loop:
    cmp x14, x25
    b.gt circulo_hecho

// x loop: desde -r hasta +r

    sub x15, xzr, x25                   // x15 = -radio

circulo_x_loop:
    cmp x15, x25
    b.gt siguiente_y

// x² + y² <= r²

    mul x16, x14, x14                   // y²
    mul x17, x15, x15                   // x²
    add x18, x16, x17                   // y² + x²
    mul x19, x25, x25                   // r²

    cmp x18, x19
    b.gt skip_pixel                     // fuera del círculo => skip

// Coordenadas absolutas

    add x5, x23, x15                    // x = centro_x + x_relativa
    add x6, x24, x14                    // y = centro_y + y_relativa

// Verifica límites, las coordenadas x5 y x6 estén dentro de los límites de la pantalla

    cmp x5, #0
    blt skip_pixel
    cmp x6, #0
    blt skip_pixel
    cmp x5, SCREEN_MAX_X
    b.gt skip_pixel
    cmp x6, SCREEN_MAX_Y
    b.gt skip_pixel

// Dirección del píxel

    mov x8, SCREEN_WIDTH
    mul x7, x6, x8                      // Calcula y_absoluta * ancho de pantalla
    add x7, x7, x5                      // Suma x_absoluto
    lsl x7, x7, #2                      // Multiplica por 4 para hacer el desplazamiento en bytes
    add x7, x22, x7                     // Suma al framebuffer base obteniendo la dirección final
    str w26, [x7]                       // escribe el color

skip_pixel:

    add x15, x15, #1
    b circulo_x_loop

siguiente_y:

    add x14, x14, #1
    b circulo_y_loop

circulo_hecho:

// Restaura los registros en el orden inverso del que se guardaron

    ldp x19, x20, [sp, #0]              // Carga x19 y x20
    ldp x29, x30, [sp, #16]             // Carga FP y LR
    add sp, sp, #32                     // Ajusta SP

    ret

// ------------------ FUNCIÓN PARA DIBUJAR UN RECTÁNGULO -----------------------

dibujar_rectangulo:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    mov x6, 0            // fila = 0
    mov x15, x0          // framebuffer base

fila_loop:
    cmp x6, x4           // if fila >= alto
    bge rect_done

    mov x7, 0            // columna = 0

col_loop:
    cmp x7, x3           // if columna >= ancho
    bge siguiente_fila

    add x8, x2, x6       // y = y_inicial + fila
    add x9, x1, x7       // x = x_inicial + columna

    mov x10, #SCREEN_WIDTH
    mul x11, x8, x10
    add x11, x11, x9
    lsl x11, x11, #2     // offset * 4 bytes por pixel

    add x12, x15, x11
    str w5, [x12]        // Color correcto

    add x7, x7, 1
    b col_loop

siguiente_fila:
    add x6, x6, 1
    b fila_loop

rect_done:
    ldp x29, x30, [sp], #16
    ret

// --------------- FUNCIÓN PARA DIBUJAR UN PARALELOGRAMO ----------------

dibujar_paralelogramo:

    stp x29, x30, [sp, -16]! // Guardar FP y LR
    mov x7, 0               // fila actual
    mov x8, x0               // x8 = framebuffer base (copia local)

fila_loop1:
    cmp x7, x4               // si fila >= alto, termina
    bge paralelogramo_done

    // Calcular desplazamiento horizontal
    mul x9, x6, x7           // x9 = dx * fila

    mov x10, 0              // columna actual
columna_loop:
    cmp x10, x3              // si columna >= ancho, siguiente fila
    bge siguiente_fila1

    // x = x inicial + columna + desplazamiento
    add x11, x1, x10
    add x11, x11, x9         // x desplazado

    // y = y inicial + fila
    add x12, x2, x7

    // offset = (y * SCREEN_WIDTH + x) * 4
    mov x13, SCREEN_WIDTH
    mul x14, x12, x13
    add x14, x14, x11
    lsl x14, x14, 2

    add x15, x8, x14
    str w5, [x15]

    add x10, x10, 1
    b columna_loop

siguiente_fila1:
    add x7, x7, 1
    b fila_loop1

paralelogramo_done:
    ldp x29, x30, [sp], 16
    
    ret

