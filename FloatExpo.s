@variables
.equ SWI_Exit,  0x11
e:
    .float 2.718
zero:
    .float 0
one:
    .float 1
inputExpo:
    .float 1.5

_start:
    VLDR.F32 s0, e @set base
    VLDR.F32 s1, inputExpo @set exponent

    VLDR.F32  s2, one @set power result to 0
    VLDR.F32  s3, zero @set mul product to 0
    VLDR.F32  s4, one @set to 1 float

    VLDR.F32  s6, zero @expLoop iteration
    VLDR.F32  s7, zero @mulLoop iteration

expLoop: @for(int i = r6, i < r1, i++)
    VLDR.F32  s3, zero @reset mul product
    VLDR.F32  s7, zero @reset mul iterator

mulLoop: @for(int j = r7, j < r2, j++)
    VADD.F32  s3, s0 @add base to mulproduct
    VADD.F32  s7, s4 @j++
    VCMP  s7, s2 @i < r2?
    BLT  mulLoop

    VMOV.F32  s2, s3 @move new product to final result holder
    VADD.F32  s6, s4 @i++
    VCMP  s6, s1 @i < r1?
    BLT  expLoop





end:
    swi  SWI_Exit
