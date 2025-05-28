	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGHT, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl main
	.extern dibujar_rectangulo

main:
// x0 contiene la direccion base del framebuffer

 	mov x20, x0					// Guarda la dirección base del framebuffer en x20
	mov x21, x0 				// Segundo backup del framebuffer

	movz x10, 0x62B7
	movk x10, 0xFF6A, lsl 16

	mov x2, SCREEN_HEIGHT      	// Y Size
loop1:
	mov x1, SCREEN_WIDTH      	// X Size
loop0:

// ------------- FONDO DEL CIELO --------------------

	mov x0, x20
	stur w10,[x20]  			// Colorear el pixel N
	add x20,x20,4	   			// Siguiente pixel
	sub x1,x1,1	   				// Decrementar contador X
	cbnz x1,loop0  				// Si no terminó la fila, salto
	sub x2,x2,1	   				// Decrementar contador Y
	cbnz x2,loop1  				// Si no es la última fila, salto

// ------------------ COLOR DE TRANSICIÓN DEL CIELO -------------------

	mov x0, x21                	// Guarda la dirección base del framebuffer en x0
	movz x12, 0x69C4     		// Color cielo intermedio
	movk x12, 0xFF72, lsl 16
	mov x2, 100                 // x inicial (columna)
	mov x3, 100                	// y inicial (fila)
	mov x4, 640                	// Ancho
	mov x5, 200                 // Alto
	bl dibujar_rectangulo      	// Llamada función

	mov x0, x21                	// Guarda la dirección base del framebuffer en x0
	movz x12, 0x69C4     		// Color cielo intermedio
	movk x12, 0xFF72, lsl 16
	mov x2, 97                  // x inicial (columna)
	mov x3, 97                	// y inicial (fila)
	mov x4, 640                	// Ancho
	mov x5, 2                 	// Alto
	bl dibujar_rectangulo      	// Llamada función

	mov x0, x21                	// Guarda la dirección base del framebuffer en x0
	movz x12, 0x69C4     		// Color cielo intermedio
	movk x12, 0xFF72, lsl 16
	mov x2, 85                  // x inicial (columna)
	mov x3, 85                	// y inicial (fila)
	mov x4, 640                	// Ancho
	mov x5, 10                 	// Alto
	bl dibujar_rectangulo      	// Llamada función

	mov x0, x21                	// Guarda la dirección base del framebuffer en x0
	movz x12, 0x62B7     		// Color cielo intermedio
	movk x12, 0xFF6A, lsl 16
	mov x2, 105                 // x inicial (columna)
	mov x3, 105               	// y inicial (fila)
	mov x4, 640                	// Ancho
	mov x5, 5                 	// Alto
	bl dibujar_rectangulo      	// Llamada función

	mov x0, x21                	// Guarda la dirección base del framebuffer en x0
	movz x12, 0x69C4     		// Color cielo intermedio
	movk x12, 0xFF72, lsl 16
	mov x2, 80                  // x inicial (columna)
	mov x3, 80                	// y inicial (fila)
	mov x4, 640                	// Ancho
	mov x5, 2                 	// Alto
	bl dibujar_rectangulo      	// Llamada función

	mov x0, x21
	bl nubes

// ---------------------- COLOR BASE EDIFICIO ----------------------------

	mov x0, x21                	// Guarda la dirección base del framebuffer en x0
	movz x12, 0x255B     		// Color azul oscuro 
	movk x12, 0xFF25, lsl 16
	mov x2, 0                  	// x inicial (columna)
	mov x3, 0                	// y inicial (fila)
	mov x4, 250             	// Ancho
	mov x5, SCREEN_WIDTH        // Alto
	bl dibujar_rectangulo      	// Llamada función

//  

// Infinite Loop

InfLoop:
	b InfLoop
