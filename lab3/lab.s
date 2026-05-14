.data
v: .word 1 2 3
N: .word 3 
stats: .word 0 0 0 0


.text


la a4 stats

lw a5 N

la a6 v

call OddSeq

li a7 10
ecall



OddSeq:
    #inicio pilha
    
    addi sp sp -20
    sw ra , 16(sp)
    sw s2 8(sp) # last
    sw s3 4(sp) 
    sw s4 0(sp)  
    mv t3 a6 #copia endereço v
    
    
    li t0 0 #i=0
    li t1 0 #auxmaximo=0
    li s3 0 #soma=0
    
for:
    
    bge t0 a5 for_tail #if i>=N
    lw t4 0(t3) #v[i]
    mv a0 t4
    call odd #odd (v[i])
    mv t4 a0 #v[i]=odd(v[i])
    
    bne t0 zero cont 
store_first:
    mv a1 t4
cont:
    ble t4 t1 max
    mv t1 t4  
max:
    j sum
sum: 
    add s3 s3 t4
      
    addi t3 t3 4
    addi t0 t0 1
    j for
for_tail:
    div s3 s3 a5 #media
    mv s2 t4 
    mv s4 t1

    lw s1 12(sp) #first 
    
    mv a2 s2
    lw s2 8(sp) #last
    
    mv a3 s3
    lw s3 4(sp) #avg
    
    mv a4 s4
    lw s4 0(sp) # max 
    sw ra , 16(sp) 
    addi sp sp 20
    ret
    



odd:
 
li t2 , 2

remu t6 , a0 , t2
beq t6 , x0 , zero

ret #return a0

zero:
addi a0 , a0 , 1

ret #return a0


