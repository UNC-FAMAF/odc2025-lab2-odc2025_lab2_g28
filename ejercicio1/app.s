	.equ SCREEN_WIDTH,          640
	.equ SCREEN_HEIGHT,         480
	.equ BITS_PER_PIXEL,    32

	.equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
	.equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

	.globl main
    .extern dibujar_circulo
    .extern dibujar_pixel        
    .extern dibujar_nubes
    .extern dibujar_camino
    .extern dibujar_rectangulo   
	.extern dibujar_montaña
	.extern sombra_nubes
	.extern nubes_celestes
	.extern dibujar_triangulo
	
main:
	mov x20, x0       // Backup real del framebuffer base
	mov x21, x0       // x21 lo vamos a usar para escribir el fondo
	//---------------- FONDO AZUL ------------------------------------

	movz x10, 0x5B6E, lsl 16 // Color celeste para el cielo
	movk x10, 0xE1, lsl 0 

	mov x2, SCREEN_HEIGHT         // Y Size
loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:
	stur w10,[x21]  // Colorear el pixel N
	add x21,x21,4	   // Siguiente pixel
	sub x1,x1,1	   // Decrementar contador X
	cbnz x1,loop0  // Si no terminó la fila, salto
	sub x2,x2,1	   // Decrementar contador Y
	cbnz x2,loop1  // Si no es la última fila, salto


mov x0, x20     // Base framebuffer

bl nubes_celestes

mov x0, x20     // Base framebuffer

bl dibujar_nubes

mov x0, x20     // Base framebuffer

bl sombra_nubes

mov x0, x0     // Restaurar base framebuffer para siguiente llamada

bl dibujar_montaña

mov x0, x0     // Restaurar base framebuffer para siguiente llamada

bl dibujar_camino

mov x0, x0

bl avion

// Infinite Loop

InfLoop:
	b InfLoop


