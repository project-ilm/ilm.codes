# Contributing to Project ILM

New to GitHub? Read **https://ilm.codes/contribute/** first (concepts, learning links, AI help).
Read the **[Charter](CHARTER.md)** — it is what keeps this project open to everyone.

## The invariant
**N projection tables + 1 fixed kernel, never N².** The kernel never changes. Scripts and languages are
*additive*.

## Add a script
1. Pick a pending/encoded script (`/explore/` or `/scripts/`).
2. Propose it: open a **Script proposal** issue.
3. Add a Unicode→Devanagari-hub projection table row. Document irreducible/ambiguous cases honestly.
4. Verify; reference a DOI; open a PR.

## Add a language
1. Pick a code from `/languages/`.
2. Open a **Language proposal** issue with a keyword registry `construct,native_keyword,romenagri`.
3. Run the langspec generator → standard doc + compile-verified C. (See HindiC++ spec in `hindawiai/chintamani`.)
4. Provide a pivot language for review; DOI the original; open a PR.

## Rules (from the Charter)
- Evidence over authority; DOI-backed. - Publish/patent before PR for substantive work.
- Academic/technical only; national-narrative neutral. - No primary sociolinguistic field data.
- Compatible licenses only. - Maintainers may decline/remove non-compliant material.

By contributing you agree to the Charter and the [Code of Conduct](CODE_OF_CONDUCT.md).
