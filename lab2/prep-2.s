.data

.equ NUM_ELEMS 7
vect: .word 6,-25,14,127,-31,43,17

.text

la x5 vect        # x5 end vector
mv x6 x5          # x6 copia end vector
li x7 NUM_ELEMS   # x7 NUM_ELEMS
addi x7 x7 -1     # sub 1 a NUM_ELEMS pq 1º load fora do loop
li x8 0           # x8 contador

lw x9 0(x6)       # x9 1º elemento vector

loop_vect:
    beq x8 x7 end   # contador = NUM_ELEMS
    addi x6 x6 4
    lw x10 0(x6)    # x10 carregar elemento seguinte
    
    addi x8 x8 1
    
    
    blt x10 x9 update

    j loop_vect
    
update:
    mv x9 x10
    j loop_vect
    
end:
    j end
