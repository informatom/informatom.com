
* Hierarchy: slides within ``<div class="reveal"> <div class="slides">`` and 
                           ``</div></div>``
* (horizontal) Slides: within ``<section>`` and 
                              ``</section>``
* Vertical slides: = slides within slide
* Markdown: within ``<section data-markdown> <script type="text/template">`` and 
                   ``</script></section>``
* external Markdown: content in markdown text file example.md
  ``<section data-markdown="example.md" data-separator="^\n\n\n" data-vertical="^\n\n"></section>``
* internal links: to link to ``<section id="some-slide">`` 
  use either ``<a href="#/2/2">Link</a>`` or ``<a href="#/some-slide">Link</a>``
* navigation links: ``<a href="#" class="navigate-left|right|up|down|prev|next">``
* transitions: ``<section data-transition="zoom|default|cube|page|concave|linear|fade|none">`` and 
               ``<section data-transition-speed="fast|slow|default">``
* fragments: within ``<p class="fragment">`` and ``</p>``
* fragment transitions: 
  ``<p class="fragment grow|roll-in|fade-out|highlight-red|highlight-green|highlight-blue">``
* multiple fragments sequentially: by nesting between
  ``<span class="fragment fade-in"><span class="fragment fade-out">`` and ``</span></span>``
* Fragment display order: ``<p class="fragment" data-fragment-index="1|2|3|...">``
* Code highlighting: within ``<pre><code>`` and ``</code></pre>`` 
* editable Code: ``<pre><code contenteditable>``
* Speaker notes: between ``<aside>`` or ``<aside data-markown>`` and ``</aside>`` within section

* Overview Mode: [ESC] toggles
* Fullscreen: toggle on [F] , toggle off [ESC]
* Zoom: [ALT] + [left click]
* Backout: toggle [b] 

* Headlines: within ``<h1|2|3>`` and ``</h1|2|3>``
* Images: ``<img width="178" height="238" src="http://path/to/filename.jpg" alt="alt-text">``
* Link: ``<a href="http://path/to/target">Linktext</a>``
* Unordered Lists: with ``<ul>`` and ``</ul>`` , item text within ``<li>`` and ``</li>``
* Ordered Lists: with ``<ol>`` and ``</ol>`` , item text within ``<li>`` and ``</li>``
* inline Quote: within ``<q cite="http://path/to/citation">`` and ``</q>``
* external Quote: within ``<blockquote cite="http://path/to/citation">`` ans ``</blockquote>``
