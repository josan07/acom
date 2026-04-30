.data
a: .word 20
b: .half -14
c: .byte 4
res: .zero 64

.text

la x7, res
ld x7,0(x7)

lw x6,a
add x5, x5, x6

lb x6, c
mul x5, x5, x6

lh x6, b
add, x5, x5, x6

srli, x5, x5, 1

sw x5, 0(x7)

loop: j loop
