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
	.extern graffiti
	.extern hello_kitty
	.extern spiderman_baja
	.extern spiderman_quieto
	.extern spiderman_sube
	.extern kitty_beso
	.extern animar_ventanas

main:

	sub sp, sp, #16       		// Ajusta SP para guardar FP y LR
    stp x29, x30, [sp, #0] 		// Guarda Frame Pointer (FP) y Link Register (LR)
    add x29, sp, #0       		// Establece FP al inicio del stack frame

	// x0 contiene la direccion base del framebuffer

 	mov x21, x0					// Guarda la dirección base del framebuffer en x20
	mov x20, x21 				// Copia temporal

 
	// ------------- FONDO DEL CIELO --------------------


    mov x0, x21                         // framebuffer base (pasado a dibujar_rectangulo)
    movz w5, 0x449D                     // Color cielo (un celeste/azul claro)
    movk w5, 0xFF44, lsl 16
    mov x1, 0                          // x inicial
    mov x2, 0                          // y inicial
    mov x3, SCREEN_WIDTH               // Ancho
    mov x4, SCREEN_HEIGHT              // Alto
    bl dibujar_rectangulo               // Limpia toda la pantalla con el color del cielo


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
	bl farola

	mov x0, x21
	bl ventanas_y_puerta

	mov x0, x21
	bl graffiti
anim_loop:

	mov x0, x21
	mov x25, -17
	mov x26, -18
	bl hello_kitty

	mov x0, x21
	bl spiderman_baja

	mov x0, x21
	bl spiderman_quieto

	mov x0, x21
	mov x25, 8
	mov x26, -10
	bl kitty_beso
	
	bl animar_ventanas

	mov x0, x21
	mov x25, -17
	mov x26, -18
	bl hello_kitty

	mov x0, x21
	bl spiderman_sube

InfLoop:
	b anim_loop
	