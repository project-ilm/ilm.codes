<!-- context: https://ilm.codes/context/ -->
# ILM / Hindawi / Romenagri — Consolidated Context Map (pick-up point for any AI or human)

> Fetch this file to rebuild full working context. Pairs with: the session transcripts (journal + dated bodies),
> `ops/docs/CONTEXT_REBUILD.md`, and the newest `record/snapshots/<STAMP>/` (checksummed live state).
> Secrets are never stored here — tokens are referenced by path only.

## A. Who / mission
- Abhishek Choudhary — Founder AyeAI ∴ AyeAM; ex-IBM Band-9 (Power Hypervisor IO, Power 7–9; founding architect PowerAI/Watson ML Accelerator); ex-HP. (Verified via LinkedIn /in/cognitist, hindawi.in.)
- Hindawi Programming System (first release 15 Aug 2004, GPL-2.0): first complete non-English systems-programming platform (C, C++, lex, yacc, asm, BASIC, Java, Python driver in Hindi & other Indian languages). Romenagri (2003, GPL) is its reversible ASCII-7 transliteration kernel.
- Project ILM (Integrative Linguistic Multiscript): generalizes Hindawi + Romenagri to every script × every language × every AGI layer (L0→L9) over ONE fixed reversible kernel. Box `ilm01-lin`, dir `~/work/11jun`, org github.com/project-ilm.

## B. Non-negotiable working rules
1. Never raw command lists — always an auditable `cat > file <<'EOF' … EOF` script committed to `ops`.
2. fork → fix → PR → review → merge; incremental patches only; PRs LOUD (print URL; never swallow `gh`).
3. Component-based, data-driven, reuse. Invariant: N tables + 1 fixed kernel, never N²; kernel never changes.
4. Verify by execution; honest figures; flag-don't-fake. Every file carries the context comment above.
5. Don't reinvent the wheel — the Hindawi lexers ARE the mapping; read them, never regenerate thin tables.
6. Deliverables are self-contained paste-scripts + tarballs run on the box; keep the laptop busy (ilmd daemon).

## C. Architecture & invariants
- Unicode ↔ ACII (ISCII-derived) ↔ Romenagri (ASCII-7); Devanagari hub; reversibility ≈ 98.68% (grammar property; 2 crash bugs fixed by ASan fuzzing; proven ISCII-independent via an autoconf substrate selector).
- Two honestly-separate layers: keyword localization (Shaili; 41-lang map.html) ≠ the reversible Romenagri kernel. Don't conflate.
- Shaili = localized C-family language family/method (NOT "HindiC++"). Cite host standard normatively; copyright only the emergent delta (mapping + apply tool).
- Node = script (ISO 15924, 226) OR language×layer (ISO 639-3, 7,867; 7,027 living × L0–L9), each with a manifest. Generators are components; site/explorer/specs/DOIs are views.
- Click-through bootstrap: node → stable URL → if artifact missing, a short prompt pointing a fresh session at the context URLs (never cram payload in the URL).

## D. Hindawi toolchain — the source of truth (chintamani/Hindawi)
Eight bidirectional host lexers, each with its own driver; dispatch on `<shailee TAG>` via hindrv/*.awk:

| dir | forward <host>2h | reverse h2<host> | driver | host | shaili tag |
|---|---|---|---|---|---|
| guru | c2h.uhin | h2c.uhin | gurucc | c | guru/guroo |
| shraeni | cpp2h.uhin | h2cpp.uhin | shraenicc | cpp | shraee_nnee(ba_d_dha) |
| praatha | b2h.uhin | h2b.uhin | praathacc | basic | praa_tha(mika) |
| shabda | l2h.uhin | h2l.uhin | shabdacc | lex | shab_da |
| wyaaka | yacc2h.uhin | h2yacc.uhin | wyaakacc | yacc | wyaaka |
| yantra | y2h.uhin | h2y.uhin | yantracc | asm | ya_m_tra/yaa_m_trika |
| kritrima | j2h.uhin | h2j.uhin | kritrimacc(+fixjava.awk) | java | k_ri_trima |
| soochee | py2h.uhin | h2py.uhin | soocheecc(+fixpy.awk) | python | soochee |

- Drivers: hindrv/{hincc, hin2std, std2hin}(+.awk). Morphology: kxaaraka/{get_toks,roots,uroots,suffs,usuffs,leaves,nodes,toktree}. Backends: others/{fasm, qb2c}.
- Pipeline tools (on box): fixuninum, iconv(utf8↔utf16), uni2acii, acii2uni, acii2cf, acii2hin, rmn2acii. Compile (gurucc): acii2uni | iconv UTF-16→UTF-8 | h2c | sed(\न→\n,%भ→%f,%प→%d) | gcc → hin.exe.
- Verified compiling/running: HindiC.uhin, HindiC++.uhin, HindiBASIC.uhin via hincc→hin.exe.
- KNOWN QUIRK: soochee/{h2py,py2h}.uhin carry Java keyword content while soocheecc runs python3 (placeholder).

## E. Session arc (13–15 Jun 2026)
- 13 Jun: Romenagri kernel reconstructed & execution-verified; 2 crash bugs fixed; ISCII-independence proven; autoconf substrate selector; langspec builder; VSCode extension; reversibility suite + GH-Pages report; Perso-Arabic filter tests.
- 13–14 Jun: heuristic Roman→Devanagari; Perso-Arabic + all-script-family coverage; langspec keyword→standard; academic results page.
- 14 Jun: ilm.codes migration banner + AI-continuation context pages + ISO 15924 / ISO 639-3 registries baked to registry/*.tsv.
- 14 Jun: futuristic rebuild — dashboard, 3D explorer, Charter, contribute page, poster gallery, issue templates, validation prompt.
- 15 Jun AM: ops repo (lib.sh LOUD PR helpers, docs); 3D explorer fix (PR#4, drop missing OrbitControls → 144 fps); VSCode grammar; /programme/ portal MERGED (PR#6, private 13554 excluded); specs scaffold MERGED (PR#1).
- 15 Jun PM: release generator MERGED (PR#2 — 108 packages, 9,133 entries); DOIs minted to ops/doi_map.json; ilmd daemon live; Hindawi-mapping fix delivered; context-rebuild kit (this file + dump_state.sh).

## F. Current repo / asset state
- Repos: ilm.codes, language-specs, vscode-ilm, ops, record(private), romenagri, chintamani(+legacy).
- language-specs PR#2 merged: 108 Shaili packages (41 Perso-Arabic from real map.html CSVs + Devanagari-family seeds incl. Hindi/Bhojpuri); each = keywords/<host>.tsv, samples/, SPEC.md, package.json + release_manifest.json.
- ilmd live (screen): minted poster:certification.jpg → DOI 10.5281/zenodo.20704259; per-package mint queued/running. Token read from ops/.zenodo_token (path only).
- CORRUPTED: language-specs/{hi,ur,fa}/*.md = dictionary dump of "abstract" (bare-`trans` bug) → localize.sh DISARMED.
- Earlier DOIs: Romenagri kernel 10.5281/zenodo.20695751; concept .20651857; + 13 programme posters.

## G. Live correction threads (do next, in order)
1. Rebuild the Hindi package from ALL EIGHT host dirs (not guru-only, as the first fix did); normalize host names c, cpp, b→basic, l→lex, yacc, y→asm, j→java, py→python; ship each host's real bidirectional lexers + matching Hindi*.uhin samples. Retire/version the thin Hindi DOI.
2. Languages in priority — classical (Sanskrit/Farsi/Arabic/Tamil), then Perso-Arabic, Brahmi-derived, then rarest-first — without touching the fixed kernel. Adding a language = adding its keyword source; packages auto-generate.
3. v2 3D explorer at /explore/v2/ (don't break v1): Earth globe, no political boundaries; artifacts as geolocated satellites; AGI level = orbit altitude; OUTERMOST = L0 hardware down to apps/AGI nearest ground.
4. Per-node detail pages + bootstrap-prompt wiring; route DOIs/specs/install/refs in.
5. Flesh out IAS + technical spec bodies; per-language DOI via misty-doi.
6. Funding: ~270–330M tokens / ~900–1,600 AI-hours, tiered (Opus for kernel/specs/refimpl; Sonnet/Haiku for ~80% automatable batch). Pull Anthropic credit programs; draft application around this cost model + DOI evidence.
7. Move remaining private artifacts (e.g. 13554) into project-ilm/record.

## H. Secrets policy
Tokens referenced by path only (ops/.zenodo_token); never by value. dump_state.sh refuses to snapshot any token/key
file and aborts on secret-like content. Rotate the previously-leaked Zenodo token.

## I. How to rebuild from cold
1. Read /mnt/transcripts/journal.txt then the dated transcript bodies in order.
2. Read this file + ops/docs/CONTEXT_REBUILD.md; browse ilm.codes/context/.
3. Read the newest record/snapshots/<STAMP>/ and verify checksums.
4. Resume from §G.

© 1993–2026 Abhishek Choudhary · GPL-3.0-or-later / CC-BY-4.0 as applicable.
