<h1 align="center">Toby's Neovim Config</h1>

<div align="center">
    	<a href="#install">Install</a>
  <span> • </span>
        <a href="#features">Features</a>
</div>

<h2>Showcase</h2>

<img src="./media/telescope_findfiles.png" />
<img src="./media/completion.png" />
<img src="./media/snippets.png" />
<img src="./media/terminal.png" />

<h2 id="install">Install</h2>
```terminal
    $ git clone https://github.com/TobyBridle/neovim-config ./nvim && nvim ./nvim/lua/plugins.lua +PackerSync
```
There are quite a few command-line dependencies (e.g ripgrep, LazyGit). To find the ones which you have not installed, run <pre>:checkhealth</pre> from within neovim upon install.

<h2 id="features">Features</h2>
<ul>
<li>Easy configuration of basic things such as colorscheme from within `core/custom.lua`</li>
<li>Most plugins are lazy-loaded meaning that they are only loaded as of when they are needed</li>
<li>Inbuilt toggleable terminal using **FTerm.lua**</li>
<li>Git management using LazyGit</li>
<li>File searching, Word finding and more using **Telescope**</li>
<li>Autocompletion and snippets using **nvim-cmp**</li>
<li>Mappings keysheet using **which-key**</li>
</ul>
