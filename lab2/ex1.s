.data
width: .word LED_MATRIX_0_WIDTH
base: .word LED_MATRIX_0_BASE
color: .word 0x0000ff00


.text

la x5 width
lwu x5 0(x5)
 
la x6 base
lwu x6 0(x6)
li x8 0 # i=0

addi x9 x5 1  
slli x9 x9 2 #adicionar à base a cada led

la x14 color
lwu x10 0(x14)

div x12 x10 x5


loop:
beq x8 x5 end
sw x10 0(x6)
add x6 x6 x9

sub x10 x10 x12 #update cor

addi x8 x8 1 #i++

j loop

end:
    j end
