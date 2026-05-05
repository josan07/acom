.data
vector: .word 10,20
N: .word 2

.text

la x12 vector    # x5 vector 

la x10 N
lw x10 0(x10)   # x10 N

li x6 0         # x6 soma
li x7 0         # x7 contador

mv x8 x12        # copiar endereço vector

loop:
    lw x9 0(x8)
    add x6 x6 x9
    addi x7 x7 1
    
    
    addi x8 x8 4
    beq x7 x10 end_loop
    
    j loop   
    
end_loop:
    div x6 x6 x7
    

