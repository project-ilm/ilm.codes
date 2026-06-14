# ILM — Public-Sufficiency Validation Prompt

Purpose: test whether the **public** information (this site + the public repos) is, by itself, enough for an
independent AI — with no prior context and no private files — to understand Project ILM and continue the
work correctly. Paste the prompt below into a fresh session of any capable model **with web access**.
Then score the answer against the rubric.

---

## The prompt (paste into a fresh AI session, web access on)

> You have no prior context about this project. Using only public information, starting from
> **https://ilm.codes** and the GitHub organization **https://github.com/project-ilm** (plus
> **https://github.com/hindawiai/chintamani**), do the following. Cite the specific page or file for each claim.
>
> 1. **Explain the core hypothesis** of Project ILM / Romenagri in your own words, and state precisely what
>    is meant by "identity survives projection" and "N tables + 1 kernel, never N²".
> 2. **Describe the architecture and pipeline**: how a native-script program becomes a running binary, and
>    why the existing toolchain (GCC/LLVM/etc.) is not modified. Name the canonical flow.
> 3. **Report the measured results honestly**, distinguishing the hardened kernel figure from the repository
>    `bindings/c` variant. Give the reversibility numbers, the HPS paradigm count, the Roman→Devanagari
>    totality, and the Perso-Arabic coverage — and say which kernel variant each figure belongs to.
> 4. **State the size of the frontier**: how many scripts (ISO 15924) and languages (ISO 639-3) exist, how
>    many are seeded, and where the "600–700 scripts / 7,000–8,000 languages" figures come from.
> 5. **Pick one unmet script and one unmet language** from the registries and outline, concretely, the steps
>    you would take to add each — without changing the kernel.
> 6. **Summarize the HindiC++ specification**: what "token equivalence" means and why a HindiC++ program is
>    semantically a C++ program.
> 7. **State the collaboration rules** from the Charter that would govern your contribution (data, DOIs,
>    licensing, scope, national-narrative neutrality).
> 8. Finally, **list anything you could NOT determine from public information** — the gaps.

---

## Scoring rubric (the work, not the words)

A "pass" means the public site is self-sufficient. Score each 0/1:

- [ ] **Hypothesis** stated correctly (script ≠ language ≠ standard ≠ representation; canonical reversible
      identity Ω recoverable across projections). Source cited.
- [ ] **Pipeline** correct: `native .uhin → hincc → Romenagri ASCII-7 → unmodified GCC`; localization =
      presentation + ontology; `KW_IF → if`.
- [ ] **Honest figures, variant-named**: 98.68% / 1.31% (hardened, exhaustive [a-z]¹–⁴) vs 67.62% / 2.70%
      (post-guard `bindings/c`); HPS 6/6; Roman 100% totality / 91.56% kernel-stable; Perso-Arabic 200/200.
- [ ] **Frontier sized**: ISO 15924 ≈ 226 coded (187 encoded), 74 seeded; ISO 639-3 = 7,867 (7,027 living),
      58 seeded; the 600–700 universe = coded + unencoded backlog (SEI).
- [ ] **Concrete next step** for one script (a hub projection table row) and one language (keyword registry +
      langspec), explicitly without kernel changes.
- [ ] **HindiC++**: token equivalence; a HindiC++ TU denotes the corresponding C++ TU; semantics are C++'s.
- [ ] **Charter rules**: no primary sociolinguistic data; DOI-verifiable; publish/patent before PR;
      compatible licenses; academic/technical scope; national-narrative neutrality.
- [ ] **Gaps named** without inventing facts (e.g. RTI/funding detail is intentionally not foregrounded;
      per-script×language mapping is not yet public; some results are repo-variant specific).

**7–8/8** → public information is sufficient. **5–6/8** → mostly sufficient; tighten the weak pages.
**<5/8** → the site is not yet self-explaining; revise the cited pages until a cold AI can pass.

## Notes
- Run this against more than one model. Bring your own validators *and* invalidators — a model that confidently
  states a wrong figure is a signal that a page is ambiguous, not that the model is bad.
- Re-run after each major site change; the prompt is a regression test for self-sufficiency.

© 1993–2026 Abhishek Choudhary · GPL-3.0-or-later / CC BY 4.0.
