	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGHT, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl graffiti
	.extern dibujar_rectangulo

graffiti:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.

//cuadrado celeste fondo
	mov x21, x0
    mov x1, #560           // x_inicial
    mov x2, #305           // y_inicial 
    mov x3, #68                 //ancho 
    mov x4, #58                 //alto
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16

    bl dibujar_rectangulo
//cuadrado rojo letras
	mov x21, x0
    mov x1, #566           // x_inicial
    mov x2, #309           // y_inicial 
    mov x3, #58                 //ancho 
    mov x4, #48                 //alto
    movz w5, #0x2B28, lsl 0
    movk w5, #0xB8, lsl 16

    bl dibujar_rectangulo
//relleno celeste 

	mov x1, #594         	//x_inicial
    mov x2, #307       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

	mov x1, #564         	//x_inicial
    mov x2, #309       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_horizontal

	mov x1, #586         	//x_inicial
    mov x2, #309       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

	mov x1, #588         	//x_inicial
    mov x2, #309       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

	mov x1, #590         	//x_inicial
    mov x2, #309       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

	mov x1, #592         	//x_inicial
    mov x2, #309       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

	mov x1, #602         	//x_inicial
    mov x2, #309       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl cuadrado1

	mov x1, #624         	//x_inicial
    mov x2, #309       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_horizontal
	
	mov x1, #562         	//x_inicial
    mov x2, #311       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_horizontal

	mov x1, #624         	//x_inicial
    mov x2, #311       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

	mov x1, #560         	//x_inicial
    mov x2, #315       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_horizontal

	mov x1, #588         	//x_inicial
    mov x2, #315       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

	mov x1, #622         	//x_inicial
    mov x2, #309       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

	mov x1, #622         	//x_inicial
    mov x2, #313       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

	mov x1, #622         	//x_inicial
    mov x2, #317       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

	mov x1, #622         	//x_inicial
    mov x2, #321       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

	mov x1, #622         	//x_inicial
    mov x2, #325       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

	mov x1, #622         	//x_inicial
    mov x2, #329       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

	mov x1, #620         	//x_inicial
    mov x2, #317       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

	mov x1, #620         	//x_inicial
    mov x2, #321       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

	mov x1, #620         	//x_inicial
    mov x2, #325       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

	mov x1, #608         	//x_inicial
    mov x2, #323       		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_horizontal

	mov x1, #608         	//x_inicial
    mov x2, #321      		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_horizontal

	mov x1, #612         	//x_inicial
    mov x2, #321      		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_horizontal

	mov x1, #616        	//x_inicial
    mov x2, #321      		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_horizontal

	mov x1, #616        	//x_inicial
    mov x2, #331      		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_horizontal

	mov x1, #620        	//x_inicial
    mov x2, #327      		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

	mov x1, #584        	//x_inicial
    mov x2, #309     		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

	mov x1, #586        	//x_inicial
    mov x2, #313     		//y_inicial
    movz w5, #0x6588, lsl 0
    movk w5, #0x1E, lsl 16
	bl rectangulo_vertical

//contorno negro
    mov x1, #570         	//x_inicial
    mov x2, #307       		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #574         	//x_inicial
    mov x2, #307       		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #578         	//x_inicial
    mov x2, #307       		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #604         	//x_inicial
    mov x2, #307       		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal
	
	mov x1, #608         	//x_inicial
    mov x2, #307      		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #612         	//x_inicial
    mov x2, #307       		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #616         	//x_inicial
    mov x2, #307       		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #568         	//x_inicial
    mov x2, #309       		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #580         	//x_inicial
    mov x2, #309       		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #594         	//x_inicial
    mov x2, #309       		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #598         	//x_inicial
    mov x2, #309       		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #602         	//x_inicial
    mov x2, #309       		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #618         	//x_inicial
    mov x2, #309      		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #566         	//x_inicial
    mov x2, #311      		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #582         	//x_inicial
    mov x2, #311      		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #592         	//x_inicial
    mov x2, #311      		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #600         	//x_inicial
    mov x2, #311      		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #620         	//x_inicial
    mov x2, #311      		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #564         	//x_inicial
    mov x2, #313      		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #584        	//x_inicial
    mov x2, #313      		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #598         	//x_inicial
    mov x2, #313      		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #600         	//x_inicial
    mov x2, #313      		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #590         	//x_inicial
    mov x2, #313      		//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #572         	//x_inicial
    mov x2, #315        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #576         	//x_inicial
    mov x2, #315        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #588         	//x_inicial
    mov x2, #315        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #590         	//x_inicial
    mov x2, #315        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #608         	//x_inicial
    mov x2, #315			//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #612        	//x_inicial
    mov x2, #315        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #618         	//x_inicial
    mov x2, #315        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #564         	//x_inicial
    mov x2, #317        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #572         	//x_inicial
    mov x2, #317        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #584         	//x_inicial
    mov x2, #317        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #586         	//x_inicial
    mov x2, #317        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #598         	//x_inicial
    mov x2, #317        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #600         	//x_inicial
    mov x2, #317        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #606         	//x_inicial
    mov x2, #317        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #608         	//x_inicial
    mov x2, #317        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #610         	//x_inicial
    mov x2, #317        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #614         	//x_inicial
    mov x2, #317        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #616         	//x_inicial
    mov x2, #317        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #572        	//x_inicial
    mov x2, #319        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #576         	//x_inicial
    mov x2, #319        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #610         	//x_inicial
    mov x2, #319        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #614         	//x_inicial
    mov x2, #319        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #564         	//x_inicial
    mov x2, #321        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #572         	//x_inicial
    mov x2, #321        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #584         	//x_inicial
    mov x2, #321        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #590         	//x_inicial
    mov x2, #321        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #598         	//x_inicial
    mov x2, #321        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #600         	//x_inicial
    mov x2, #321        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #606         	//x_inicial
    mov x2, #321        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #576         	//x_inicial
    mov x2, #323        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #590         	//x_inicial
    mov x2, #323        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #614         	//x_inicial
    mov x2, #323        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #618         	//x_inicial
    mov x2, #323        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #564         	//x_inicial
    mov x2, #325        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #572         	//x_inicial
    mov x2, #325        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #584         	//x_inicial
    mov x2, #325        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #590         	//x_inicial
    mov x2, #325        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #598         	//x_inicial
    mov x2, #325        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #600         	//x_inicial
    mov x2, #325        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #608         	//x_inicial
    mov x2, #325        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #612         	//x_inicial
    mov x2, #325        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #582         	//x_inicial
    mov x2, #327        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #618         	//x_inicial
    mov x2, #327        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #564         	//x_inicial
    mov x2, #327        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #580        	//x_inicial
    mov x2, #327        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #584         	//x_inicial
    mov x2, #327        	/y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #598         	//x_inicial
    mov x2, #327        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #600         	//x_inicial
    mov x2, #327        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #602         	//x_inicial
    mov x2, #327        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #616         	//x_inicial
    mov x2, #327        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #566         	//x_inicial
    mov x2, #331        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #578         	//x_inicial
    mov x2, #331        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #582         	//x_inicial
    mov x2, #331        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #586         	//x_inicial
    mov x2, #331        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #592         	//x_inicial
    mov x2, #331        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #604         	//x_inicial
    mov x2, #331        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #614         	//x_inicial
    mov x2, #331        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #566         	//x_inicial
    mov x2, #333        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #570         	//x_inicial
    mov x2, #333        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #574         	//x_inicial
    mov x2, #333        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #584         	//x_inicial
    mov x2, #333        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #588         	//x_inicial
    mov x2, #333        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #594         	//x_inicial
    mov x2, #333        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #596         	//x_inicial
    mov x2, #333        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #600         	//x_inicial
    mov x2, #333        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #606         	//x_inicial
    mov x2, #333        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #610         	//x_inicial
    mov x2, #333        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #616         	//x_inicial
    mov x2, #333        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #564         	//x_inicial
    mov x2, #335        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #576         	//x_inicial
    mov x2, #335        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #580         	//x_inicial
    mov x2, #335        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #590         	//x_inicial
    mov x2, #335        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #606         	//x_inicial
    mov x2, #335        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #622         	//x_inicial
    mov x2, #335        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #564         	//x_inicial
    mov x2, #337        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #578         	//x_inicial
    mov x2, #337        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #592        	//x_inicial
    mov x2, #337        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #608         	//x_inicial
    mov x2, #337        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #622         	//x_inicial
    mov x2, #337        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #570         	//x_inicial
    mov x2, #339        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #572         	//x_inicial
    mov x2, #339        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #584         	//x_inicial
    mov x2, #339        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #598         	//x_inicial
    mov x2, #339        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #600         	//x_inicial
    mov x2, #339        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #614         	//x_inicial
    mov x2, #339        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #618         	//x_inicial
    mov x2, #339        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #564         	//x_inicial
    mov x2, #341        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #570         	//x_inicial
    mov x2, #341        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #578         	//x_inicial
    mov x2, #341        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #584        	//x_inicial
    mov x2, #341        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #592         	//x_inicial
    mov x2, #341        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #608         	//x_inicial
    mov x2, #341        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #614         	//x_inicial
    mov x2, #341        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #618         	//x_inicial
    mov x2, #341        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #566         	//x_inicial
    mov x2, #343        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #584         	//x_inicial
    mov x2, #343        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #594         	//x_inicial
    mov x2, #343        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #596         	//x_inicial
    mov x2, #343        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #620         	//x_inicial
    mov x2, #343        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #566        	//x_inicial
    mov x2, #345        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #576         	//x_inicial
    mov x2, #345        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #578         	//x_inicial
    mov x2, #345        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #584         	//x_inicial
    mov x2, #345        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #592         	//x_inicial
    mov x2, #345        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #594         	//x_inicial
    mov x2, #345        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #606         	//x_inicial
    mov x2, #345        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #622         	//x_inicial
    mov x2, #345        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #564         	//x_inicial
    mov x2, #347        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #574         	//x_inicial
    mov x2, #347        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #584         	//x_inicial
    mov x2, #347        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #604         	//x_inicial
    mov x2, #347        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #606         	//x_inicial
    mov x2, #347        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #610         	//x_inicial
    mov x2, #347        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #612         	//x_inicial
    mov x2, #347        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #614         	//x_inicial
    mov x2, #347        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #616         	//x_inicial
    mov x2, #347        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #594         	//x_inicial
    mov x2, #347        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #564         	//x_inicial
    mov x2, #349        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #572         	//x_inicial
    mov x2, #349        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #576         	//x_inicial
    mov x2, #349        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #584         	//x_inicial
    mov x2, #349        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #592         	//x_inicial
    mov x2, #349        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #602         	//x_inicial
    mov x2, #349        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #606         	//x_inicial
    mov x2, #349        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #622         	//x_inicial
    mov x2, #349        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #564         	//x_inicial
    mov x2, #351        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #578         	//x_inicial
    mov x2, #351        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #600         	//x_inicial
    mov x2, #351        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #604         	//x_inicial
    mov x2, #351        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #608         	//x_inicial
    mov x2, #351        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #592         	//x_inicial
    mov x2, #353        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #622         	//x_inicial
    mov x2, #353        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #564         	//x_inicial
    mov x2, #355        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #578         	//x_inicial
    mov x2, #355        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #590         	//x_inicial
    mov x2, #355        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #608         	//x_inicial
    mov x2, #355        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl cuadrado1

	mov x1, #620         	//x_inicial
    mov x2, #355        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_vertical

	mov x1, #564         	//x_inicial
    mov x2, #357        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #568         	//x_inicial
    mov x2, #357        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #572         	//x_inicial
    mov x2, #357        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #576         	//x_inicial
    mov x2, #357        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #580         	//x_inicial
    mov x2, #357        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #584        	//x_inicial
    mov x2, #357        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #588         	//x_inicial
    mov x2, #357        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #592         	//x_inicial
    mov x2, #357        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #596         	//x_inicial
    mov x2, #357        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #600         	//x_inicial
    mov x2, #357        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #604         	//x_inicial
    mov x2, #357        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #608         	//x_inicial
    mov x2, #357        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #612         	//x_inicial
    mov x2, #357        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #616         	//x_inicial
    mov x2, #357        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

	mov x1, #618         	//x_inicial
    mov x2, #333        	//y_inicial
    movz w5, #0x0000, lsl 0
    movk w5, #0x00, lsl 16
	bl rectangulo_horizontal

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

rectangulo_vertical:

    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.

    mov x7, #0

    add x1, x7, x1      // x_inicial
    add x2, x7, x2      // y_inicial
    mov x3, #2          //ancho 
    mov x4, #4          //alto
    mov w5, w5
    bl dibujar_rectangulo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

rectangulo_horizontal:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.

    mov x7, #0

    add x1, x7, x1       // x_inicial
    add x2, x7, x2       // y_inicial
    mov x3, #4           //ancho 
    mov x4, #2           //alto
    mov w5, w5

    bl dibujar_rectangulo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

cuadrado1:
//--------------------- CUADRADO 1X1 ------------------------------------

    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.

    mov x7, #0

    add x1, x7, x1      // x_inicial
    add x2, x7, x2      // y_inicial
    mov x3, #2          //ancho 
    mov x4, #2          //alto
    mov w5, w5

    bl dibujar_rectangulo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

cuadrado2:
//--------------------- CUADRADO 2X2 ------------------------------------
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.

    mov x7, #0

    add x1, x7, x1         // x_inicial
    add x2, x7, x2         // y_inicial
    mov x3, #4             //ancho 
    mov x4, #4             //alto
    mov w5, w5

    bl dibujar_rectangulo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

    