@variables
.equ SWI_Exit,  0x11
 e:
    .float .25
 zero:
    .float 0
    
_start:
    LDR  r0, e @set base
    MOV  r1, #3 @set exponent

    MOV  r2, #1 @set power result to 0
    LDR  r3, zero @set mul product to 0

    LDR  r6, zero @expLoop iteration
    LDR  r7, zero @mulLoop iteration

expLoop: @for(int i = r6, i < r1, i++)
    LDR  r3, zero @reset mul product
    LDR  r7, zero @reset mul iterator

mulLoop: @for(int j = r7, j < r2, j++)
    ADD  r3, r0 @add base to mulproduct
    ADD  r7, #1 @j++
    CMP  r7, r2 @i < r2?
    BLT  mulLoop

    MOV  r2, r3 @move new product to final result holder
    ADD  r6, #1 @i++
    CMP  r6, r1 @i < r1?
    BLT  expLoop





end:
    SWI  SWI_Exit
