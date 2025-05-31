    .equ SCREEN_WIDTH,      640
    .equ SCREEN_HEIGHT,         480
    .equ BITS_PER_PIXEL,    32

    .equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
    .equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

.globl luz
.extern dibujar_circulo  
.extern dibujar_rectangulo
.extern delay_us

.section .data
.align 4
DELAY_MICROSECONDS: .word 5000000 // Microsegundos entre cada paso del fade-in (ajustar)

luz:
    stp x29, x30, [sp, #-16]!   // Guarda FP y LR
    mov x29, sp

    // Guarda los registros callee-saved que usaremos para no afectar al llamador.
    // x19 (framebuffer), x20 (pasos), x21 (i), x22 (tmp_color)
    // x23 (RGB_fondo), x24 (RGB_luz)
    // x25 (diferencia de colores), x26 (paso_actual_escalado)
    // Total 8 registros x 8 bytes = 64 bytes.
    sub sp, sp, #64             // Ajusta el SP para guardar los registros
    stp x19, x20, [sp, #0]
    stp x21, x22, [sp, #16]
    stp x23, x24, [sp, #32]
    stp x25, x26, [sp, #48]

    mov x19, x0                 // x19: framebuffer base (recibido en x0)

    // --- COLORES PARA LA PRUEBA (NEGRO A ROJO) ---

    // Colores RGB del fondo (0x00000000 - Negro Puro)
    mov w23, wzr                // w23 = 0x00000000 (Black)

    // Colores RGB de la luz máxima (0xFFFF0000 - Rojo Puro)
    // Componentes de Rojo Puro (R=FF, G=00, B=00)
    mov w1, #0x00               // B_luz = 0
    mov w2, #0x00               // G_luz = 0
    lsl w2, w2, #8              // G_luz << 8 (sigue siendo 0)
    orr w1, w1, w2              // w1 = B_luz | G_luz (sigue siendo 0)
    mov w2, #0xFF               // R_luz = 255
    lsl w2, w2, #16             // R_luz << 16 (w2 = 0x00FF0000)
    orr w24, w1, w2             // w24 = (B_luz | G_luz) | R_luz (w24 = 0x00FF0000)

    // --- FIN DE LA DEFINICIÓN DE COLORES ---

    // Configuración del Fade-in
    mov x20, #50                // x20 = Número de pasos (N) del fade-in (Aumentado para mejor visualización)
    mov x21, #0                 // x21 = i (contador del paso actual, de 0 a N-1)

fade_loop:
    cmp x21, x20                // Compara i con N
    bge end_fade_loop           // Si i >= N, termina el bucle

    // --- CÁLCULO DE LOS COMPONENTES RGB INTERPOLADOS ---
// Extraer componentes de color de w23 (fondo) y w24 (luz)
    mov w1, w23                 // w1 = RGB_fondo
    mov w2, w24                 // w2 = RGB_luz

// Extraer componentes de color
    and w3, w1, #0xFF0000       // w3 = R_fondo
    and w4, w2, #0xFF0000       // w4 = R_luz
    lsr w3, w3, #16             // w3 = R_fondo (0-255)
    lsr w4, w4, #16             // w4 = R_luz (0-255)

    and w5, w1, #0x00FF00       // w5 = G_fondo
    and w6, w2, #0x00FF00       // w6 = G_luz
    lsr w5, w5, #8              // w5 = G_fondo (0-255)
    lsr w6, w6, #8              // w6 = G_luz (0-255)

    and w7, w1, #0x0000FF       // w7 = B_fondo
    and w8, w2, #0x0000FF       // w8 = B_luz

// Calcular componentes interpolados
    sub w9, w4, w3              // diff_R = R_luz - R_fondo
    mul w9, w9, w26             // diff_R * i_escalado
    udiv w9, w9, w20            // (diff_R * i_escalado) / N
    lsr w9, w9, #8              // Divide por 256
    add w9, w9, w3              // w9 = R_interpolado

    sub w10, w6, w5             // diff_G = G_luz - G_fondo
    mul w10, w10, w26           // diff_G * i_escalado
    udiv w10, w10, w20          // (diff_G * i_escalado) / N
    lsr w10, w10, #8            // Divide por 256
    add w10, w10, w5            // w10 = G_interpolado

    sub w11, w8, w7             // diff_B = B_luz - B_fondo
    mul w11, w11, w26           // diff_B * i_escalado
    udiv w11, w11, w20          // (diff_B * i_escalado) / N
    lsr w11, w11, #8            // Divide por 256
    add w11, w11, w7            // w11 = B_interpolado

// Combinar componentes interpolados en un solo registro
    lsl w9, w9, #16             // w9 = R_interpolado << 16
    lsl w10, w10, #8            // w10 = G_interpolado << 8
    orr w12, w9, w10            // w12 = R_interpolado | G_interpolado
    orr w12, w12, w11           // w12 = R_interpolado | G_interpolado | B_interpolado

    // --- RECOMPONER EL COLOR ARGB ---
    // w8 (R), w9 (G), w10 (B) contienen los valores (0-255)
    // El alpha siempre es 0xFF para opaco
    mov w14, #0xFF              // w14 = Alpha
    lsl w14, w14, #24

    lsl w8, w8, #16             // R a su posición (usa w8 como temp)
    lsl w9, w9, #8              // G a su posición (usa w9 como temp)

    orr w14, w14, w8            // Combina A y R
    orr w14, w14, w9            // Combina AR y G
    orr w14, w14, w10           // Combina ARG y B. w14 ahora tiene el color ARGB interpolado.

    // --- DIBUJAR EL CÍRCULO CON EL COLOR INTERPOLADO ---
    mov x0, x19                 // framebuffer base (ya lo teníamos en x19)
    mov x1, 65                  // centro x del círculo
    mov x2, 50                  // centro y del círculo
    mov x3, 19                  // radio del círculo
    mov w4, w14                 // w4 = color interpolado (pasando w14 a w4 para dibujar_circulo)
    bl dibujar_circulo

    // --- RETARDO ---
    adrp x0, DELAY_MICROSECONDS // Cargar la dirección de la variable de retardo
    ldr w0, [x0, #:lo12:DELAY_MICROSECONDS] // Cargar el valor del retardo en w0
    bl delay_us                 // Llama a la función de delay

    add x21, x21, #1            // i++
    b fade_loop                 // Vuelve al inicio del bucle

end_fade_loop:
    // Restaura los registros guardados (en orden inverso al que se guardaron)
    ldp x25, x26, [sp, #48]
    ldp x23, x24, [sp, #32]
    ldp x21, x22, [sp, #16]
    ldp x19, x20, [sp, #0]
    add sp, sp, #64             // Ajusta el SP de vuelta
    ldp x29, x30, [sp], #16     // Restaura FP y LR y ajusta SP

    ret
