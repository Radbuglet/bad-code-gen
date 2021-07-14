; Built on rustc version: `rustc 1.55.0-nightly (3e1c75c6e 2021-07-13)`
; using `cargo clean && cargo rustc --release -- --emit asm`
; Additional comments added by hand.

; === Metadata
	.text
	.def	 @feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
.set @feat.00, 0
	.file	"bad_code_gen.1cb7e927-cgu.0"

; === bad_code_gen::with_repr_c::works_correctly
; Inlines "0xDEAD_BEEF == 0xDEAD_BEEF" check.

	.def	 _ZN12bad_code_gen11with_repr_c15works_correctly17he253782477945fd7E;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN12bad_code_gen11with_repr_c15works_correctly17he253782477945fd7E
	.globl	_ZN12bad_code_gen11with_repr_c15works_correctly17he253782477945fd7E
	.p2align	4, 0x90
_ZN12bad_code_gen11with_repr_c15works_correctly17he253782477945fd7E:
	.p2align	4, 0x90
.LBB0_1:
	jmp	.LBB0_1

; === bad_code_gen::with_repr_c::broken
; Checks "0xDEAD_BEEF" literal against const section in "__unnamed_1".

	.def	 _ZN12bad_code_gen11with_repr_c6broken17h642bd50eef461598E;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN12bad_code_gen11with_repr_c6broken17h642bd50eef461598E
	.globl	_ZN12bad_code_gen11with_repr_c6broken17h642bd50eef461598E
	.p2align	4, 0x90
_ZN12bad_code_gen11with_repr_c6broken17h642bd50eef461598E:
	movl	$3735928559, %eax
	cmpq	%rax, __unnamed_1(%rip)
	jne	.LBB1_1
	.p2align	4, 0x90
.LBB1_2:
	jmp	.LBB1_2
.LBB1_1:
	retq

; === bad_code_gen::with_repr_c::broken_works_here
; Inlines "0xDEAD_BEEF == 0xDEAD_BEEF" check.

	.def	 _ZN12bad_code_gen14with_repr_rust17broken_works_here17h4a285a7e8b36f4c5E;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN12bad_code_gen14with_repr_rust17broken_works_here17h4a285a7e8b36f4c5E
	.globl	_ZN12bad_code_gen14with_repr_rust17broken_works_here17h4a285a7e8b36f4c5E
	.p2align	4, 0x90
_ZN12bad_code_gen14with_repr_rust17broken_works_here17h4a285a7e8b36f4c5E:
	.p2align	4, 0x90
.LBB2_1:
	jmp	.LBB2_1

; === Constants

; "__unnamed_2" is likely the "MY_VALUE" constant
	.section	.rdata,"dr",one_only,__unnamed_2
__unnamed_2:

; "__unnamed_1" is likely the "bad_code_gen::with_repr_c::FIELD" constant
	.section	.rdata,"dr",one_only,__unnamed_1
	.p2align	3
__unnamed_1:
	.asciz	"\357\276\255\336\000\000\000"
	.quad	__unnamed_2
