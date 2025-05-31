.equ SCREEN_WIDTH,          640
.equ SCREEN_HEIGHT,         480
.equ BITS_PER_PIXEL,    32

.equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
.equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

.global dibujar_circulo
.globl dibujar_rectangulo
.globl dibujar_paralelogramo
.globl dibujar_triangulo_dir

// ---------------- FUNCIÓN PARA DIBUJAR UN CIRCULO ---------------------


dibujar_circulo:

    sub sp, sp, #32
    stp x29, x30, [sp, #16]             // Guarda FP y LR
    stp x19, x20, [sp, #0]              // Guarda x19 (framebuffer base) y x20 (usaremos x20 para r²)

// Guardar registros de entrada en callee-saved para preservar sus valores
    mov x22, x0                         // x0 (framebuffer base) -> x22 (callee-saved)
    mov x23, x1                         // x1 (centro_x) -> x23 (callee-saved)
    mov x24, x2                         // x2 (centro_y) -> x24 (callee-saved)
    mov x25, x3                         // x3 (radio) -> x25 (callee-saved)
    mov w26, w4                         // w4 (color) -> w26 (callee-saved)

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

    mul x16, x14, x14                   // y² (x16 y x17 son temporales, no hace falta guardar si se sobrescriben)
    mul x17, x15, x15                   // x²
    add x18, x16, x17                   // y² + x²

    // ¡CORRECCIÓN CLAVE! Usa x20 para r², ya que lo guardaste al principio.
    mul x20, x25, x25                   // r² (usando x20 en lugar de x19)

    cmp x18, x20                        // Compara (x²+y²) con r² (en x20)
    b.gt skip_pixel                     // fuera del círculo => skip

// Coordenadas absolutas

    add x5, x23, x15                    // x_abs = centro_x + x_relativa
    add x6, x24, x14                    // y_abs = centro_y + y_relativa

// Verifica límites, las coordenadas x_abs y y_abs estén dentro de los límites de la pantalla

    cmp x5, #0
    blt skip_pixel
    cmp x6, #0
    blt skip_pixel
    cmp x5, #SCREEN_MAX_X               // Compara con la constante definida
    b.gt skip_pixel
    cmp x6, #SCREEN_MAX_Y               // Compara con la constante definida
    b.gt skip_pixel

// Dirección del píxel

    mov x8, #SCREEN_WIDTH               // Carga SCREEN_WIDTH directamente
    mul x7, x6, x8                      // Calcula y_abs * ancho de pantalla
    add x7, x7, x5                      // Suma x_abs
    lsl x7, x7, #2                      // Multiplica por 4 para hacer el desplazamiento en bytes (32 bits/píxel)
    add x7, x22, x7                     // Suma al framebuffer base (en x22) obteniendo la dirección final
    str w26, [x7]                       // escribe el color (w26 contiene el color)

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

//------------------------------ FUNCIÓN PARA DIBUJAR UN TRIANGULO DIRECCIONABLE -------------------

dibujar_triangulo_dir:
    
    stp x29, x30, [sp, #-16]!   // Guarda FP y LR y ajusta SP.
    mov x29, sp
    mov w20, w12
    mov x7,  0          // fila o columna segun orientación

loop_principal:
    cmp x7, x4          // mientras fila/columna < tamaño
    bge fin

    // cantidad de pixels a pintar en esta fila (según orientación)
    mov x8, x7          // por defecto
    mov x9, x4
    sub x9, x9, x7

    // dependiendo de orientación
    cmp x5, 0          // arriba y derecha
    beq tri_0

    cmp x5, 1          // arriba e izquierda
    beq tri_1

    cmp x5, 2          // abajo e izquierda
    beq tri_2

    cmp x5, 3          // abajo y izquierda
    beq tri_3

    b fin

//-------------------------------------
//Triángulo hacia arriba (vértice abajo)
tri_0:
    mov x10, x4
    sub x10, x10, x7    // y = y_inicial + (altura - fila actual)
    add x10, x3, x10

    add x11, x2, x9     // x inicio desplazado
    mov x12, x7         // ancho = fila actual

    b pintar_linea_horizontal

//-------------------------------------
// Triángulo hacia abajo (vértice arriba)
tri_1: 
    mov x10, x4
    sub x10, x10, x7    // y = y_inicial + (altura - fila)
    add x10, x3, x10

    mov x11, x2         // x = fijo (alineado a la izquierda)
    mov x12, x7         // ancho = fila actual

    b pintar_linea_horizontal
//-------------------------------------
// Triángulo hacia la izquierda
tri_2:
    mov x10, x4
    sub x10, x10, x7    // base - columna actual
    add x10, x2, x10    // x = x_inicial + (base - columna actual)

    sub x11, x3, x7     // y_inicial - y desplazamiento
    mov x12, x7         // altura = columna actual

    b pintar_linea_vertical

//-------------------------------------
// Triángulo hacia la derecha
tri_3:
    add x10, x2, x7     // x = x_inicial + columna actual
    sub x11, x3, x7     // y_inicial - y desplazamiento
    mov x12, x7         // altura = columna actual

    b pintar_linea_vertical
//-------------------------------------
// Pinta línea horizontal con relleno y borde
// x10 = y, x11 = x inicio, x12 = ancho
pintar_linea_horizontal:
    mov x14, 0
linea_h:
    cmp x14, x12
    bge siguiente

    cmp x6, 0
    beq pintar_pixel_h

    b pintar_pixel_h

pintar_pixel_h:
    add x18, x11, x14   // x = x11 + i
    mov x19, x10        // y = fijo

    // offset = (y * SCREEN_WIDTH + x) * 4
    mov x20, #SCREEN_WIDTH
    mul x21, x19, x20
    add x21, x21, x18
    lsl x21, x21, 2

    add x22, x0, x21
    str w13, [x22]

    add x14, x14, 1
    b linea_h

//-------------------------------------
// Pinta línea vertical (igual que horizontal pero invierte X/Y)
pintar_linea_vertical:
    mov x14, 0
linea_v:
    cmp x14, x12
    bge siguiente

    cmp x6, 0
    beq pintar_pixel_v

pintar_pixel_v:
    mov x18, x10            // x es fijo
    add x19, x11, x14       // y crece con cada píxel (columna actual)

    // offset = (y * SCREEN_WIDTH + x) * 4
    mov x20, #SCREEN_WIDTH
    mul x21, x19, x20
    add x21, x21, x18
    lsl x21, x21, 2

    add x22, x0, x21
    str w13, [x22]

    add x14, x14, 1
    b linea_v
siguiente:
    add x7, x7, 1
    b loop_principal

fin:
    ldp x29, x30, [sp], #16
    ret
