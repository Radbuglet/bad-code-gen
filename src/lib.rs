// Built on rustc version: `rustc 1.55.0-nightly (3e1c75c6e 2021-07-13)`
// using `cargo clean && cargo rustc --release -- --emit asm`

#![feature(const_fn_trait_bound)]
#![feature(const_fn_union)]
#![feature(const_mut_refs)]
#![feature(const_panic)]
#![feature(const_ptr_write)]
#![feature(ptr_metadata)]
#![feature(unsize)]

use std::any::Any;
use std::marker::Unsize;
use std::mem;
use std::ptr::{null, Pointee};

#[repr(C)]
union AnyValue<H> {
    _placeholder: mem::ManuallyDrop<H>,
    zst: (),
}

impl<H> AnyValue<H> {
    const fn empty() -> Self {
        Self { zst: () }
    }

    const fn new<T>(value: T) -> Self {
        if mem::size_of::<T>() > mem::size_of::<H>() {
            panic!("Type has a larger size than its container type.");
        }

        if mem::align_of::<T>() > mem::align_of::<H>() {
            panic!("Type has stronger alignment requirements than its container type.");
        }

        let mut obj = Self::empty();
        unsafe { (&mut obj as *mut Self).cast::<T>().write(value) };
        obj
    }
}

const fn unsize_meta<A, B>() -> B::Metadata
    where
        A: Unsize<B>,
        B: ?Sized + Pointee,
{
    let original = null::<A>();
    let transformed = original as *const B;
    transformed.to_raw_parts().1
}

struct RawField {
    offset: usize,
    _meta: AnyValue<usize>,
}

const FIELD: RawField = RawField {
    offset: 0xDEAD_BEEF,
    _meta: AnyValue::new(unsize_meta::<u32, dyn Any>())
};

// Assembles as (demangled):
// ```
//     .def     bad_code_gen::works_correctly::h7c544f701055a5ad
//     .scl    2;
//     .type   32;
//     .endef
//     .section    .text,"xr",one_only,bad_code_gen::works_correctly::h7c544f701055a5ad
//     .globl  bad_code_gen::works_correctly::h7c544f701055a5ad
//     .p2align    4, 0x90
// bad_code_gen::works_correctly::h7c544f701055a5ad:
//     .p2align    4, 0x90
// .LBB2_1:
//     jmp .LBB2_1
// ```
pub fn works_correctly() {
    if FIELD.offset == 0xDEAD_BEEF {
        loop {}
    }
}

// Assembles as (demangled):
// ```
//     .def    bad_code_gen::broken::hcc0e964ba9d7b34f;
//     .scl    2;
//     .type   32;
//     .endef
//     .section    .text,"xr",one_only,bad_code_gen::broken::hcc0e964ba9d7b34f
//     .globl  bad_code_gen::broken::hcc0e964ba9d7b34f
//     .p2align    4, 0x90
// bad_code_gen::broken::hcc0e964ba9d7b34f:
//     movl    $3735928559, %eax
//     cmpq    %rax, __unnamed_1(%rip)
//     jne .LBB3_1
//     .p2align    4, 0x90
// .LBB3_2:
//     jmp .LBB3_2
// .LBB3_1:
//     retq
//
// ; [ ... ]
//
//     .section    .rdata,"dr",one_only,__unnamed_1
//     .p2align    3
// __unnamed_1:
//     .asciz  "\357\276\255\336\000\000\000"
//     .quad   __unnamed_2
// ```
pub fn broken() {
    if Some (FIELD).unwrap().offset == 0xDEAD_BEEF {
        loop {}
    }
}
