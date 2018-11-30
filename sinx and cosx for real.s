@CMSC 411 Arm Project
@Ryan Siegel and Aaron Lewis
@Sin(x), Cos(x), Sinh(x), Cosh(x), and e^x in armv5
@


startAngle: @angle to do operations on
	@.int 45 @starting with 45 degrees because its simple
	@45.5 from his email
	.int 2981888

ag_const:
	@.float 0.6072529350
	.int 39796
	
@currAngle
@	.float 28.027
	
main:
	LDR  r0, startAngle
	MOV r1, #0 @starting index
	MOV r2, #12 @hardcoded index
	LDR r3, ag_const @ X in C example
	MOV r4, #0 @ Y in C example
	LDR r6, =A @ address of alpha
	LDR r7, [r6] @ get value of Alpha
	
	@	LDR r2, =N @ get address for N
	@	LDR r1, [r2] @ get value of N

loop: @for(int i = 0, i < 12, i++) r1 is 1, r2 is 12
	@ADD r0, #20 @test statement
	@CMP r0, #0 @if the angle is greater than 0
	@ADD r0, #20
	@BGT loop
	
	LSR r4, r1
	SUB r5, r3,r4
	LSR r3, r1
	ADD r4, r4,r3
	
	LDR r8, [r6, r1] @load r8 with alpha[i]
	SUB r0, r0, r8
	
	ADD r1, #1 @increment i
	CMP r1, r2 @if r1 = r2 then break
	
	BLT loop
	
	.data
@A:	.word 45.0, 26.565, 14.0362, 7.12502, 3.57633, 1.78991, 0.895174, 0.447614, 0.223811, 0.111906, 0.055953, 0.027977
A: .word 2949120, 1740963, 919876, 466945, 234378, 117303, 58666, 29334, 14667, 7333, 3666, 1833
@AH: .word A: .word 2949120, 1740963, 919876, 466945, 234378, 234378, 117303, 58666, 29334, 14667, 7333, 3666
@A:	.word 1, 3, 5, 7, 9
	.end