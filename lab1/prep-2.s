.data
line:   .byte 9          
yellow: .word 0xFFFF00
LEDMatrixBase:   .word   LED_MATRIX_0_BASE
LEDMatrixWidth:  .byte   LED_MATRIX_0_WIDTH


.text

# largura da matriz (35)       x6  WIDTH
la x5, LEDMatrixWidth
lbu x6, 0(x5)      

# linha onde escrever          x7  R
la x5, line
lbu x7, 0(x5)

#endereço base                 x8  BASE
la x5, LEDMatrixBase
lwu x8, 0(x5)

# calculo da coluna inicial    x9  C
# coluna = (width - 7) / 2
addi x9, x6, -7  # -7
srli x9, x9, 1   # /2

# endereço de memoria onde escrever (linha, coluna)
mul x6, x6, x7
add x6, x6, x9
slli x6, x6, 2
add x6, x6, x8

#cor amarelo                   x10 YELLOW
la x5, yellow
lwu x10, 0(x5)


sw x10,  0(x6)
sw x10,  4(x6)
sw x10,  8(x6)
sw x10, 12(x6)
sw x10, 16(x6)
sw x10, 20(x6)
sw x10, 24(x6)

Fim:
j Fim
 
ecall





