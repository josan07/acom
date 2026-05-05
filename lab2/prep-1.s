.data
vector: .word 10, 20, 30, 40
N: .word 4


.text
la x5 vector   # x5 endereço vector

li x6 0        # x6 init soma
li x7 0        # x7 init contador

lw x8 N        # x8 N

mv x9 x5       # x9 copia endereço vector

vector_loop:
    lw x10 0(x9)
    
    add x6 x6 x10
    addi x7 x7 1
    
    beq x7 x8 end_loop
    
    addi x9 x9 4
    
    j vector_loop

end_loop:
    div x6 x6 x7
    
