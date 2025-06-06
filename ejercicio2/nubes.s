	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGHT, 		480
	.equ BITS_PER_PIXEL,  	32

	.globl nubes
    .extern dibujar_circulo

nubes:

    sub sp, sp, #24                     // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]              // Guarda FP y LR en la pila
    str x21, [sp, #0]                   // Guarda x21 en la pila

//------------------ NUBES ROSAS CLARAS  ----------------------------

    mov x1, 485                         // centro x
    mov x2, 210                         // centro y
    mov x3, 15                          // radio
    movz w4, 0x367F         
    movk w4, 0x80B3, lsl 16             // Color rosa
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    mov x1, 510                         // centro x
    mov x2, 210                         // centro y
    mov x3, 15                          // radio
    movz w4, 0x367F         
    movk w4, 0x80B3, lsl 16             // Color rosa
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    mov x1, 540                         // centro x
    mov x2, 240                         // centro y
    mov x3, 30                          // radio
    movz w4, 0x367F         
    movk w4, 0x80B3, lsl 16             // Color rosa
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    mov x1, 400                         // centro x
    mov x2, 250                         // centro y
    mov x3, 35                          // radio
    movz w4, 0x367F         
    movk w4, 0x80B3, lsl 16             // Color rosa
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    mov x1, 450                         // centro x
    mov x2, 300                         // centro y
    mov x3, 65                          // radio
    movz w4, 0x367F         
    movk w4, 0x80B3, lsl 16             // Color rosa
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    mov x1, 480                         // centro x
    mov x2, 250                         // centro y
    mov x3, 45                          // radio
    movz w4, 0x367F         
    movk w4, 0x80B3, lsl 16             // Color rosa
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    mov x1, 370                         // centro x
    mov x2, 300                         // centro y
    mov x3, 45                          // radio
    movz w4, 0x367F         
    movk w4, 0x80B3, lsl 16             // Color rosa
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    mov x1, 325                         // centro x
    mov x2, 300                         // centro y
    mov x3, 20                          // radio
    movz w4, 0x367F         
    movk w4, 0x80B3, lsl 16             // Color rosa
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    mov x1, 530                         // centro x
    mov x2, 300                         // centro y
    mov x3, 45                          // radio
    movz w4, 0x367F         
    movk w4, 0x80B3, lsl 16             // Color rosa
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    mov x1, 570                         // centro x
    mov x2, 250                         // centro y
    mov x3, 20                          // radio
    movz w4, 0x367F         
    movk w4, 0x80B3, lsl 16             // Color rosa
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    mov x1, 630                         // centro x
    mov x2, 270                         // centro y
    mov x3, 45                          // radio
    movz w4, 0x367F         
    movk w4, 0x80B3, lsl 16             // Color rosa
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    mov x1, 610                         // centro x
    mov x2, 220                         // centro y
    mov x3, 20                          // radio
    movz w4, 0x367F         
    movk w4, 0x80B3, lsl 16             // Color rosa
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    mov x1, 590                         // centro x
    mov x2, 280                         // centro y
    mov x3, 45                          // radio
    movz w4, 0x367F         
    movk w4, 0x80B3, lsl 16             // Color rosa
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

// -------------------- COLOR FINAL DEL CIELO -----------------------

	mov x0, x21                	        // Guarda la dirección base del framebuffer en x0
	movz w5, 0x286C     		        // Color cielo final
	movk w5, 0x80A6, lsl 16
	mov x1, 200               	        // x inicial (columna)
	mov x2, 300                	        // y inicial (fila)
	mov x3, 640                	        // Ancho
	mov x4, 200                         // Alto
	bl dibujar_rectangulo      	        // Llamada función

	mov x0, x21                	        // Guarda la dirección base del framebuffer en x0
	movz w5, 0x286C     		        // Color cielo final
	movk w5, 0x80A6, lsl 16
	mov x1, 200               	        // x inicial (columna)
	mov x2, 290                	        // y inicial (fila)
	mov x3, SCREEN_WIDTH                // Ancho
	mov x4, 1                           // Alto
	bl dibujar_rectangulo      	        // Llamada función

	mov x0, x21                	        // Guarda la dirección base del framebuffer en x0
	movz w5, 0x286C     		        // Color cielo final
	movk w5, 0x80A6, lsl 16
	mov x1, 200               	        // x inicial (columna)
	mov x2, 295                	        // y inicial (fila)
	mov x3, SCREEN_WIDTH                // Ancho
	mov x4, 3                           // Alto
	bl dibujar_rectangulo      	        // Llamada función


// --------------------- NUBES ROSA FUERTE --------------------

    mov x1, 480                         // centro x
    mov x2, 320                         // centro y
    mov x3, 45                          // radio
    movz W4, 0x286C     		        // Color cielo final
	movk W4, 0x80A6, lsl 16
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    mov x1, 520                         // centro x
    mov x2, 300                         // centro y
    mov x3, 20                          // radio
    movz W4, 0x286C     		        // Color cielo final
	movk W4, 0x80A6, lsl 16
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    mov x1, 480                         // centro x
    mov x2, 320                         // centro y
    mov x3, 45                          // radio
    movz W4, 0x286C     		        // Color cielo final
	movk W4, 0x80A6, lsl 16
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo


    ldr x21, [sp, #0]                   // Restaura x21
    ldp x29, x30, [sp, #8]              // Restaura FP y LR
    add sp, sp, #24                     // Ajusta SP de vuelta

    ret
