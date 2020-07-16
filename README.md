# .emacs.d

## Features

- Plug & Play
- Support for multiple programming languages (w/ auto-completion "company" support.
   - C/C++/C#
   - Clojure
   - Python
- Flycheck for Syntax.
- Flyspell for Spelling
- [Writeroom](https://github.com/joostkremers/writeroom-mode)/[good](https://github.com/bnbeckwith/writegood-mode) support.
- [Org Chef](https://github.com/Chobbes/org-chef/) support
- [which-key](https://github.com/justbur/emacs-which-key)

## Usage

See [Installation](#installation) for Installation details.

[PragmataPro](https://fsd.it/shop/fonts/pragmatapro/) is a paid font by Fabirizio Schiavi that I personally cannot recommend enough, well worth the price.

In [Screenshots](#screenshots) you can see examples of its appearance in Emacs.

## Installation

This Emacs configuration is primarily plug and play, but there are some quirks that I could not find a way to incorporate to be installed from Lisp so these are 2 things you may wish to do:

If you wish to take advantage of .NET support for the C# language, you'll have to run (below) and approve the installation size:

 `M-x omnisharp-install-server`


Another common error that you might come across when trying to take advantage of Flyspell is an error in "en_US".

To fix this, install `aspell-en` on your desktop.

Among the `lang/` configuration files you can find that there are small notes here and there pertaining to my setup in these.

## Roadmap

I'm going to primarily continue to focus development on:

- Web programming-related functionality
- General programming language support (Java, Elixir, etc.)
- Org related functionality
- Design (Icons, Theming, etc.)

## Screenshots

Atom One Dark Examples:

![Dashboard Buffer](./screenshots/atom-one-dark-dashboard.png)

![In Action](./screenshots/atom-one-dark-init.png)

Custom Solarized Theme (contains issues with Company-Mode):

![Dashboard Buffer](./screenshots/solarized-idea-theme-dashboard.png)

![In Action](./screenshots/solarized-idea-theme-init.png)