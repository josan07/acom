.data
SwitchesBase:    .word   SWITCHES_0_BASE
color:           .word   0xFFFF00
LEDMatrixBase:   .word   LED_MATRIX_0_BASE
LEDMatrixWidth:  .byte   LED_MATRIX_0_WIDTH
LEDMatrixHeight: .byte   LED_MATRIX_0_HEIGHT

.text
la x5, SwitchesBase
lwu x17, 0(x5)
lwu x17, 0(x17) 
  

la x5, LEDMatrixBase
lwu x8, 0(x5)

la x5, LEDMatrixWidth
lbu x6, 0(x5)

la x5, color
lwu x10, 0(x5)

andi x7,  x17, 0x00F   # bits 3:0

andi x9,  x17, 0x0F0   # bits 7:4
srli x9, x9, 4

andi x11, x17, 0x100   # bit  8
srli x11, x11, 8

beqz x11, Fim

mul x18, x6, x7
add x18, x18, x9 
slli x18, x18, 2 
add x18, x18, x8

sw x10,  0(x18)

Fim:  
    j Fim
