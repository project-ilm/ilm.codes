#!/usr/bin/env python3
# gen_programme.py — build the formal /programme/ documentation portal from programme.json.
# Data-driven (component): edit programme.json, re-run. context: https://ilm.codes/context/
# Usage: gen_programme.py <site_root>
import sys, os, json, html
root=sys.argv[1]
docs=json.load(open(os.path.join(root,"assets/programme/programme.json"),encoding="utf-8"))
CTX="https://ilm.codes/context/"
COPY="© 1993–2026 Abhishek Choudhary. All rights reserved."
def esc(s): return html.escape(s,quote=True)
PRINT_CSS="""@media print{
 nav,.noprint,.btn{display:none!important} body{background:#fff;color:#000}
 .sheet{box-shadow:none;border:0;margin:0;max-width:100%} a{color:#000;text-decoration:none}
 .poster img{max-width:100%;page-break-inside:avoid}}
.sheet{max-width:900px;margin:1.5rem auto;background:#fff;color:#10131c;border:1px solid #d8dcea;
 border-radius:10px;padding:2.4rem 2.6rem;box-shadow:0 8px 40px rgba(0,0,0,.08)}
.sheet h1{font:700 1.5rem/1.3 Georgia,serif;margin:.2rem 0 .1rem}
.sheet .kic{color:#6a5410;font:600 .72rem/1 ui-monospace,monospace;letter-spacing:.08em;text-transform:uppercase}
.sheet .abstract{font:400 1.02rem/1.7 Georgia,serif;margin:1.1rem 0 1.4rem;text-align:justify}
.sheet .meta{color:#5a6080;font-size:.82rem;border-top:1px solid #e6e9f4;padding-top:.8rem;margin-top:1.4rem}
.poster{margin:1.2rem 0;text-align:center} .poster img{max-width:100%;border:1px solid #e0e3f0;border-radius:8px}
.docbar{max-width:900px;margin:0 auto;display:flex;gap:.6rem;flex-wrap:wrap}"""
def page_head(title,extra=""):
    return f"""<!doctype html><html lang="en"><head><meta charset="utf-8">
<!-- ILM programme document. context: {CTX} -->
<meta name="viewport" content="width=device-width,initial-scale=1"><title>{esc(title)}</title>
<link rel="stylesheet" href="/assets/site.css"><style>{PRINT_CSS}{extra}</style></head><body>"""
# ---- per-document print-ready pages ----
os.makedirs(os.path.join(root,"programme"),exist_ok=True)
for d in docs:
    slug=d["slug"]; dd=os.path.join(root,"programme",slug); os.makedirs(dd,exist_ok=True)
    h=page_head(f"ILM Programme · {d['title']}")
    h+=f"""<main>
<div class="docbar noprint" style="padding:1rem 0"><a class="btn ghost" href="/programme/">← Programme index</a>
<button class="btn" onclick="window.print()">Print / Save as PDF</button></div>
<article class="sheet">
 <div class="kic">Project ILM · {esc(d['type'])} · Programme Definition</div>
 <h1>{esc(d['title'])}</h1>
 <p class="abstract">{esc(d['abstract'])}</p>
 <div class="poster"><a href="/assets/programme/{slug}.jpg" target="_blank" rel="noopener">
   <img src="/assets/programme/{slug}.jpg" alt="{esc(d['title'])}"></a></div>
 <div class="meta">Integrative Linguistic Multiscript (ILM) · Canonical context: <a href="{CTX}">{CTX}</a><br>{COPY}</div>
</article></main></body></html>"""
    open(os.path.join(dd,"index.html"),"w",encoding="utf-8").write(h)
# ---- hub with audience router ----
def card(d):
    return (f'<a class="pcard" href="/programme/{d["slug"]}/">'
            f'<img loading="lazy" src="/assets/programme/{d["slug"]}.thumb.jpg" alt="">'
            f'<span class="pt">{esc(d["type"])}</span><b>{esc(d["title"])}</b></a>')
order=["Master PDD","Pillar I PDD","Pillar II PDD","Architecture","Vision","Scope",
       "Research","Economics","Governance","Certification","Reading ILM"]
docs_sorted=sorted(docs,key=lambda d:(order.index(d["type"]) if d["type"] in order else 99,d["title"]))
AUD=[("I'm a collaborator (AI or human)",
   "Build the programme. <b>Pillar I</b> (linguists, communities, documentation) or <b>Pillar II</b> (compilers, OS, AI, hardware).",
   [("Pillar I PDD","/programme/pillar1-pdd/"),("Pillar II PDD","/programme/pillar2-pdd/"),
    ("Research agenda (work packages)","/programme/research-agenda/"),("How to contribute","/contribute/"),
    ("AI onboarding & validation","/context/")]),
  ("I'm a funder / partner",
   "Economics, scale, governance, and how participation accelerates (but is not required for) the programme.",
   [("Master PDD","/programme/master-pdd/"),("Cost, schedule & earned value","/programme/cost-evm/"),
    ("Cost amortization","/programme/pillar1-amortization/"),("Support & grants","/support/")]),
  ("I'm seeking certification",
   "Make a project Works-with / Built-with / ILM-Certified, via automated checks or self-certification.",
   [("Certification automation","/programme/certification/"),("Security & conformance","/security/")]),
  ("I'm a user",
   "Use ILM: developers, researchers, educators, institutions — explore scripts, languages and the stack.",
   [("3D explorer","/explore/"),("Scripts","/scripts/"),("Languages","/languages/"),
    ("Reading ILM correctly","/programme/interpretation/")])]
extra=""".router{display:grid;grid-template-columns:repeat(auto-fit,minmax(240px,1fr));gap:1rem;margin:1.5rem 0 2rem}
.rcard{background:rgba(20,26,52,.5);border:1px solid var(--line);border-radius:14px;padding:1.1rem 1.2rem}
.rcard h3{color:var(--acc);margin:.1rem 0 .4rem;font-size:1.02rem}.rcard p{color:#cdd4f5;font-size:.86rem;margin:0 0 .6rem}
.rcard a{display:block;color:var(--cy);font-size:.88rem;padding:.16rem 0}
.pgrid{display:grid;grid-template-columns:repeat(auto-fill,minmax(190px,1fr));gap:1rem}
.pcard{display:block;background:rgba(20,26,52,.5);border:1px solid var(--line);border-radius:12px;overflow:hidden;text-decoration:none}
.pcard img{width:100%;display:block;border-bottom:1px solid var(--line)}
.pcard .pt{display:inline-block;color:var(--acc);font-size:.68rem;text-transform:uppercase;letter-spacing:.06em;padding:.5rem .7rem 0}
.pcard b{display:block;color:#e8ecff;font-size:.86rem;padding:.2rem .7rem .8rem;line-height:1.3}"""
hub=page_head("ILM — Programme Documentation",extra)
hub+="""<main><section class="flow"><div class="wrap">
<h2>Programme documentation</h2>
<p class="lead">The formal programme definition set for Project ILM — vision, architecture, economics, governance,
research, and certification. Each document is a single formal page, print- and PDF-ready for submission
(open it, then Print / Save as PDF). Project ILM does not depend on any government to exist; participation by
governments, universities, industry and foundations accelerates scale, coverage and standardization.</p>
<h3>Where should you go?</h3><div class="router">"""
for title,desc,links in AUD:
    hub+=f'<div class="rcard"><h3>{esc(title)}</h3><p>{desc}</p>'+"".join(
        f'<a href="{u}">{esc(t)} →</a>' for t,u in links)+"</div>"
hub+='</div><h3>All programme documents</h3><div class="pgrid">'+"".join(card(d) for d in docs_sorted)+"</div>"
hub+=f'<p class="lead" style="margin-top:1.5rem">Posters &amp; technical posters: <a class="btn ghost" href="/posters/">Poster gallery</a> · Canonical context: <a class="btn ghost" href="{CTX}">/context/</a></p>'
hub+="</div></section></main></body></html>"
open(os.path.join(root,"programme","index.html"),"w",encoding="utf-8").write(hub)
print("generated /programme/ hub +",len(docs),"print-ready document pages")
