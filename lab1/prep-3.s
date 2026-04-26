.data
line:   .byte 9          
yellow: .word 0xFFFF00
red: .word 0xFF0000
LEDMatrixBase:   .word   LED_MATRIX_0_BASE
LEDMatrixWidth:  .byte   LED_MATRIX_0_WIDTH
LEDMatrixHeight:  .byte   LED_MATRIX_0_HEIGHT


#largura x6
#altura  x12
#base    x8
#cor     x10
#posR    x7
#posC    x9
#pos     x18


.text

# largura da matriz (35) 
la x5, LEDMatrixWidth
lbu x6, 0(x5)      

# linha onde escrever  
la x5, LEDMatrixHeight
lbu x12, 0(x5)
srai x7, x12, 1

#endereço base               
la x5, LEDMatrixBase
lwu x8, 0(x5)

# calculo da coluna inicial 
# coluna = (width - 7) / 2
addi x9, x6, -7  # -7
srli x9, x9, 1   # /2

# endereço de memoria onde escrever (linha, coluna)
mul x18, x6, x7
add x18, x18, x9
slli x18, x18, 2 
add x18, x18, x8

#cor amarelo                 
la x5, yellow
lwu x10, 0(x5)


sw x10,  0(x18)
sw x10,  4(x18)
sw x10,  8(x18)
sw x10, 12(x18)
sw x10, 16(x18)
sw x10, 20(x18)
sw x10, 24(x18)


la x5, red
lwu x10, 0(x5)

#1
addi x5, x6, -1
srai x9, x5, 1   #calculo da coluna do meio
addi x7, x7, -3

mul x18, x6, x7
add x18, x18, x9
slli x18, x18, 2 
add x18, x18, x8

sw x10, 0(x18)
#2

addi x7, x7, 1 

mul x18, x6, x7
add x18, x18, x9
slli x18, x18, 2 
add x18, x18, x8

sw x10, 0(x18)
#2

addi x7, x7, 1

mul x18, x6, x7
add x18, x18, x9
slli x18, x18, 2 
add x18, x18, x8

sw x10, 0(x18)
#2

addi x7, x7, 2

mul x18, x6, x7
add x18, x18, x9
slli x18, x18, 2 
add x18, x18, x8

sw x10, 0(x18)
#2

addi x7, x7, 1

mul x18, x6, x7
add x18, x18, x9
slli x18, x18, 2 
add x18, x18, x8

sw x10, 0(x18)
#2

addi x7, x7, 1

mul x18, x6, x7
add x18, x18, x9
slli x18, x18, 2 
add x18, x18, x8

sw x10, 0(x18) 

 
Fim:
j Fim
 
ecall




