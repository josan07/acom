.data
mbase: .word LED_MATRIX_0_BASE
mwidth: .byte LED_MATRIX_0_WIDTH
mheight: .byte LED_MATRIX_0_HEIGHT
  

.text 
la x5 mbase
lwu x5 0(x5)
mv x8 x5

la x6 mwidth
lbu x6 0(x6)

la x7 mheight
lbu x7 0(x7)

li x10 0x00ff00 #cor

jal ra FillMatrix

j end

FillMatrix:
    mul x18 x6 x7
    li x19 0
    
fill_loop:
    beq x19 x18 end
    addi x19 x19 1
    sw x10 0(x8)
    addi x8 x8 4
    j fill_loop
    
end: j end
