.data
RNList: .zero 40
rand_state: .zero 4
base: .word SWITCHES_0_BASE  

.text

la t3 RNList
mv t5 t3

li t0 1664525
li t1 1013904223
li t6 10

la t2  SWITCHES_0_BASE
lwu t3 0(t2)

la t4 rand_state
sw t3 0(t4)

fill_vect:
    li t4 -1
loop:
    addi t4 t4 1
    beq t4 t6 end
    jal rand
    rem a0 a0 t6

    sw a0 0(t5)
    
    addi t5 t5 4
    
    j loop
rand:
    la t2, rand_state  
    lwu a0, 0(t2)
    mul a0 a0 t0
    add a0 a0 t1
    sw a0 0(t2)

    srli a0 a0 16
    
    ret

end:nop
