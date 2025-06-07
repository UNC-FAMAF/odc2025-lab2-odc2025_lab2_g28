	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGHT, 	480
	.equ BITS_PER_PIXEL,  	32

    .global borrar_celeste
    .global borrar_lila
    .global borrar_violeta
    .global borrar_rosa
    .global borrar_celeste_sube
    .global borrar_rosa_sube
    .global borrar_gris_sube
    .global borrar_violeta_sube
    .global borrar_celeste_sube2
    .global borrar_rosa_sube2
    .global borrar_gris_sube2
    .global borrar_violeta_sube2
borrar_celeste:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.
    
    mov x1, 270  // x_inicial
    add x2, xzr, X26   // y_inicial 
    mov x3, #60     //ancho 
    mov x4, #2      //alto
    movz w5, #0x449D, lsl 0
    movk w5, #0x44, lsl 16
    bl dibujar_rectangulo
//dibujar soga
    movz x5, 0xC6, lsl 16     		    // Color Blanco azulado 0xC6B2B2
	movk x5, 0xB2B2, lsl 0
	add x1, x25, 268                    // x inicial (columna)
	add x2, x26, 0                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 18                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función
//borrar borde piernas
    mov x0, x20           // framebuffer base
    mov x1, 275  // x_inicial
    add x2, xzr, X26   // y_inicial
    mov x3, 20            // ancho
    mov x4, 13            // alto
    movz w5, #0x449D, lsl 0
    movk w5, #0x44, lsl 16
    mov x6, -1             // dx = 1 (desplazamiento hacia la derecha por fila)
    bl dibujar_paralelogramo

    mov x0, x20           // framebuffer base
    mov x1, 303  // x_inicial
    add x2, xzr, X26   // y_inicial
    mov x3, 25            // ancho
    mov x4, 13            // alto
    movz w5, #0x449D, lsl 0
    movk w5, #0x44, lsl 16
    mov x6, 1             // dx = 1 (desplazamiento hacia la derecha por fila)
    bl dibujar_paralelogramo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

borrar_violeta:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.

    mov x1, 270  // x_inicial
    add x2, xzr, X26   // y_inicial 
    mov x3, #60     //ancho 
    mov x4, #2      //alto
    movz w5, #0x4AAA, lsl 0
    movk w5, #0x4A, lsl 16
    bl dibujar_rectangulo

//borrar borde piernas
    mov x0, x20           // framebuffer base
    mov x1, 275  // x_inicial
    add x2, xzr, X26   // y_inicial
    mov x3, 20            // ancho
    mov x4, 13            // alto
    movz w5, #0x4AAA, lsl 0
    movk w5, #0x4A, lsl 16
    mov x6, -1             // dx = 1 (desplazamiento hacia la derecha por fila)
    bl dibujar_paralelogramo

    mov x0, x20           // framebuffer base
    mov x1, 303  // x_inicial
    add x2, xzr, X26   // y_inicial
    mov x3, 25            // ancho
    mov x4, 13            // alto
    movz w5, #0x4AAA, lsl 0
    movk w5, #0x4A, lsl 16
    mov x6, 1             // dx = 1 (desplazamiento hacia la derecha por fila)
    bl dibujar_paralelogramo

//dibujar soga
    movz x5, 0xC6, lsl 16     		    // Color Blanco azulado 0xC6B2B2
	movk x5, 0xB2B2, lsl 0
	add x1, x25, 268                    // x inicial (columna)
	add x2, x26, 0                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 18                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

borrar_rosa:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.
    mov x1, 270  // x_inicial
    add x2, xzr, x26   // y_inicial 
    mov x3, #60     //ancho 
    mov x4, #2      //alto
    movz w5, #0x286C, lsl 0
    movk w5, #0xA6, lsl 16
    bl dibujar_rectangulo
//borrar borde piernas
    mov x0, x20           // framebuffer base
    mov x1, 275  // x_inicial
    add x2, xzr, X26   // y_inicial
    mov x3, 20            // ancho
    mov x4, 13            // alto
    movz w5, #0x286C, lsl 0
    movk w5, #0xA6, lsl 16
    mov x6, -1             // dx = 1 (desplazamiento hacia la derecha por fila)
    bl dibujar_paralelogramo

    mov x0, x20           // framebuffer base
    mov x1, 303  // x_inicial
    add x2, xzr, X26   // y_inicial
    mov x3, 25            // ancho
    mov x4, 13            // alto
    movz w5, #0x286C, lsl 0
    movk w5, #0xA6, lsl 16
    mov x6, 1             // dx = 1 (desplazamiento hacia la derecha por fila)
    bl dibujar_paralelogramo

//dibujar soga
    movz x5, 0xC6, lsl 16     		    // Color Blanco azulado 0xC6B2B2
	movk x5, 0xB2B2, lsl 0
	add x1, x25, 268                    // x inicial (columna)
	add x2, x26, 0                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 18                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret
borrar_gris_sube:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.


    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 56
    add x2, xzr, X27   // y_inicial 
    mov x3, 40     //ancho 
    mov x4, #2      //alto
    movz w5, #0x273E, lsl 0
    movk w5, #0x2F, lsl 16
    bl dibujar_rectangulo

    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 54
    add x2, xzr, X27   // y_inicial 
    mov x3, 5     //ancho 
    mov x4, #2      //alto
    movz w5, #0x273E, lsl 0
    movk w5, #0x2F, lsl 16
    bl dibujar_rectangulo

    mov x1, 304  // x_inicial
    mov x27, x26
    add x27, x27, 54
    add x2, xzr, X27   // y_inicial 
    mov x3, 5     //ancho 
    mov x4, #2      //alto
    movz w5, #0x273E, lsl 0
    movk w5, #0x2F, lsl 16
    bl dibujar_rectangulo

    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 52
    add x2, xzr, X27   // y_inicial 
    mov x3, 5     //ancho 
    mov x4, #2      //alto
    movz w5, #0x273E, lsl 0
    movk w5, #0x2F, lsl 16
    bl dibujar_rectangulo

    mov x1, 308  // x_inicial
    mov x27, x26
    add x27, x27, 52
    add x2, xzr, X27   // y_inicial 
    mov x3, 5     //ancho 
    mov x4, #2      //alto
    movz w5, #0x273E, lsl 0
    movk w5, #0x2F, lsl 16
    bl dibujar_rectangulo

    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 50
    add x2, xzr, X27   // y_inicial 
    mov x3, 5     //ancho 
    mov x4, #2      //alto
    movz w5, #0x273E, lsl 0
    movk w5, #0x2F, lsl 16
    bl dibujar_rectangulo

    mov x1, 310  // x_inicial
    mov x27, x26
    add x27, x27, 50
    add x2, xzr, X27   // y_inicial 
    mov x3, 5     //ancho 
    mov x4, #2      //alto
    movz w5, #0x273E, lsl 0
    movk w5, #0x2F, lsl 16
    bl dibujar_rectangulo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

borrar_rosa_sube:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.
    
    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 56
    add x2, xzr, X27   // y_inicial 
    mov x3, 60     //ancho 
    mov x4, #2      //alto
    movz w5, #0x286C, lsl 0
    movk w5, #0xA6, lsl 16
    bl dibujar_rectangulo

    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 54
    add x2, xzr, X27   // y_inicial 
    mov x3, 24     //ancho 
    mov x4, #2      //alto
    movz w5, #0x286C, lsl 0
    movk w5, #0xA6, lsl 16
    bl dibujar_rectangulo

    mov x1, 304  // x_inicial
    mov x27, x26
    add x27, x27, 54
    add x2, xzr, X27   // y_inicial 
    mov x3, 24     //ancho 
    mov x4, #2      //alto
    movz w5, #0x286C, lsl 0
    movk w5, #0xA6, lsl 16
    bl dibujar_rectangulo

    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 52
    add x2, xzr, X27   // y_inicial 
    mov x3, 20     //ancho 
    mov x4, #2      //alto
    movz w5, #0x286C, lsl 0
    movk w5, #0xA6, lsl 16
    bl dibujar_rectangulo

    mov x1, 308  // x_inicial
    mov x27, x26
    add x27, x27, 52
    add x2, xzr, X27   // y_inicial 
    mov x3, 20     //ancho 
    mov x4, #2      //alto
    movz w5, #0x286C, lsl 0
    movk w5, #0xA6, lsl 16
    bl dibujar_rectangulo

    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 50
    add x2, xzr, X27   // y_inicial 
    mov x3, 18     //ancho 
    mov x4, #2      //alto
    movz w5, #0x286C, lsl 0
    movk w5, #0xA6, lsl 16
    bl dibujar_rectangulo

    mov x1, 310  // x_inicial
    mov x27, x26
    add x27, x27, 50
    add x2, xzr, X27   // y_inicial 
    mov x3, 18     //ancho 
    mov x4, #2      //alto
    movz w5, #0x286C, lsl 0
    movk w5, #0xA6, lsl 16
    bl dibujar_rectangulo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

borrar_violeta_sube:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.
    
    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 56
    add x2, xzr, X27   // y_inicial 
    mov x3, 60     //ancho 
    mov x4, #2      //alto
    movz w5, #0x4AAA, lsl 0
    movk w5, #0x4A, lsl 16
    bl dibujar_rectangulo

    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 54
    add x2, xzr, X27   // y_inicial 
    mov x3, 24     //ancho 
    mov x4, #2      //alto
    movz w5, #0x4AAA, lsl 0
    movk w5, #0x4A, lsl 16
    bl dibujar_rectangulo

    mov x1, 304  // x_inicial
    mov x27, x26
    add x27, x27, 54
    add x2, xzr, X27   // y_inicial 
    mov x3, 24     //ancho 
    mov x4, #2      //alto
    movz w5, #0x4AAA, lsl 0
    movk w5, #0x4A, lsl 16
    bl dibujar_rectangulo

    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 52
    add x2, xzr, X27   // y_inicial 
    mov x3, 20     //ancho 
    mov x4, #2      //alto
    movz w5, #0x4AAA, lsl 0
    movk w5, #0x4A, lsl 16
    bl dibujar_rectangulo

    mov x1, 308  // x_inicial
    mov x27, x26
    add x27, x27, 52
    add x2, xzr, X27   // y_inicial 
    mov x3, 20     //ancho 
    mov x4, #2      //alto
    movz w5, #0x4AAA, lsl 0
    movk w5, #0x4A, lsl 16
    bl dibujar_rectangulo

    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 50
    add x2, xzr, X27   // y_inicial 
    mov x3, 18     //ancho 
    mov x4, #2      //alto
    movz w5, #0x4AAA, lsl 0
    movk w5, #0x4A, lsl 16
    bl dibujar_rectangulo

    mov x1, 310  // x_inicial
    mov x27, x26
    add x27, x27, 50
    add x2, xzr, X27   // y_inicial 
    mov x3, 18     //ancho 
    mov x4, #2      //alto
    movz w5, #0x4AAA, lsl 0
    movk w5, #0x4A, lsl 16
    bl dibujar_rectangulo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

borrar_celeste_sube:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.
    
    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 56
    add x2, xzr, X27   // y_inicial 
    mov x3, 60     //ancho 
    mov x4, #2      //alto
    movz w5, #0x449D, lsl 0
    movk w5, #0x44, lsl 16
    bl dibujar_rectangulo

    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 54
    add x2, xzr, X27   // y_inicial 
    mov x3, 24     //ancho 
    mov x4, #2      //alto
    movz w5, #0x449D, lsl 0
    movk w5, #0x44, lsl 16
    bl dibujar_rectangulo

    mov x1, 304  // x_inicial
    mov x27, x26
    add x27, x27, 54
    add x2, xzr, X27   // y_inicial 
    mov x3, 24     //ancho 
    mov x4, #2      //alto
    movz w5, #0x449D, lsl 0
    movk w5, #0x44, lsl 16
    bl dibujar_rectangulo

    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 52
    add x2, xzr, X27   // y_inicial 
    mov x3, 20     //ancho 
    mov x4, #2      //alto
    movz w5, #0x449D, lsl 0
    movk w5, #0x44, lsl 16
    bl dibujar_rectangulo

    mov x1, 308  // x_inicial
    mov x27, x26
    add x27, x27, 52
    add x2, xzr, X27   // y_inicial 
    mov x3, 20     //ancho 
    mov x4, #2      //alto
    movz w5, #0x449D, lsl 0
    movk w5, #0x44, lsl 16
    bl dibujar_rectangulo

    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 50
    add x2, xzr, X27   // y_inicial 
    mov x3, 18     //ancho 
    mov x4, #2      //alto
    movz w5, #0x449D, lsl 0
    movk w5, #0x44, lsl 16
    bl dibujar_rectangulo

    mov x1, 310  // x_inicial
    mov x27, x26
    add x27, x27, 50
    add x2, xzr, X27   // y_inicial 
    mov x3, 18     //ancho 
    mov x4, #2      //alto
    movz w5, #0x449D, lsl 0
    movk w5, #0x44, lsl 16
    bl dibujar_rectangulo



    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

borrar_gris_sube2:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.


    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 26
    add x2, xzr, X27   // y_inicial 
    mov x3, 16     //ancho 
    mov x4, #2      //alto
    movz w5, #0x4AAA, lsl 0
    movk w5, #0x4A, lsl 16
    bl dibujar_rectangulo

    mov x1, 312  // x_inicial
    mov x27, x26
    add x27, x27, 26
    add x2, xzr, X27   // y_inicial 
    mov x3, 16     //ancho 
    mov x4, #2      //alto
    movz w5, #0x4AAA, lsl 0
    movk w5, #0x4A, lsl 16
    bl dibujar_rectangulo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

borrar_rosa_sube2:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.


    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 26
    add x2, xzr, X27   // y_inicial 
    mov x3, 16     //ancho 
    mov x4, #2      //alto
    movz w5, #0x286C, lsl 0
    movk w5, #0xA6, lsl 16
    bl dibujar_rectangulo

    mov x1, 312  // x_inicial
    mov x27, x26
    add x27, x27, 26
    add x2, xzr, X27   // y_inicial 
    mov x3, 16     //ancho 
    mov x4, #2      //alto
    movz w5, #0x286C, lsl 0
    movk w5, #0xA6, lsl 16
    bl dibujar_rectangulo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

borrar_violeta_sube2:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.


    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 26
    add x2, xzr, X27   // y_inicial 
    mov x3, 16     //ancho 
    mov x4, #2      //alto
    movz w5, #0x4AAA, lsl 0
    movk w5, #0x4A, lsl 16
    bl dibujar_rectangulo

    mov x1, 312  // x_inicial
    mov x27, x26
    add x27, x27, 26
    add x2, xzr, X27   // y_inicial 
    mov x3, 16     //ancho 
    mov x4, #2      //alto
    movz w5, #0x4AAA, lsl 0
    movk w5, #0x4A, lsl 16
    bl dibujar_rectangulo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

borrar_celeste_sube2:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.


    mov x1, 270  // x_inicial
    mov x27, x26
    add x27, x27, 26
    add x2, xzr, X27   // y_inicial 
    mov x3, 16     //ancho 
    mov x4, #2      //alto
    movz w5, #0x449D, lsl 0
    movk w5, #0x44, lsl 16
    bl dibujar_rectangulo

    mov x1, 312  // x_inicial
    mov x27, x26
    add x27, x27, 26
    add x2, xzr, X27   // y_inicial 
    mov x3, 16     //ancho 
    mov x4, #2      //alto
    movz w5, #0x449D, lsl 0
    movk w5, #0x44, lsl 16
    bl dibujar_rectangulo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

