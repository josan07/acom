.data
A: .word 4 -1 5 3 6 -6
N: .word 6


.text

la x5 A #endereço vector
lw x6 N #N 


###### outer loop ######
outer_loop: 
li x7 0 #n_trocas=0

li x8 1 #i=1

###### inner loop ######

inner_loop:
    bge x8 x6 end_inner_loop

    slli x9 x8 2 # 4*i
    add x9 x9 x5 # posicao [+i]    i*4 pq .word
    
    lw x10 0(x9)   # A[i]
    lw x11 -4(x9)  # A[i-1]


    addi x8 x8 1 #i++

    bge x10 x11 inner_loop
    sw x11 0(x9)  # guardar A[i-1] em A[i]
    sw x10 -4(x9)  # guardar A[i] em A[i-1]
    
    addi x7 x7 1  #n_trocas=1
    

    j inner_loop


###### end inner loop ######

end_inner_loop:
    beqz x7 end
    
    j outer_loop
    
    
end:
    j end
