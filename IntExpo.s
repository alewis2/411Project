@variables
.equ SWI_Exit,  0x11
 e:
    .INT 178145 @e * 2^16
    
_start:
    LDR  r0, e @set base
    MOV  r1, #196608 @set exponent (3 * 2^16)

    MOV  r2, #65536 @set power result to 0
    MOV  r3, #0 @set mul product to 0

    MOV  r8, #0 @expLoop iteration
    MOV  r9, #0 @mulLoop iteration

expLoop: @for(int i = r8, i < r1, i++)
    MOV  r3, #0 @reset mul product
    MOV  r9, #0 @reset mul iterator

mulLoop: @for(int j = r9, j < r2, j++)
    ADD  r3, r0 @add base to mulproduct
    ADD  r9, #65536 @j++
    CMP  r9, r2 @i < r2?
    BLT  mulLoop

    MOV  r2, r3 @move new product to final result holder
    ADD  r8, #65536 @i++
    CMP  r8, r1 @i < r1?
    BLT  expLoop





end:
    SWI  SWI_Exit
