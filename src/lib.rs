pub mod with_repr_c {
    #[repr(C)]
    struct ReprWrapper<H>(H);

    struct RawField {
        offset: usize,
        _meta: ReprWrapper<*const ()>,
    }

    const MY_VALUE: () = ();

    const FIELD: RawField = RawField {
        offset: 0xDEAD_BEEF,
        _meta: ReprWrapper(&MY_VALUE as *const ())
    };

    pub fn works_correctly() {
        if FIELD.offset == 0xDEAD_BEEF {
            loop {}
        }
    }

    pub fn broken() {
        if Some(FIELD).unwrap().offset == 0xDEAD_BEEF {
            loop {}
        }
    }
}

pub mod with_repr_rust {
    struct ReprWrapper<H>(H);

    struct RawField {
        offset: usize,
        _meta: ReprWrapper<*const ()>,
    }

    const MY_VALUE: () = ();

    const FIELD: RawField = RawField {
        offset: 0xDEAD_BEEF,
        _meta: ReprWrapper(&MY_VALUE as *const ())
    };

    pub fn broken_works_here() {
        if Some(FIELD).unwrap().offset == 0xDEAD_BEEF {
            loop {}
        }
    }
}
