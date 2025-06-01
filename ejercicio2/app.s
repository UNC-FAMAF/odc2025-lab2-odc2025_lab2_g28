	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGHT, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl main
	.extern dibujar_rectangulo
	.extern nubes
	.extern edificio
	.extern edificio_detalle
	.extern animar_ventanas
	.extern sombra
	.extern farola
	.extern luz

main:

	sub sp, sp, #16       		// Ajusta SP para guardar FP y LR
    stp x29, x30, [sp, #0] 		// Guarda Frame Pointer (FP) y Link Register (LR)
    add x29, sp, #0       		// Establece FP al inicio del stack frame

// x0 contiene la direccion base del framebuffer

 	mov x21, x0					// Guarda la dirección base del framebuffer en x20
	mov x20, x21 				// Copia temporal

	movz x10, 0x449D
	movk x10, 0xFF44, lsl 16

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
	movz w5, 0x4AAA     		// Color cielo intermedio
	movk w5, 0xFF4A, lsl 16
	mov x1, 100                 // x inicial (columna)
	mov x2, 100                	// y inicial (fila)
	mov x3, 640                	// Ancho
	mov x4, 200                 // Alto
	bl dibujar_rectangulo      	// Llamada función

	mov x0, x21                	// Guarda la dirección base del framebuffer en x0
	movz w5, 0x4AAA     		// Color cielo intermedio
	movk w5, 0xFF4A, lsl 16
	mov x1, 97                  // x inicial (columna)
	mov x2, 97                	// y inicial (fila)
	mov x3, 640                	// Ancho
	mov x4, 2                 	// Alto
	bl dibujar_rectangulo      	// Llamada función

	mov x0, x21                	// Guarda la dirección base del framebuffer en x0
	movz w5, 0x4AAA     		// Color cielo intermedio
	movk w5, 0xFF4A, lsl 16
	mov x1, 85                  // x inicial (columna)
	mov x2, 85                	// y inicial (fila)
	mov x3, 640                	// Ancho
	mov x4, 10                 	// Alto
	bl dibujar_rectangulo      	// Llamada función

	mov x0, x21                	// Guarda la dirección base del framebuffer en x0
	movz w5, 0x4AAA     		// Color cielo intermedio
	movk w5, 0xFF4A, lsl 16
	mov x1, 105                 // x inicial (columna)
	mov x2, 105               	// y inicial (fila)
	mov x3, 640                	// Ancho
	mov x4, 5                 	// Alto
	bl dibujar_rectangulo      	// Llamada función

	mov x0, x21                	// Guarda la dirección base del framebuffer en x0
	movz w5, 0x4AAA     		// Color cielo intermedio
	movk w5, 0xFF4A, lsl 16
	mov x1, 80                  // x inicial (columna)
	mov x2, 80                	// y inicial (fila)
	mov x3, 640                	// Ancho
	mov x4, 2                 	// Alto
	bl dibujar_rectangulo      	// Llamada función

	mov x0, x21
	bl nubes

// ------------------------ COLOR GRIS OSCURO PARA EL PISO -------------------

	mov x0, x21                	// Guarda la dirección base del framebuffer en x0
	movz w5, 0x273E     		// Color azul oscuro 
	movk w5, 0xFF2F, lsl 16
	mov x1, 0                  	// x inicial (columna)
	mov x2, 380                	// y inicial (fila)
	mov x3, SCREEN_WIDTH             	// Ancho
	mov x4, 100        // Alto
	bl dibujar_rectangulo      	// Llamada función

// --------------------- MURO DE LA DERECHA -----------------------

    mov x0, x21                         // framebuffer base
    movz w5, 0x2E74                     // Color morado 
    movk w5, 0xFF2E, lsl 16
    mov x1, 540                         // x inicial 
    mov x2, 180                         // y inicial 
    mov x3, 100                         // Ancho 
    mov x4, 280                         // Alto 
    bl dibujar_rectangulo

// ---------------------- EDIFICIO 2 (DE DETRÁS) ----------------------------

	mov x0, x21                       	// Guarda la dirección base del framebuffer en x0
	movz w5, 0x1341     		        // Color azul oscuro 
	movk w5, 0xFF13, lsl 16
	mov x1, 74                        	// x inicial (columna)
	mov x2, 0                       	// y inicial (fila)
	mov x3, 270                     	// Ancho
	mov x4, 410              			// Alto
	bl dibujar_rectangulo            	// Llamada función

	//SOMBRA
    movk x5, 0x16, lsl 16
    movk x5, 0x164B
	mov x1, 83                          // x inicial
	mov x2, 409                         // y inicial
	mov x3, 263                         // Ancho de la base
	mov x4, 263                         // Alto
	mov x6, -1
	bl dibujar_paralelogramo

// ---------------------- COLOR BASE EDIFICIO ----------------------------

	mov x0, x21                       	// Guarda la dirección base del framebuffer en x0
	movz w5, 0x264F     	         	// Color azul oscuro 
	movk w5, 0xFF24, lsl 16
	mov x1, 0                       	// x inicial (columna)
	mov x2, 0                       	// y inicial (fila)
	mov x3, 260                     	// Ancho
	mov x4, 420        		        	// Alto
	bl dibujar_rectangulo           	// Llamada función

	mov x0, x21
	bl edificio

	mov x0, x21
	bl sombra

	mov x0, x21
	bl edificio_detalle

	mov x0, x21
	bl edificio2_detalle
	
	mov x0, x21
	bl farola

	mov x0, x21
	bl luz

	mov x0, x21
	bl spiderman
	




	mov x0, x21
	//bl animar_ventanas



// Infinite Loop

InfLoop:
	b InfLoop
	