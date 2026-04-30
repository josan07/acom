.data
side: .word LED_MATRIX_0_HEIGHT
base: .word LED_MATRIX_0_BASE



.text

la x5 base
lwu x5 0(x5) 

la x6 side
lwu x6 0(x6)

slli x10 x6 2 # width * 4 (incremento bases)


#addi x9 x6 -1 # pos. penultimo elem
#slli x9 x6 2

#add x7 x5 x9 #penultima base bytes (1a linha)


addi x9 x6 -2
slli x9 x9 2 
add x7 x9 x5

li x11 0xFF0000 # cor1
li x12 0x00ff00 # cor2

li x8 0 

loop:
beq x8 x6 loop_end # if x8>x6 saltar p/ end

sw x11 0(x5) 
sw x11 4(x5) 
sw x12 0(x7)
sw x12 4(x7)



add x5 x5 x10 #avancar 1.a uma linha
add x7 x7 x10 #avancar pen uma linha




addi x8 x8 1 # x8++

j loop


loop_end:
    
    
    
    j loop_end
