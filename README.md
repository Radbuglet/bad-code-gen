# Bad Code Gen

A repo researching a `rustc` code-gen bug where constants don't get properly inlined in specific scenarios.

Bug summary: `repr(C)` interacts weirdly with code-gen and prevents a `const` item from being inlined in specific scenarios.

Which specific scenarios? Well, the simplest conditions I could find are as follows:

- The struct contained in the `const` is `repr(C)` (it doesn't happen with `repr(transparent)` or `repr(Rust)`)
- The struct contained in the `const` has a field with a raw pointer obtained from a reference (it doesn't work with a
  normal reference or a pointer literal)
- This struct contained in the `const` is wrapped in an enum and then unwrapped before checking against an inlineable
  literal (I used `Option` in my MRE, but it can be any enum)

Additional details can be found in the `src/` directory, such as an annotated version of the problematic assembly in
`bad_code_gen.s`.
