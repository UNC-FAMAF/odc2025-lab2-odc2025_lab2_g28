    .equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGHT, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x2f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x24

	.globl spiderman_img

spiderman_img:

    sub sp, sp, #24                     // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]              // Guarda FP y LR en la pila
    str x21, [sp, #0]                   // Guarda x21 en la pila

    mov x21, x0                         // Guardar base framebuffer al inicio



//Borde

	//Color muro

	movz x5, 0x13, lsl 16     		    // Color Azul 0x131341
	movk x5, 0x1341, lsl 0
	add x1, x25, 250                    // x inicial (columna)
	add x2, x26, 0                	    // y inicial (fila)
	mov x3, 20                	        // Ancho
	mov x4, 18                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x13, lsl 16     		    // Color Azul 0x131341
	movk x5, 0x1341, lsl 0
	add x1, x25, 268                    // x inicial (columna)
	add x2, x26, 0                	    // y inicial (fila)
	mov x3, 20                	        // Ancho
	mov x4, 20                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x13, lsl 16     		    // Color Azul 0x131341
	movk x5, 0x1341, lsl 0
	add x1, x25, 256                    // x inicial (columna)
	add x2, x26, 30                	    // y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 6                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x13, lsl 16     		    // Color Azul 0x131341
	movk x5, 0x1341, lsl 0
	add x1, x25, 276                    // x inicial (columna)
	add x2, x26, 30                	    // y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 6                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función
	
	//Personaje
	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 266                    // x inicial (columna)
	add x2, x26, 0                	    // y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 18                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 264                    // x inicial (columna)
	add x2, x26, 2                	    // y inicial (fila)
	mov x3, 10                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 262                    // x inicial (columna)
	add x2, x26, 4                	    // y inicial (fila)
	mov x3, 14                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 260                    // x inicial (columna)
	add x2, x26, 6                	    // y inicial (fila)
	mov x3, 18                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 256                    // x inicial (columna)
	add x2, x26, 8                	    // y inicial (fila)
	mov x3, 26                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 254                    // x inicial (columna)
	add x2, x26, 10                	    // y inicial (fila)
	mov x3, 30                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 252                    // x inicial (columna)
	add x2, x26, 12                	    // y inicial (fila)
	mov x3, 34                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 250                    // x inicial (columna)
	add x2, x26, 14                	    // y inicial (fila)
	mov x3, 38                	        // Ancho
	mov x4, 4                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x13, lsl 16     		    // Color Azul 0x131341
	movk x5, 0x1341, lsl 0
	add x1, x25, 250                    // x inicial (columna)
	add x2, x26, 18                	    // y inicial (fila)
	mov x3, 38                	        // Ancho
	mov x4, 1                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 252                    // x inicial (columna)
	add x2, x26, 18                	    // y inicial (fila)
	mov x3, 34                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x13, lsl 16     		    // Color Azul 0x131341
	movk x5, 0x1341, lsl 0
	add x1, x25, 252                    // x inicial (columna)
	add x2, x26, 20                	    // y inicial (fila)
	mov x3, 34                	        // Ancho
	mov x4, 1                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 256                    // x inicial (columna)
	add x2, x26, 20                	    // y inicial (fila)
	mov x3, 26                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 254                    // x inicial (columna)
	add x2, x26, 22                	    // y inicial (fila)
	mov x3, 30                	        // Ancho
	mov x4, 4                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x13, lsl 16     		    // Color Azul 0x131341
	movk x5, 0x1341, lsl 0
	add x1, x25, 254                    // x inicial (columna)
	add x2, x26, 26                	    // y inicial (fila)
	mov x3, 30                	        // Ancho
	mov x4, 1                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 256                    // x inicial (columna)
	add x2, x26, 26                	    // y inicial (fila)
	mov x3, 26                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 258                    // x inicial (columna)
	add x2, x26, 28                	    // y inicial (fila)
	mov x3, 22                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 262                    // x inicial (columna)
	add x2, x26, 28                	    // y inicial (fila)
	mov x3, 14                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función
	//Cabeza
	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 262                    // x inicial (columna)
	add x2, x26, 30                	    // y inicial (fila)
	mov x3, 14                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 260                    // x inicial (columna)
	add x2, x26, 32                	    // y inicial (fila)
	mov x3, 18                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 258                    // x inicial (columna)
	add x2, x26, 34                	    // y inicial (fila)
	mov x3, 22                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 256                    // x inicial (columna)
	add x2, x26, 36                	    // y inicial (fila)
	mov x3, 26                	        // Ancho
	mov x4, 14                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x13, lsl 16     		    // Color Azul 0x131341
	movk x5, 0x1341, lsl 0
	add x1, x25, 256                    // x inicial (columna)
	add x2, x26, 50                	    // y inicial (fila)
	mov x3, 26                	        // Ancho
	mov x4, 1                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 258                    // x inicial (columna)
	add x2, x26, 50                	    // y inicial (fila)
	mov x3, 22                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x13, lsl 16     		    // Color Azul 0x131341
	movk x5, 0x1341, lsl 0
	add x1, x25, 258                    // x inicial (columna)
	add x2, x26, 52                	    // y inicial (fila)
	mov x3, 22                	        // Ancho
	mov x4, 1                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 260                    // x inicial (columna)
	add x2, x26, 52                	    // y inicial (fila)
	mov x3, 18                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x13, lsl 16     		    // Color Azul 0x131341
	movk x5, 0x1341, lsl 0
	add x1, x25, 260                    // x inicial (columna)
	add x2, x26, 54                	    // y inicial (fila)
	mov x3, 18                	        // Ancho
	mov x4, 1                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x0C, lsl 16     		    // Color Negro azulado 0x0C0F1E
	movk x5, 0x0F1E, lsl 0
	add x1, x25, 264                    // x inicial (columna)
	add x2, x26, 54                	    // y inicial (fila)
	mov x3, 10                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función
	
	movz x5, 0x13, lsl 16     		    // Color NAula0x131341
	movk x5, 0x1341, lsl 0
	add x1, x25, 264                    // x inicial (columna)
	add x2, x26, 56                	    // y inicial (fila)
	mov x3, 10                	        // Ancho
	mov x4, 1                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

//Relleno gris----------------------------------------------------------------------------
	//Piernas---------------------------------------------
	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 264                    // x inicial (columna)
	add x2, x26, 4                	    // y inicial (fila)
	mov x3, 10                	        // Ancho
	mov x4, 6                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 262                    // x inicial (columna)
	add x2, x26, 6                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 6                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 274                    // x inicial (columna)
	add x2, x26, 6                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 6                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 260                    // x inicial (columna)
	add x2, x26, 8                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 6                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 276                    // x inicial (columna)
	add x2, x26, 8                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 6                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 258                    // x inicial (columna)
	add x2, x26, 10                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 6                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 278                    // x inicial (columna)
	add x2, x26, 10                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 6                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 256                    // x inicial (columna)
	add x2, x26, 10                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 8                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 280                    // x inicial (columna)
	add x2, x26, 10                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 8                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 254                    // x inicial (columna)
	add x2, x26, 12                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 6                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 282                    // x inicial (columna)
	add x2, x26, 12                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 6                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 252                    // x inicial (columna)
	add x2, x26, 14                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 4                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 284                    // x inicial (columna)
	add x2, x26, 14                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 4                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	//Brazo-------------------------------------------------

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 264                    // x inicial (columna)
	add x2, x26, 12                	    // y inicial (fila)
	mov x3, 10               	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 264                    // x inicial (columna)
	add x2, x26, 16                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 4                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 272                    // x inicial (columna)
	add x2, x26, 16                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 4                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 262                    // x inicial (columna)
	add x2, x26, 16                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 6                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 274                    // x inicial (columna)
	add x2, x26, 16                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 6                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 260                    // x inicial (columna)
	add x2, x26, 16                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 8                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 276                    // x inicial (columna)
	add x2, x26, 16                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 8                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 258                    // x inicial (columna)
	add x2, x26, 18                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 10                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 278                    // x inicial (columna)
	add x2, x26, 18                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 10                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 256                    // x inicial (columna)
	add x2, x26, 22                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 4                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 280                    // x inicial (columna)
	add x2, x26, 22                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 4                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	//Pecho----------------------------------------------------

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 268                    // x inicial (columna)
	add x2, x26, 18                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 266                    // x inicial (columna)
	add x2, x26, 20                	    // y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 264                    // x inicial (columna)
	add x2, x26, 22                	    // y inicial (fila)
	mov x3, 10                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 262                    // x inicial (columna)
	add x2, x26, 24                	    // y inicial (fila)
	mov x3, 14                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 260                    // x inicial (columna)
	add x2, x26, 26                	    // y inicial (fila)
	mov x3, 18                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 262                    // x inicial (columna)
	add x2, x26, 28                	    // y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 272                    // x inicial (columna)
	add x2, x26, 28                	    // y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	//Cabeza

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 266                    // x inicial (columna)
	add x2, x26, 30                	    // y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 262                    // x inicial (columna)
	add x2, x26, 32                	    // y inicial (fila)
	mov x3, 14                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 260                    // x inicial (columna)
	add x2, x26, 34                	    // y inicial (fila)
	mov x3, 18                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 258                    // x inicial (columna)
	add x2, x26, 36                	    // y inicial (fila)
	mov x3, 22                	        // Ancho
	mov x4, 14                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 260                    // x inicial (columna)
	add x2, x26, 50                	    // y inicial (fila)
	mov x3, 18                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0x22, lsl 16     		    // Color Gris azulado 0x222B48
	movk x5, 0x2B48, lsl 0
	add x1, x25, 264                    // x inicial (columna)
	add x2, x26, 52                	    // y inicial (fila)
	mov x3, 10                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

//Rojo
	//PIES
	movz x5, 0xEC, lsl 16     		    // Color Rojizo 0xEC074A
	movk x5, 0x074A, lsl 0
	add x1, x25, 266                    // x inicial (columna)
	add x2, x26, 2                	    // y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 8                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función
	
	//ESCUDO
	movz x5, 0xEC, lsl 16     		    // Color Rojizo 0xEC074A
	movk x5, 0x074A, lsl 0
	add x1, x25, 268                    // x inicial (columna)
	add x2, x26, 20                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 8                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0xEC, lsl 16     		    // Color Rojizo 0xEC074A
	movk x5, 0x074A, lsl 0
	add x1, x25, 266                    // x inicial (columna)
	add x2, x26, 22                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0xEC, lsl 16     		    // Color Rojizo 0xEC074A
	movk x5, 0x074A, lsl 0
	add x1, x25, 270                    // x inicial (columna)
	add x2, x26, 22                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0xEC, lsl 16     		    // Color Rojizo 0xEC074A
	movk x5, 0x074A, lsl 0
	add x1, x25, 264                    // x inicial (columna)
	add x2, x26, 24                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0xEC, lsl 16     		    // Color Rojizo 0xEC074A
	movk x5, 0x074A, lsl 0
	add x1, x25, 272                    // x inicial (columna)
	add x2, x26, 24                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	//OJOS

	movz x5, 0xEC, lsl 16     		    // Color Rojizo 0xEC074A
	movk x5, 0x074A, lsl 0
	add x1, x25, 260                    // x inicial (columna)
	add x2, x26, 38                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 8                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0xEC, lsl 16     		    // Color Rojizo 0xEC074A
	movk x5, 0x074A, lsl 0
	add x1, x25, 276                    // x inicial (columna)
	add x2, x26, 38                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 8                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0xEC, lsl 16     		    // Color Rojizo 0xEC074A
	movk x5, 0x074A, lsl 0
	add x1, x25, 262                    // x inicial (columna)
	add x2, x26, 36                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 8                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0xEC, lsl 16     		    // Color Rojizo 0xEC074A
	movk x5, 0x074A, lsl 0
	add x1, x25, 274                    // x inicial (columna)
	add x2, x26, 36                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 8                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0xEC, lsl 16     		    // Color Rojizo 0xEC074A
	movk x5, 0x074A, lsl 0
	add x1, x25, 264                    // x inicial (columna)
	add x2, x26, 36                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 6                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0xEC, lsl 16     		    // Color Rojizo 0xEC074A
	movk x5, 0x074A, lsl 0
	add x1, x25, 272                    // x inicial (columna)
	add x2, x26, 36                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 6                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0xEC, lsl 16     		    // Color Rojizo 0xEC074A
	movk x5, 0x074A, lsl 0
	add x1, x25, 266                    // x inicial (columna)
	add x2, x26, 38                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0xEC, lsl 16     		    // Color Rojizo 0xEC074A
	movk x5, 0x074A, lsl 0
	add x1, x25, 270                    // x inicial (columna)
	add x2, x26, 38                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

//BLANCO
    //SOGA
	movz x5, 0xC6, lsl 16     		    // Color Blanco azulado 0xC6B2B2
	movk x5, 0xB2B2, lsl 0
	add x1, x25, 268                    // x inicial (columna)
	add x2, x26, 0                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 18                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0xC6, lsl 16     		    // Color Blanco azulado 0xC6B2B2
	movk x5, 0xB2B2, lsl 0
	add x1, x25, 266                    // x inicial (columna)
	add x2, x26, 14                	    // y inicial (fila)
	mov x3, 6                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	//OJOS

	movz x5, 0xC6, lsl 16     		    // Color Blanco azulado 0xC6B2B2
	movk x5, 0xB2B2, lsl 0
	add x1, x25, 262                    // x inicial (columna)
	add x2, x26, 38                	    // y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0xC6, lsl 16     		    // Color Blanco azulado 0xC6B2B2
	movk x5, 0xB2B2, lsl 0
	add x1, x25, 272                    // x inicial (columna)
	add x2, x26, 38                	    // y inicial (fila)
	mov x3, 4                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0xC6, lsl 16     		    // Color Blanco azulado 0xC6B2B2
	movk x5, 0xB2B2, lsl 0
	add x1, x25, 262                    // x inicial (columna)
	add x2, x26, 40                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función

	movz x5, 0xC6, lsl 16     		    // Color Blanco azulado 0xC6B2B2
	movk x5, 0xB2B2, lsl 0
	add x1, x25, 274                    // x inicial (columna)
	add x2, x26, 40                	    // y inicial (fila)
	mov x3, 2                	        // Ancho
	mov x4, 2                 	        // Alto
    bl dibujar_rectangulo      	        // Llamada función


    ldr x21, [sp, #0]                   // Restaura x21
    ldp x29, x30, [sp, #8]              // Restaura FP y LR
    add sp, sp, #24                     // Ajusta SP de vuelta

    ret
