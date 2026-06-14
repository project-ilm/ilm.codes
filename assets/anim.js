/* ILM site chrome + animations. (C) 1993-2026 Abhishek Choudhary, GPL-3.0-or-later */
(function(){
 var base = document.currentScript && document.currentScript.dataset.base || "";
 function L(h){return base+h;}
 // migration bar + nav
 var mig = '<div class="mig"><b>We are migrating.</b> <code>ilm.codes</code> retires ~Aug 2026 &rarr; '
   + '<a href="https://ilmcodes.com">ilmcodes.com</a> &middot; <a href="https://ilmcodes.net">ilmcodes.net</a></div>';
 var nav = '<nav class="top"><div class="wrap">'
   + '<a class="brand" href="'+L("/")+'">ILM &middot; ROMENAGRI</a>'
   + '<a href="'+L("/")+'">Home</a>'
   + '<a href="'+L("/explore/")+'">Explore 3D</a>'
   + '<a href="'+L("/scripts/")+'">Scripts</a>'
   + '<a href="'+L("/languages/")+'">Languages</a>'
   + '<a href="'+L("/posters/")+'">Posters</a>'
   + '<a href="'+L("/charter/")+'">Charter</a>'
   + '<a href="'+L("/contribute/")+'">Contribute</a>'
   + '<a href="'+L("/context/")+'">Continue&nbsp;(AI)</a>'
   + '<a href="https://github.com/project-ilm">GitHub</a>'
   + '</div></nav>';
 var foot = '<footer class="site"><div class="wrap">'
   + '&copy; 1993&ndash;2026 Abhishek Choudhary &middot; Romenagri GPL 2003 &middot; Hindawi Programming System 15 Aug 2004 '
   + '&middot; Project ILM<br><span class="mono" style="opacity:.7">One humanity &middot; one ontology &middot; one identity &middot; infinite expressions</span><br>'
   + '<span style="opacity:.6">Moving to ilmcodes.com / ilmcodes.net &middot; '
   + '<a href="'+L("/rti/")+'" style="opacity:.6">record</a></span></div></footer>';
 document.body.insertAdjacentHTML("afterbegin", mig+nav);
 document.body.insertAdjacentHTML("beforeend", foot);

 // reveal on scroll
 var io = new IntersectionObserver(function(es){
   es.forEach(function(e){ if(e.isIntersecting){ e.target.classList.add("in");
     // animate bars + counters within
     e.target.querySelectorAll(".bar>i[data-pct]").forEach(function(b){ b.style.width=b.dataset.pct+"%"; });
     e.target.querySelectorAll("[data-count]").forEach(function(c){
       var to=+c.dataset.count, t0=null, dur=1200;
       function step(ts){ if(!t0)t0=ts; var p=Math.min(1,(ts-t0)/dur);
         c.textContent=Math.floor(p*to).toLocaleString(); if(p<1)requestAnimationFrame(step);}
       requestAnimationFrame(step);
     });
     io.unobserve(e.target);
   }});
 },{threshold:.15});
 document.querySelectorAll(".reveal").forEach(function(el){io.observe(el);});
})();
