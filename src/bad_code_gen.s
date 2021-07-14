	.text
	.def	 @feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
.set @feat.00, 0
	.file	"bad_code_gen.1cb7e927-cgu.0"
	.def	 _ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hdf7e39fdf5ab97b7E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hdf7e39fdf5ab97b7E
	.p2align	4, 0x90
_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hdf7e39fdf5ab97b7E:
	movabsq	$-5596821061263218879, %rax
	retq

	.def	 _ZN4core3ptr24drop_in_place$LT$u32$GT$17h049ecb037a4ba0ddE;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN4core3ptr24drop_in_place$LT$u32$GT$17h049ecb037a4ba0ddE
	.p2align	4, 0x90
_ZN4core3ptr24drop_in_place$LT$u32$GT$17h049ecb037a4ba0ddE:
	retq

	.def	 _ZN12bad_code_gen15works_correctly17h7c544f701055a5adE;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN12bad_code_gen15works_correctly17h7c544f701055a5adE
	.globl	_ZN12bad_code_gen15works_correctly17h7c544f701055a5adE
	.p2align	4, 0x90
_ZN12bad_code_gen15works_correctly17h7c544f701055a5adE:
	.p2align	4, 0x90
.LBB2_1:
	jmp	.LBB2_1

	.def	 _ZN12bad_code_gen6broken17hcc0e964ba9d7b34fE;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN12bad_code_gen6broken17hcc0e964ba9d7b34fE
	.globl	_ZN12bad_code_gen6broken17hcc0e964ba9d7b34fE
	.p2align	4, 0x90
_ZN12bad_code_gen6broken17hcc0e964ba9d7b34fE:
	movl	$3735928559, %eax
	cmpq	%rax, __unnamed_1(%rip)
	jne	.LBB3_1
	.p2align	4, 0x90
.LBB3_2:
	jmp	.LBB3_2
.LBB3_1:
	retq

	.section	.rdata,"dr",one_only,__unnamed_2
	.p2align	3
__unnamed_2:
	.quad	_ZN4core3ptr24drop_in_place$LT$u32$GT$17h049ecb037a4ba0ddE
	.asciz	"\004\000\000\000\000\000\000\000\004\000\000\000\000\000\000"
	.quad	_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hdf7e39fdf5ab97b7E

	.section	.rdata,"dr",one_only,__unnamed_1
	.p2align	3
__unnamed_1:
	.asciz	"\357\276\255\336\000\000\000"
	.quad	__unnamed_2

