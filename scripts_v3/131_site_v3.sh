#!/usr/bin/env bash
# 131_site_v3.sh — trust/safety/clarity pages for ilm.codes (run inside repos/ilm.codes)
# (C) 1993-2026 Abhishek Choudhary, GPL-3.0-or-later
set -uo pipefail
cd "$(dirname "$0")/.." 2>/dev/null || true   # tolerate being run from scripts/
[ -f index.html ] || cd ~/work/11jun/repos/ilm.codes
echo "[v3] writing pages into $(pwd)"

page(){ # $1 dir  $2 title  $3 meta-description  $4 body-html
 d="${1#/}"; mkdir -p "$d"
 cat > "$d/index.html" <<HEADEOF
<!doctype html><html lang="en"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>$2 · ILM</title>
<meta name="description" content="$3">
<meta property="og:title" content="$2 · ILM — Integrative Linguistic Multiscript">
<meta property="og:description" content="$3">
<meta property="og:type" content="website"><meta property="og:url" content="https://ilm.codes$1/">
<meta name="twitter:card" content="summary">
<link rel="canonical" href="https://ilm.codes$1/">
<link rel="stylesheet" href="/assets/site.css">
</head><body><main><section class="flow"><div class="wrap prose reveal">
$4
</div></section></main>
<script src="/assets/anim.js" data-base=""></script></body></html>
HEADEOF
}

page "/disclaimers" "Disclaimers & Validation Protocol" \
 "AI-assistance, no-warranty, and validation-protocol disclaimers for Project ILM." \
'<h2>Disclaimers &amp; validation protocol</h2>
<h3>AI assistance</h3>
<p>Parts of this site, its documentation, code scaffolds, and figures were <b>drafted with AI assistance</b>
and curated by the author. Treat every claim as <b>provisional until independently verified</b>. Where a
figure appears (e.g. 98.68% reversibility), the method is published so you can reproduce it yourself.</p>
<h3>No warranty</h3>
<p>All materials are provided <b>“as is”</b>, without warranty of any kind, to the extent permitted by law.
Code is GPL-3.0-or-later; docs and posters are CC BY 4.0. You are responsible for fitness-for-purpose and
for license compatibility of anything you build or contribute.</p>
<h3>Validation protocol (please follow)</h3>
<ol>
<li><b>Reproduce, don’t trust.</b> Every measured figure has a public method (see <a href="/calculations/">Calculations</a> and the <a href="https://project-ilm.github.io/romenagri/">results page</a>). Re-run it.</li>
<li><b>Bring your own validators <em>and</em> invalidators.</b> Independent checks and adversarial tests are welcomed and credited.</li>
<li><b>Name the variant.</b> Distinguish the hardened 2003–04 kernel (98.68% / 1.31%) from the repository <code>bindings/c</code> post-guard variant (67.62% / 2.70%). Conflating them is an error.</li>
<li><b>Distinguish the layers.</b> Keyword localization (alias/<code>#define</code>-style, e.g. <a href="/map.html">map.html</a> and HindiC++) is <em>not</em> the reversible orthographic transliteration kernel.</li>
<li><b>Cite a DOI.</b> Substantive claims and language/script materials should be DOI-backed.</li>
<li><b>Report discrepancies</b> via <a href="/fix/">/fix/</a> using the FIX-BLOCK format so they can be acted on quickly.</li>
</ol>
<p class="mut">Nothing here is legal, financial, or professional advice.</p>'

page "/privacy" "Privacy Policy (DPDP + GDPR)" \
 "Privacy policy for ilm.codes: what is and is not collected, lawful basis, data-subject rights under India DPDP 2023 and EU GDPR." \
'<h2>Privacy policy</h2>
<p class="lead">Short version: this is a <b>static GitHub Pages site</b>. It does not run its own
analytics, ad trackers, accounts, or databases. We aim to collect <b>nothing</b>.</p>
<h3>What this site collects</h3>
<p><b>Nothing directly.</b> There are no cookies set by us, no sign-in, no forms that store data on our
servers. The 3D explorer, posters, and registries are fetched as static files in your browser.</p>
<h3>Third parties</h3>
<table class="t"><tr><th>When</th><th>Who</th><th>What they may see</th></tr>
<tr><td>Loading any page</td><td><b>GitHub Pages</b> (host)</td><td>Standard server logs (IP, user-agent) per <a href="https://docs.github.com/site-policy/privacy-policies/github-privacy-statement">GitHub’s privacy statement</a>.</td></tr>
<tr><td>3D explorer</td><td><b>cdnjs (Cloudflare)</b></td><td>Request for the Three.js library.</td></tr>
<tr><td>You click an issue / AI-help link</td><td><b>GitHub / Claude / OpenAI</b></td><td>You leave our site; their policies apply.</td></tr></table>
<h3>Your rights</h3>
<p>Under the <b>India Digital Personal Data Protection Act 2023 (DPDP)</b> and the <b>EU/UK GDPR</b>, you have
rights of access, correction, erasure, and grievance redressal over personal data a controller holds. Because
this site holds no personal data about visitors, there is nothing for us to access or erase. For data held by
GitHub/Cloudflare as hosts, contact them. For anything you submit to our public repos (issues/PRs are public
by nature), see <a href="/security/">Security</a> and the <a href="/charter/">Charter</a>.</p>
<h3>Contributor data</h3>
<p>If you open an issue or PR, your GitHub identity and content become part of the <b>public</b> project
record. Do not put personal or sensitive data in public issues. Primary sociolinguistic / community data is
<b>not</b> accepted (see the Charter).</p>
<h3>Contact</h3>
<p>Grievances / privacy queries: open a private security advisory (see <a href="/security/">Security</a>) or
contact via the repository. <span class="mut">This policy may be updated; check the date in git history.</span></p>'

page "/security" "Security & Responsible Disclosure" \
 "Security policy and responsible-disclosure process for Project ILM repositories." \
'<h2>Security &amp; responsible disclosure</h2>
<p>ILM is a research project served as static pages plus open-source tooling. We still take security and
safety seriously.</p>
<h3>Report a vulnerability</h3>
<p>Please use <b>GitHub private security advisories</b> on the relevant repo
(<code>Security → Report a vulnerability</code>) rather than a public issue. We aim to acknowledge within a
reasonable time and to credit reporters who wish it.</p>
<h3>Scope</h3>
<ul><li>The site (<code>project-ilm/ilm.codes</code>) and the kernel/tooling repos.</li>
<li>Supply-chain concerns (CDN, dependencies) — flag them.</li>
<li>Out of scope: third-party hosts (GitHub, Cloudflare) — report to them directly.</li></ul>
<h3>Hardening we ask maintainers to enable</h3>
<ul>
<li>Branch protection on <code>main</code> (require PR review; no force-push).</li>
<li>Dependabot alerts + secret scanning + push protection (org-wide).</li>
<li>2FA required for the org; least-privilege collaborator roles.</li>
<li>Signed commits/tags for releases where feasible.</li>
<li>CodeQL on code repos; pin GitHub Actions by SHA.</li>
</ul>
<p class="mut">Do not test against third-party infrastructure. No social engineering of maintainers or contributors.</p>'

page "/naming" "Naming — Hindawi, ILM, and “ILM Hindawi”" \
 "How the Hindawi and ILM names relate: Hindawi for Indic/Brahmic lineage, ILM as the global superset." \
'<h2>Naming — Hindawi, ILM, and “ILM Hindawi”</h2>
<p class="lead">Two names, one lineage. They are not competitors; one grew out of the other.</p>
<h3>Hindawi (हिंदवी) — the Indic / Brahmic root</h3>
<p>The <b>Hindawi Programming System</b> (first public release <b>15 August 2004</b>) is the original work:
systems programming in Indic languages over an unmodified GCC toolchain. <b>Hindawi continues</b> as the name
for the Indic / Brahmic-derived line — Devanagari and its sibling scripts, Indian-language keyword registries.</p>
<h3>ILM — Integrative Linguistic Multiscript (the global superset)</h3>
<p><b>ILM</b> generalizes the same idea to <b>every</b> script family and language — Perso-Arabic, NW-Semitic,
CJK, and beyond — with the canonical reversible identity layer (Romenagri) underneath. ILM ⊇ Hindawi.</p>
<h3>Why “ILM Hindawi” over time</h3>
<p>Globally, the umbrella is ILM; Hindawi is its Indic heart. As the work becomes planetary, leading with the
global name and keeping the historical root reads more naturally as <b>“ILM Hindawi”</b> than the reverse —
the superset first, the origin honored within it. Both names persist; nothing is renamed away.</p>
<p><span class="pill">Hindawi = Indic/Brahmic</span><span class="pill">ILM = all scripts &amp; languages</span><span class="pill">ILM ⊇ Hindawi</span></p>'

page "/official" "Official sites & disambiguation" \
 "Which sites are official Project ILM, how others may (and may not) claim affiliation, and disambiguation from unrelated ILM projects." \
'<h2>Official sites &amp; disambiguation</h2>
<h3>Official channels</h3>
<p>The authoritative Project ILM / Romenagri / Hindawi channels are:</p>
<ul>
<li><b>Site:</b> <code>ilm.codes</code> (moving to <code>ilmcodes.com</code> / <code>ilmcodes.net</code>).</li>
<li><b>Code:</b> <code>github.com/project-ilm</code> and <code>github.com/hindawiai</code>.</li>
<li><b>Results:</b> <code>project-ilm.github.io/romenagri</code>.</li>
</ul>
<p>If it is not linked from one of these, treat it as <b>unofficial</b> until confirmed.</p>
<h3>Claiming affiliation</h3>
<p>You may <b>fork</b>, build on, teach, and cite this work under its licenses — please do. You may say your
work <b>“builds on / is compatible with Project ILM.”</b> Please do <b>not</b> present a mirror or derivative
as <b>the official Project ILM site</b>, or imply endorsement, without written confirmation. Collaborating
institutes hosting an <a href="/institute/">ILM Institute</a> node may use the name per a hosting agreement.</p>
<h3>Disambiguation</h3>
<p>“ILM” and “Project ILM” are also used by unrelated efforts (e.g. the <em>Iterated Learning Model</em> in ML,
medical/optical “ILM”, and others). <b>This</b> ILM is <em>Integrative Linguistic Multiscript</em> — scripts,
languages, and the computing stack. No association with similarly-named projects is implied.</p>
<h3>The author’s wider ecosystem</h3>
<p>See <a href="/ecosystem/">/ecosystem/</a> — including <a href="https://icansee.life">icansee.life</a>.</p>'

page "/support" "Support, grants & collaboration" \
 "Appeal for grants and financial support for ILM collaborators worldwide, with disclaimers and a validation protocol." \
'<h2>Support, grants &amp; collaboration</h2>
<p class="lead">ILM is open and non-commercial at its core. To let collaborators around the world
participate — including from low-resource and low-income settings — we welcome <b>grants, sponsorships, and
institutional support</b>, directed transparently to the work and to the people doing it.</p>
<h3>What support enables</h3>
<ul>
<li>Stipends / micro-grants for contributors adding scripts and languages (especially low-resource ones).</li>
<li>Compute and hosting for the registries, the 3D explorer, and dockerised linguistics labs.</li>
<li>DOI/archival costs, translation review, and accessibility.</li>
<li>Seeding <a href="/institute/">ILM Institute</a> nodes at collaborating universities.</li>
</ul>
<h3>How to help or fund</h3>
<p>Open an issue tagged <code>support</code> on <code>project-ilm/ilm.codes</code>, or reach out via the
repository. Institutions: propose a hosted node or a sponsored work-package. Individuals: contribute work
(the most valuable support) — see <a href="/contribute/">Contribute</a>.</p>
<h3>Disclaimers &amp; protocol</h3>
<ul>
<li>No solicitation here constitutes a securities or investment offer; this is research, not a financial product. See <a href="/disclaimers/">Disclaimers</a>.</li>
<li>Funds/relationships will be acknowledged transparently; <b>funding never buys a result</b> — figures stay reproducible and honest.</li>
<li>All funded work follows the <a href="/charter/">Charter</a>: academic/technical only, DOI-verifiable, compatible licenses, no primary sociolinguistic data, national-narrative neutral.</li>
<li>We reserve the right to decline or return support that conflicts with the vision, mission, or objectives.</li>
</ul>'

page "/vyoma" "VYOMA proposal (BHASHINI / MeitY)" \
 "Mapping ILM / Romenagri / Hindawi to the VYOMA Innovation Challenge under BHASHINI / MeitY." \
'<h2>VYOMA — proposal sketch</h2>
<p class="lead">Project ILM / Romenagri / Hindawi maps directly onto national language-technology goals.
This is a working sketch for the <b>VYOMA Innovation Challenge (BHASHINI / MeitY)</b>; the author will refine.</p>
<h3>Fit</h3>
<ul>
<li><b>Reversible canonical layer</b> across 22+ scheduled languages and 45+ Brahmi-derived scripts — a
substrate for digital public goods that preserves identity losslessly.</li>
<li><b>Systems programming in Indian languages</b> (Hindawi: 6/6 paradigms via unmodified GCC) — capacity
building and education in the mother tongue, end to end.</li>
<li><b>Open registries</b> (ISO 15924 / ISO 639-3) with honest, reproducible coverage metrics.</li>
</ul>
<h3>Proposed deliverables</h3>
<ol>
<li>Romenagri canonical kernel + bindings as a reusable digital public good (GPL).</li>
<li>Language keyword registries for all scheduled languages (with the langspec generator).</li>
<li>Reference localized toolchain demo (native-script → unmodified GCC).</li>
<li>Reproducibility report + DOIs; integration notes for BHASHINI pipelines.</li>
</ol>
<h3>Why us</h3>
<p>Priority since 2003–04, a public release dedicated in part to Dr A. P. J. Abdul Kalam, measured results,
and an open, charter-governed collaboration model. <span class="mut">Detailed budget and timeline to be added
by the author.</span></p>'

page "/institute" "The ILM Institute (seeded, hosted at partners)" \
 "A globally seeded ILM Institute hosted at collaborating universities; related courses and tentative cost estimates." \
'<h2>The ILM Institute</h2>
<p class="lead">Not a building — a <b>seeded, federated institute</b> hosted at collaborating universities and
labs. Each node runs courses, hosts a dockerised linguistics lab, and contributes scripts/languages upstream.</p>
<h3>Related courses (start here, at existing institutions)</h3>
<p>Until ILM nodes exist, these public courses build the needed background:</p>
<ul>
<li>Computational linguistics &amp; NLP — most CS/linguistics departments; e.g. open courseware on NLP.</li>
<li>Writing systems &amp; phonology — linguistics departments; Unicode/ISO 15924 documentation.</li>
<li>Compilers &amp; language design — standard CS curricula.</li>
<li>Information theory &amp; formal languages — see our <a href="/posters/">posters</a> for the framing.</li>
</ul>
<p class="mut">We link specific university courses as partners confirm; suggestions welcome via an issue.</p>
<h3>A node, tentatively</h3>
<table class="t"><tr><th>Item</th><th>Tentative annual estimate (USD)</th></tr>
<tr><td>1 coordinator + 2 research assistants (region-dependent)</td><td>$30k–$120k</td></tr>
<tr><td>Compute / hosting (labs, registries, explorer)</td><td>$3k–$15k</td></tr>
<tr><td>Student micro-grants (10–20 contributors)</td><td>$10k–$40k</td></tr>
<tr><td>DOI / archival / translation review / travel</td><td>$5k–$20k</td></tr>
<tr><td><b>Per node, indicative total</b></td><td><b>$50k–$200k</b></td></tr></table>
<p class="mut">Order-of-magnitude only — hosted by the partner institute, scaled to local costs. A global seed
of ~10 nodes is therefore a low-single-digit-million effort, mostly absorbed by host institutions. See
<a href="/support/">Support</a>.</p>'

page "/history" "A history & future (founder’s perspective)" \
 "A founder's-perspective history of computing and programming languages, and ILM's future timeline. Opinionated, to be refined." \
'<h2>History &amp; future — a founder’s perspective</h2>
<p class="lead"><b>This is one person’s perspective</b> (Abhishek Choudhary), offered to frame the work, not as
neutral encyclopedia. It will be revised; corrections via <a href="/fix/">/fix/</a> are welcome.</p>
<h3>The compression we are trying to undo</h3>
<blockquote>“Human civilization spent ~five millennia creating writing systems. Modern computing spent
~seventy years collapsing them — into a Latin keyword, ASCII, English syntax.”</blockquote>
<h3>A short, opinionated timeline</h3>
<table class="t"><tr><th>Era</th><th>What happened (this lens)</th></tr>
<tr><td>antiquity–1900s</td><td>Hundreds of scripts encode the world’s knowledge; identity lives in orthography.</td></tr>
<tr><td>1940s–60s</td><td>Machine code → assembly → FORTRAN/LISP/COBOL: programming is born <em>in English, in Latin script</em>.</td></tr>
<tr><td>1970s–90s</td><td>C, Unix, the internet; ASCII becomes destiny. Localization = surface translation of UI, not of computation.</td></tr>
<tr><td>1991–2000s</td><td>Unicode encodes scripts (a huge gift) — but programming itself stays English/Latin.</td></tr>
<tr><td>2003–04</td><td>Romenagri (reversible canonical layer) + Hindawi Programming System: systems programming in Indic languages over unmodified GCC.</td></tr>
<tr><td>2020s</td><td>ILM generalizes to all scripts/languages; AGI makes linguistic equity urgent, not cosmetic.</td></tr></table>
<h3>Future timeline (intent, not promise)</h3>
<table class="t"><tr><th>Horizon</th><th>Aim</th></tr>
<tr><td>~1–2 yr</td><td>Registries filled toward all encoded scripts; langspec for all scheduled Indian + major world languages; IDE/LSP keyword support.</td></tr>
<tr><td>~3–5 yr</td><td>ILM Institute nodes; dockerised linguistics labs; reproducible coverage across families; DOIs throughout.</td></tr>
<tr><td>~10 yr+</td><td>Identity-stable substrate as a default option for multilingual computing and humane AGI.</td></tr></table>
<p class="mut">Maps and detailed roadmaps live in the repos; the author will guide changes.</p>'

page "/fix" "Help us fix it (apology + FIX-BLOCK)" \
 "We will get things wrong. An unconditional apology, and a machine-readable format to report and fix issues." \
'<h2>Help us fix it</h2>
<p class="lead">We will get things wrong — a wrong figure, a clumsy mapping, a script we misfiled, a claim
that reads stronger than the evidence. <b>For any error here, an unconditional apology.</b> The right
response to a mistake is to fix it in the open.</p>
<h3>Please do two things</h3>
<ol><li><b>Open an issue</b> describing it (use the templates), and</li>
<li>if you can, <b>send a pull request</b> with the fix. Even a one-line correction is welcome and credited.</li></ol>
<p><a class="btn" href="https://github.com/project-ilm/ilm.codes/issues/new/choose">Open an issue</a>
<a class="btn ghost" href="/contribute/">How to send a PR</a></p>
<h3>FIX-BLOCK — a format we (and an AI) can parse and act on</h3>
<p>Paste this in an issue or PR description; it is easy for a human or an AI agent to read and apply:</p>
<pre>```fix
where:   &lt;url or repo path, e.g. /scripts/ or romenagri/filters/rom2deva_heur.py&gt;
type:    &lt;factual | figure | mapping | broken-link | wording | code | accessibility&gt;
current: &lt;what it says now, quoted exactly&gt;
should:  &lt;what it should say / do&gt;
why:     &lt;evidence; DOI/source if a factual or figure fix&gt;
variant: &lt;if a kernel figure: hardened-2003-04 | bindings/c-postguard&gt;
```</pre>
<p class="mut">Bring your own validators and invalidators — challenges with evidence are exactly what we want.</p>'

page "/calculations" "Calculations & proofs (nothing hidden)" \
 "The measured results and how to reproduce them: reversibility, compression, the alphabet bound, the theorems." \
'<h2>Calculations &amp; proofs</h2>
<p class="lead">Nothing to hide. Here is what is measured, how, and where to reproduce it. Full derivations
and the theorem statements live on the <a href="https://project-ilm.github.io/romenagri/">academic results page</a>
and in the repo; this is the index.</p>
<h3>Reversibility (name the variant)</h3>
<table class="t"><tr><th>Variant</th><th>Result</th><th>Method</th></tr>
<tr><td>Hardened 2003–04 kernel</td><td><b>98.68%</b> rev-or-canonical, <b>1.31%</b> irreducible</td><td>Exhaustive sweep over [a-z]¹–⁴ = 475,254 strings; round-trip str → ACII → Romenagri → ACII → str.</td></tr>
<tr><td>Repo <code>bindings/c</code> (post-guard)</td><td>67.62% rev-or-canonical, 2.70% crash</td><td>Same harness; a reverse-parser regression vs the 2003–04 kernel, reported honestly.</td></tr></table>
<h3>Heuristic totality (alphabet limits)</h3>
<p>Roman→Devanagari heuristic: <b>100%</b> of [a-z]¹–³ map to Devanagari (raw kernel left 29.7% undefined +
2.703% crash); of the heuristic image, <b>91.56%</b> is kernel-stable. The alphabet ceiling is absorbed by the
front-end, not by changing the kernel.</p>
<h3>Compression (lossless)</h3>
<p>On an Indic corpus: bytes <b>1.76×</b>, alphabet <b>51 → 24</b> (≈2.12×), byte-positions <b>3×</b>; BPE merge
gain <code>k &lt; 1</code>. Lossless because the transform is reversible (up to the irreducible floor).</p>
<h3>Alphabet bound</h3>
<p>The canonical inventory (ACII) is <b>|Ω| = 84</b> primitive symbols — claimed sufficient for 44+ Brahmic
scripts; the minimality of 84 is an <em>open</em> question (stated as open, not proven).</p>
<h3>Two layers, do not conflate</h3>
<p><b>Keyword localization</b> (alias/<code>#define</code>-style: localized keyword → canonical construct, e.g.
<a href="/map.html">map.html</a>, HindiC++) preserves semantics. <b>Orthographic transliteration</b> (the
Romenagri kernel) is the reversible script layer — that is where the 98.68% lives.</p>
<p><a class="btn" href="https://project-ilm.github.io/romenagri/">Full results &amp; theorems</a>
<a class="btn ghost" href="/context/">Machine-readable context</a></p>'

page "/ecosystem" "The wider ecosystem" \
 "Links to the Project ILM repositories and the author's wider ecosystem." \
'<h2>The wider ecosystem</h2>
<h3>Project ILM / Romenagri / Hindawi</h3>
<ul>
<li><a href="https://ilm.codes">ilm.codes</a> — this site (→ <a href="https://ilmcodes.com">ilmcodes.com</a> / <a href="https://ilmcodes.net">ilmcodes.net</a>)</li>
<li><a href="https://github.com/project-ilm">github.com/project-ilm</a> — kernel, site, legacy, and seeded repos</li>
<li><a href="https://github.com/hindawiai">github.com/hindawiai</a> — Hindawi lineage (chintamani; HindiC++ spec)</li>
<li><a href="https://project-ilm.github.io/romenagri/">project-ilm.github.io/romenagri</a> — academic results</li>
</ul>
<h3>The author’s wider work</h3>
<ul>
<li><a href="https://icansee.life">icansee.life</a></li>
<li>AyeAI / AyeCNSe / AyeAM — consciousness &amp; cognition architecture (founder’s research program)</li>
</ul>
<p class="mut">Inclusion here indicates authorship/affiliation, not endorsement of any third party. See
<a href="/official/">official sites &amp; disambiguation</a>.</p>'

echo "[v3] pages written"