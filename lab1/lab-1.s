.data
a: .word 20
b: .half -14
c: .byte 4
res: .zero 64


# (a*c + b) / 2
.text

la x10, a
lw x5, 0(x10)
lh x6, 4(x10)
lb x7, 6(x10)
lw x8, 7(x10)


mul x5, x5, x7
add x5, x5, x6
srli x5 , x5 , 1


sw x5, 0(x10)

loop: j loop
