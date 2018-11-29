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

    LDR  r8, zero @expLoop iteration
    LDR  r9, zero @mulLoop iteration

expLoop: @for(int i = r8, i < r1, i++)
    LDR  r3, zero @reset mul product
    LDR  r9, zero @reset mul iterator

mulLoop: @for(int j = r9, j < r2, j++)
    ADD  r3, r0 @add base to mulproduct
    ADD  r9, #1 @j++
    CMP  r9, r2 @i < r2?
    BLT  mulLoop

    MOV  r2, r3 @move new product to final result holder
    ADD  r8, #1 @i++
    CMP  r8, r1 @i < r1?
    BLT  expLoop





end:
    SWI  SWI_Exit
