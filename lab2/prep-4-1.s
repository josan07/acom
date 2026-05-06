 .data
 BackgroundColor: .word 0x00FAFAFA

LEDMatrixBase: .word LED_MATRIX_0_BASE

LEDMatrixWidth: .byte LED_MATRIX_0_WIDTH

LEDMatrixHeight: .byte LED_MATRIX_0_HEIGHT


.text


la x10 BackgroundColor

lwu x10 0(x10)


la x5 LEDMatrixWidth
lbu x5 0(x5)

la x6 LEDMatrixHeight
lbu x6 0(x6)

mul x7 x5 x6 #n.º celulas


la x8 LEDMatrixBase
lwu x8 0(x8)



li x9 0 #i=0


for:

beq x9 x7 end

sw x10 0(x8)

addi x8 x8 4

addi x9 x9 1

j for


end:

j end

