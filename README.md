# .emacs.d

## Features

- Plug & Play
- Support for multiple programming languages (w/ auto-completion "company" support.)
   - C/C++/C#
   - Clojure/SLIME (Common Lisp)
   - Java
   - Python
   - HTML/CSS/JavaScript
   - JSON/YAML
- [Flycheck](https://www.flycheck.org/) for Syntax.
- Flyspell for Spelling
- [Writeroom](https://github.com/joostkremers/writeroom-mode)/[good](https://github.com/bnbeckwith/writegood-mode)
- [Org Chef](https://github.com/Chobbes/org-chef/)
- [which-key](https://github.com/justbur/emacs-which-key)
- [Treemacs](https://github.com/Alexander-Miller/treemacs)

## Usage

See [Installation](#installation) for Installation details.

[PragmataPro](https://fsd.it/shop/fonts/pragmatapro/) is a paid font by Fabrizio Schiavi that I personally cannot recommend enough, well worth the price.

In [Screenshots](#screenshots) you can see examples of its appearance in Emacs.

## Installation

### Prerequisites:
- [SBCL](http://sbcl.sourceforge.net/platform-table.html) (for SLIME support)
- [Leiningen](https://leiningen.org/) (optional) (for Clojure)
- [OpenJDK](https://adoptopenjdk.net/) (for [LSP-Java](https://github.com/emacs-lsp/lsp-java) support)
- [black](https://github.com/wbolster/emacs-python-black/tree/a11ca73f6dfcdc125d27ff184496d66bdbd71326) (optional) (for Python formatting support)

**Flyspell**

A common error that you might come across when trying to take advantage of Flyspell is an error in "en_US".

To fix this, install `aspell-en` on your desktop.

## Roadmap

I'm going to primarily continue to focus development on:

- Design (Icons, Theming, etc.)

## Screenshots

Atom One Dark Examples:

[![Dashboard Buffer](./screenshots/atom-one-dark-dashboard.png)](https://github.com/slightlycommonzach/.emacs.d/blob/master/screenshots/atom-one-dark-dashboard.png)

[![In Action](./screenshots/atom-one-dark-init.png)](https://github.com/slightlycommonzach/.emacs.d/blob/master/screenshots/atom-one-dark-init.png)

Custom Solarized Theme (contains issues with Company-Mode):

[![Dashboard Buffer](./screenshots/solarized-idea-theme-dashboard.png)](https://github.com/slightlycommonzach/.emacs.d/blob/master/screenshots/solarized-idea-theme-dashboard.png)

[![In Action](./screenshots/solarized-idea-theme-init.png)](https://github.com/slightlycommonzach/.emacs.d/blob/master/screenshots/solarized-idea-theme-init.png)
