    .equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGHT, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl edificio
    .extern dibujar_circulo
    .extern dibujar_rectangulo

//------------ DETALLES DEL EDIFICIO -----------

edificio:

    sub sp, sp, #24                     // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]              // Guarda FP y LR en la pila
    str x21, [sp, #0]                   // Guarda x21 en la pila

    mov x21, x0                         // Guardar base framebuffer al inicio

    mov x1, 65                          // centro x
    mov x2, 60                          // centro y
    mov x3, 35                          // radio
    movz w4, 0x366B         
    movk w4, 0xFF33, lsl 16             // Color celeste
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    mov x1, 65                          // centro x
    mov x2, 60                          // centro y
    mov x3, 25                          // radio
    movz W4, 0x264F     		        // Color azul oscuro 
	movk w4, 0xFF24, lsl 16             // Color azul
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    mov x0, x21                	        // Guarda la dirección base del framebuffer en x0
	movz x12, 0x366B     		        // Color celeste
	movk x12, 0xFF33, lsl 16
	mov x2, 0                          // x inicial (columna)
	mov x3, 140                	        // y inicial (fila)
	mov x4, 225                	        // Ancho
	mov x5, 15                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

    mov x1, 180                         // centro x
    mov x2, 60                          // centro y
    mov x3, 35                          // radio
    movz w4, 0x366B         
    movk w4, 0xFF33, lsl 16             // Color celeste
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    mov x1, 180                          // centro x
    mov x2, 60                          // centro y
    mov x3, 25                          // radio
    movz W4, 0x264F     		        // Color azul oscuro 
	movk w4, 0xFF24, lsl 16             // Color azul
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    mov x0, x21                	        // Guarda la dirección base del framebuffer en x0
	movz x12, 0x264F     		        // Color celeste
	movk x12, 0xFF24, lsl 16
	mov x2, 0                          // x inicial (columna)
	mov x3, 140                	        // y inicial (fila)
	mov x4, 225                	        // Ancho
	mov x5, 15                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

    ldr x21, [sp, #0]                   // Restaura x21
    ldp x29, x30, [sp, #8]              // Restaura FP y LR
    add sp, sp, #24                     // Ajusta SP de vuelta

    ret
