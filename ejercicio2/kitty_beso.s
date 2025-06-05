   .equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGHT, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x2f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x24

	.globl kitty_beso

kitty_beso:

    sub sp, sp, #24                     // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]              // Guarda FP y LR en la pila
    str x21, [sp, #0]                   // Guarda x21 en la pila

    mov x21, x0                         // Guardar base framebuffer al inicio

	//Limpiar kitty de detrás
    movz x5, 0x16, lsl 16               // Color Azul oscuro 0x16164B
    movk x5, 0x164B
	mov x1, 326                         // x inicial
	mov x2, 409                         // y inicial
	mov x3, 20                          // Ancho de la base
	mov x4, 263                         // Alto
	mov x6, -1
	bl dibujar_paralelogramo

    movz x5, 0x2F, lsl 16
    movk x5, 0x273E
	mov x1, 346                         // x inicial
	mov x2, 409                         // y inicial
	mov x3, 20                          // Ancho de la base
	mov x4, 263                         // Alto
	mov x6, -1
	bl dibujar_paralelogramo
//blanco
    //Cabeza
    add x1, x25, 326                    // x_inicial
    add x2, x26, 380                    // y_inicial
    mov x3, 4                           // Ancho 
    mov x4, 6                           // Alto
    movz w5, 0xB2B2, lsl 0              // Color Blanco rojizo 0xC6B2B2
    movk w5, 0xC6, lsl 16
    bl dibujar_rectangulo               // Llamada a funcion 

    add x1, x25, 330                    // x_inicial
    add x2, x26, 384                    // y_inicial
    mov x3, 8                           // Ancho 
    mov x4, 8                           // Alto
    movz w5, 0xB2B2, lsl 0              // Color Blanco rojizo 0xC6B2B2
    movk w5, 0xC6, lsl 16
    bl dibujar_rectangulo               // Llamada a funcion 

    add x1, x25, 310                    // x_inicial
    add x2, x26, 390                    // y_inicial
    mov x3, 30                          // Ancho 
    mov x4, 4                           // Alto
    movz w5, 0xB2B2, lsl 0              // Color Blanco rojizo 0xC6B2B2
    movk w5, 0xC6, lsl 16
    bl dibujar_rectangulo               // Llamada a funcion 

    add x1, x25, 308                    // x_inicial
    add x2, x26, 394                    // y_inicial
    mov x3, 34                          // Ancho 
    mov x4, 4                           // Alto
    movz w5, 0xB2B2, lsl 0              // Color Blanco rojizo 0xC6B2B2
    movk w5, 0xC6, lsl 16
    bl dibujar_rectangulo               // Llamada a funcion 

    add x1, x25, 306                    // x_inicial
    add x2, x26, 398                    // y_inicial
    mov x3, 38                          // Ancho 
    mov x4, 10                          // Alto
    movz w5, 0xB2B2, lsl 0              // Color Blanco rojizo 0xC6B2B2
    movk w5, 0xC6, lsl 16
    bl dibujar_rectangulo               // Llamada a funcion 

    add x1, x25, 308                    // x_inicial
    add x2, x26, 408                    // y_inicial
    mov x3, 34                          // Ancho 
    mov x4, 6                           // Alto
    movz w5, 0xB2B2, lsl 0              // Color Blanco rojizo 0xC6B2B2
    movk w5, 0xC6, lsl 16
    bl dibujar_rectangulo               // Llamada a funcion 

    add x1, x25, 310                    // x_inicial
    add x2, x26, 412                    // y_inicial
    mov x3, 28                          // Ancho 
    mov x4, 6                           // Alto
    movz w5, 0xB2B2, lsl 0              // Color Blanco rojizo 0xC6B2B2
    movk w5, 0xC6, lsl 16
    bl dibujar_rectangulo               // Llamada a funcion 


    //Brazo
    movz x5, 0xC6, lsl 16     		    // Color Blanco rojizo 0xC6B2B2
	movk x5, 0xB2B2, lsl 0
	add x1, x25, 324                    // x inicial (columna)
	add x2, x26, 410                	// y inicial (fila)
	mov x3, 8                	        // Ancho
	mov x4, 10                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    //Pie izquierdo
    movz x5, 0xC6, lsl 16     		    // Color Blanco rojizo 0xC6B2B2
	movk x5, 0xB2B2, lsl 0
	add x1, x25, 328                    // x inicial (columna)
	add x2, x26, 432                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0xC6, lsl 16     		    // Color Blanco rojizo 0xC6B2B2
	movk x5, 0xB2B2, lsl 0
	add x1, x25, 330                    // x inicial (columna)
	add x2, x26, 434                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0xC6, lsl 16     		    // Color Blanco rojizo 0xC6B2B2
	movk x5, 0xB2B2, lsl 0
	add x1, x25, 322                    // x inicial (columna)
	add x2, x26, 436                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

	movz x5, 0xC6, lsl 16     		    // Color Blanco rojizo 0xC6B2B2
	movk x5, 0xB2B2, lsl 0
	add x1, x25, 324                    // x inicial (columna)
	add x2, x26, 434                	// y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 6                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    //Pie derecho
    movz x5, 0xC6, lsl 16     		    // Color Blanco rojizo 0xC6B2B2
	movk x5, 0xB2B2, lsl 0
	add x1, x25, 334                    // x inicial (columna)
	add x2, x26, 426                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0xC6, lsl 16     		    // Color Blanco rojizo 0xC6B2B2
	movk x5, 0xB2B2, lsl 0
	add x1, x25, 332                    // x inicial (columna)
	add x2, x26, 428                	// y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 4                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    //Cola
    movz x5, 0xC6, lsl 16     		    // Color Blanco rojizo 0xC6B2B2
	movk x5, 0xB2B2, lsl 0
	add x1, x25, 332                    // x inicial (columna)
	add x2, x26, 422                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

//Rosa

    movz x5, 0x7E, lsl 16     		    // Color Rosa oscuro 0x7E0077
	movk x5, 0x0077, lsl 0
	add x1, x25, 318                    // x inicial (columna)
	add x2, x26, 418                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x7E, lsl 16     		    // Color Rosa oscuro 0x7E0077
	movk x5, 0x0077, lsl 0
	add x1, x25, 316                    // x inicial (columna)
	add x2, x26, 420                	// y inicial (fila)
	mov x3, 8                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x7E, lsl 16     		    // Color Rosa oscuro 0x7E0077
	movk x5, 0x0077, lsl 0
	add x1, x25, 328                    // x inicial (columna)
	add x2, x26, 420                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x7E, lsl 16     		    // Color Rosa oscuro 0x7E0077
	movk x5, 0x0077, lsl 0
	add x1, x25, 316                    // x inicial (columna)
	add x2, x26, 422                	// y inicial (fila)
	mov x3, 16                	        // Ancho
	mov x4, 8                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x7E, lsl 16     		    // Color Rosa oscuro 0x7E0077
	movk x5, 0x0077, lsl 0
	add x1, x25, 318                    // x inicial (columna)
	add x2, x26, 430                	// y inicial (fila)
	mov x3, 12                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x7E, lsl 16     		    // Color Rosa oscuro 0x7E0077
	movk x5, 0x0077, lsl 0
	add x1, x25, 320                    // x inicial (columna)
	add x2, x26, 432                	// y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion
	
	
	//Moño
    movz x5, 0x7E, lsl 16     		    // Color Rosa oscuro 0x7E0077
	movk x5, 0x0077, lsl 0
	add x1, x25, 316                    // x inicial (columna)
	add x2, x26, 384                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 6                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x7E, lsl 16     		    // Color Rosa oscuro 0x7E0077
	movk x5, 0x0077, lsl 0
	add x1, x25, 320                    // x inicial (columna)
	add x2, x26, 382                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 4                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x7E, lsl 16     		    // Color Rosa oscuro 0x7E0077
	movk x5, 0x0077, lsl 0
	add x1, x25, 322                    // x inicial (columna)
	add x2, x26, 388                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 4                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x7E, lsl 16     		    // Color Rosa oscuro 0x7E0077
	movk x5, 0x0077, lsl 0
	add x1, x25, 328                    // x inicial (columna)
	add x2, x26, 390                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 4                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x7E, lsl 16     		    // Color Rosa oscuro 0x7E0077
	movk x5, 0x0077, lsl 0
	add x1, x25, 326                    // x inicial (columna)
	add x2, x26, 394                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 4                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion


//Borde
    //Pies
    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 318                    // x inicial (columna)
	add x2, x26, 434                	// y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 320                    // x inicial (columna)
	add x2, x26, 436                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 322                    // x inicial (columna)
	add x2, x26, 438                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 324                    // x inicial (columna)
	add x2, x26, 440                	// y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 330                    // x inicial (columna)
	add x2, x26, 438                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 330                    // x inicial (columna)
	add x2, x26, 436                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 332                    // x inicial (columna)
	add x2, x26, 434                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 330                    // x inicial (columna)
	add x2, x26, 432                	// y inicial (fila)
	mov x3, 8                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 324                    // x inicial (columna)
	add x2, x26, 432                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 330                    // x inicial (columna)
	add x2, x26, 432                	// y inicial (fila)
	mov x3, 8                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 328                    // x inicial (columna)
	add x2, x26, 430                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 330                    // x inicial (columna)
	add x2, x26, 428                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 332                    // x inicial (columna)
	add x2, x26, 426                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 332                    // x inicial (columna)
	add x2, x26, 424                	// y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 336                    // x inicial (columna)
	add x2, x26, 422                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 6                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 338                    // x inicial (columna)
	add x2, x26, 428                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 4                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 330                    // x inicial (columna)
	add x2, x26, 420                	// y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

	//Cabeza(desde abajo a la derecha)
    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 330                    // x inicial (columna)
	add x2, x26, 416                	// y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 336                    // x inicial (columna)
	add x2, x26, 414                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 340                    // x inicial (columna)
	add x2, x26, 412                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 342                    // x inicial (columna)
	add x2, x26, 408                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 4                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 344                    // x inicial (columna)
	add x2, x26, 400                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 8                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 342                    // x inicial (columna)
	add x2, x26, 396                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 4                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 340                    // x inicial (columna)
	add x2, x26, 392                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 4                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 338                    // x inicial (columna)
	add x2, x26, 384                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 10                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 330                    // x inicial (columna)
	add x2, x26, 382                	// y inicial (fila)
	mov x3, 8                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 328                    // x inicial (columna)
	add x2, x26, 384                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 320                    // x inicial (columna)
	add x2, x26, 380                	// y inicial (fila)
	mov x3, 10                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 324                    // x inicial (columna)
	add x2, x26, 382                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 6                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 318                    // x inicial (columna)
	add x2, x26, 382                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 316                    // x inicial (columna)
	add x2, x26, 384                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 4                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion
	//Moño

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 316                    // x inicial (columna)
	add x2, x26, 390                	// y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 320                    // x inicial (columna)
	add x2, x26, 386                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 4                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 322                    // x inicial (columna)
	add x2, x26, 386                	// y inicial (fila)
	mov x3, 8                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

	movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 322                    // x inicial (columna)
	add x2, x26, 392                	// y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 324                    // x inicial (columna)
	add x2, x26, 394                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 6                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 326                    // x inicial (columna)
	add x2, x26, 398                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 328                    // x inicial (columna)
	add x2, x26, 396                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 330                    // x inicial (columna)
	add x2, x26, 394                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 332                    // x inicial (columna)
	add x2, x26, 390                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 4                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 328                    // x inicial (columna)
	add x2, x26, 388                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion
	
    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 326                    // x inicial (columna)
	add x2, x26, 388                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 6                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion
	
	//Fin moño
	
    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 312                    // x inicial (columna)
	add x2, x26, 388                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 310                    // x inicial (columna)
	add x2, x26, 390                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 308                    // x inicial (columna)
	add x2, x26, 392                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 306                    // x inicial (columna)
	add x2, x26, 394                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 4                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 304                    // x inicial (columna)
	add x2, x26, 398                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 10                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 300                    // x inicial (columna)
	add x2, x26, 398                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 300                    // x inicial (columna)
	add x2, x26, 398                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 4                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion
    
	movz x5, 0xBB, lsl 16     		    // Color Mostaza 0xBB8C00
	movk x5, 0x8C00, lsl 0
	add x1, x25, 302                    // x inicial (columna)
	add x2, x26, 400                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 304                    // x inicial (columna)
	add x2, x26, 408                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 6                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 308                    // x inicial (columna)
	add x2, x26, 410                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 310                    // x inicial (columna)
	add x2, x26, 412                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 314                    // x inicial (columna)
	add x2, x26, 414                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 318                    // x inicial (columna)
	add x2, x26, 416                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion
	
	//Brazo (izq)
    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 308                    // x inicial (columna)
	add x2, x26, 414                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 310                    // x inicial (columna)
	add x2, x26, 416                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 312                    // x inicial (columna)
	add x2, x26, 418                	// y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul 0x131341
	movk x5, 0x164B, lsl 0
	add x1, x25, 308                    // x inicial (columna)
	add x2, x26, 420                	// y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 12                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    //Brazo (der)
    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 326                    // x inicial (columna)
	add x2, x26, 408                	// y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 324                    // x inicial (columna)
	add x2, x26, 410                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 4                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 322                    // x inicial (columna)
	add x2, x26, 414                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 6                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 324                    // x inicial (columna)
	add x2, x26, 420                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 326                    // x inicial (columna)
	add x2, x26, 418                	// y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 328                    // x inicial (columna)
	add x2, x26, 416                	// y inicial (fila)
	mov x3, 10                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 330                    // x inicial (columna)
	add x2, x26, 414                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 332                    // x inicial (columna)
	add x2, x26, 410                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 4                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion
	
	//Rostro
    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 312                    // x inicial (columna)
	add x2, x26, 398                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 4                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 320                    // x inicial (columna)
	add x2, x26, 400                	// y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 326                    // x inicial (columna)
	add x2, x26, 402                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 320                    // x inicial (columna)
	add x2, x26, 404                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 322                    // x inicial (columna)
	add x2, x26, 406                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 318                    // x inicial (columna)
	add x2, x26, 408                	// y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 322                    // x inicial (columna)
	add x2, x26, 410                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    //Cuerpo, ropa

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 314                    // x inicial (columna)
	add x2, x26, 414                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 16                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 316                    // x inicial (columna)
	add x2, x26, 430                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion

    movz x5, 0x16, lsl 16     		    // Color Azul oscuro 0x161324
	movk x5, 0x1324, lsl 0
	add x1, x25, 318                    // x inicial (columna)
	add x2, x26, 432                	// y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo               // Llamada a funcion




    ldr x21, [sp, #0]                   // Restaura x21
    ldp x29, x30, [sp, #8]              // Restaura FP y LR
    add sp, sp, #24                     // Ajusta SP de vuelta

    ret
