<!-- context: https://ilm.codes/context/ -->
# Context Addendum — 16–29 Jun 2026 (append to context/REBUILD.md §E–G)

The base REBUILD.md is current to 15 Jun. This addendum carries the arc forward.
A fresh AI: read REBUILD.md, then this, then resume from §G' below.

## E'. Session arc (16–29 Jun 2026)
- **misty-doi** built from scratch → PyPI + git (`project-ilm/misty-doi` v1.0.1). Automation-first DOI:
  one `misty.json` → Zenodo/DataCite/codemeta/CITATION.cff + OpenTimestamps. DOI 10.5281/zenodo.20719388.
  Known: `misty --version` reports 1.0.0 (wheel is 1.0.1); no `--resume` for drafts (gap).
- **Foundry architecture survey** (5 unique posters) minted: **DOI 10.5281/zenodo.20986529** (concept .20986528),
  CC-BY-SA-4.0. Seeded via self-contained base64 script.
- **spi-scan** confirmed real (`project-ilm/spi-scan`, Python). NOT on PyPI → install
  `pipx install git+https://github.com/project-ilm/spi-scan.git`. Detects emails/keys/PATs/
  PyPI-Zenodo-Slack tokens/Aadhaar/cards/passports; exit 7 on HIGH.
- **Process hardening**: FPSS gate `ops/bin/contract_check.sh` (11 checks), `docs/PROCESS_HARDENING.md`
  (INCOSE ilities, FMECA/FTA/HAZOP from real failures), contracts C1–C8 (C8 = gate at every boundary).
- **Convergence at scale**: `discover_all.sh` enumerated the real footprint —
  **457 repos / 94 namespaces / 190 original / 267 forks (58%) / 0 archived / 10 empty / 18 private /
  418 stale / 27 dup-name groups / 114 site candidates.** Toolchain in `ops/bin`:
  discover_all, dedupe_scan, pre_announce_scan (drives spi-scan), mirror_forges, convergence_driver.
- **Workflow engines** in `ops/bin`: `publish_paper.sh` (init→validate→ots→DOI→submission→track),
  `patent_track.sh` (OTS disclosure = priority-date evidence; filing stays counsel).
- **ilm.codes** gained `/workflows/` (+#pubdoi, #patent), `/tools/`, `/convergence-map/`.
  Fixed the blank `/workflows/` page (`.reveal` opacity:0 with no anim.js → added anim.js + JS fallback).
- **CI/CD** added: `.github/workflows/{pypi-publish,pages,release}.yml` — PyPI on tag via OIDC trusted
  publishing (makes `pip install spi-scan`/misty-doi work), Pages auto-deploy (ends manual-regeneration
  clobber), tag→GitHub Release.

## F'. Three-layer separation (DO NOT FLATTEN)
- **Open-source (GPL)**: ILM/Hindawi/Romenagri, misty-doi, spi-scan, foundry, ops, the workflow engines.
- **Commercial (AyeAI Triad)**: AyeAI (cognition) · AyeCNSe (coherence) · AyeAM (embodiment); CEMs
  (pre-singularity) / CEMb (post-singularity); Interglial Healthcare, Vyas Labs, Indicybers. Monetization:
  GitHub Sponsors, Buy Me a Coffee, consulting, IP licensing, products. Domains: ayeai.xyz, ayecnse.net,
  icansee.life, ayeam.*, cems.ai/interglial.com.
- **NGO**: GramSheel Foundation, Project VIKRAM, TWISHA. Distinct governance/funding.
- "Convergence" here = **canonical continuity preservation across heterogeneous transforms** (NOT coherence).
- Public-facing materials name NO individuals/partners and NO past employers.

## G'. Live threads (do next, in order)
1. Execute dedup: archive 418 stale + 10 empty; tag 267 forks `upstream-fork`; resolve 27 name-collisions
   (icd102018 ×17 first) — one canonical each.
2. Run `pre_announce_scan.sh` over all namespaces to PASS (spi-scan now installed) before any announcement.
3. Stand up CI/CD on misty-doi, spi-scan (PyPI) and ilm.codes (Pages); cut v-tags.
4. Multi-ecosystem distribution where it fits; Colab/Kaggle notebooks in repos.
5. Release announcement sequence (LinkedIn/VIDYA, X, Instagram @ayeai.ilm, Bluesky, Mastodon, LINGUIST, arXiv).
6. Rotate the previously-leaked Zenodo token (still open if not done).

© 1993–2026 Abhishek Choudhary · GPL-3.0-or-later / CC-BY-4.0 as applicable.
