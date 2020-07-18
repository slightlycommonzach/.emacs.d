;;; init.el --- Global settings -*- lexical-binding: t; -*-

;;; Commentary:

;; Here be dragons

;;; Code:
;; Increase the garbage collection threshold to 500 MB to ease startup
(setq gc-cons-threshold (* 500 1024 1024))

;; List package archives and initialize them
(require 'package)
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(package-refresh-contents)

;; Startup Times
(unless (package-installed-p 'use-package)
  (package-install 'use-package)
  (require 'use-package))
(require 'bind-key)

;; Make Sure Org Is Installed
(use-package org
  :ensure t)
;; "Org-plus-contrib" needs loading before any org related functionality is called
(unless (package-installed-p 'org-plus-contrib)
  (package-refresh-contents)
  (package-install 'org-plus-contrib))

(setq user-full-name "Zachary Chamberlain"
      make-backup-files nil
	  inhibit-startup-screen t)

;; Gets rid of "side content"
(if (display-graphic-p)
  (progn
    (tool-bar-mode -1)
    (scroll-bar-mode -1)
    (horizontal-scroll-bar-mode -1)))
(setq auto-save-default nil)
(menu-bar-mode -1)
(fringe-mode -1)

(global-unset-key [(meta shift f)])

;; Line Numbers
(defun linum-format-func (line)
  "Display LINE number on the side left to the left-fringe."
  (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
	(propertize (format (format "  %%%dd  " w) line) 'face 'linum)))
(add-hook 'prog-mode-hook 'linum-mode)
(setq-default linum-format #'linum-format-func)

(use-package hlinum
  :ensure t
  :config (hlinum-activate)
  (global-hl-line-mode))
(setq-default tab-width 4)

;; Removes all bold text
(defadvice set-face-attribute
	(before no-bold (face frame &rest args) activate)
  "Get the screen's bold texts and pass them in."
  (setq args
		(mapcar (lambda(x) (if (eq x 'bold) 'normal x))
				args)))

;; UTF-8 support
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(if (eq window-system 'x)
	(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))
(if (eq system-type 'gnu/linux)
	(add-hook 'term-exec-hook
		  (function
		   (lambda () (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix)))))

;; Theming
(add-to-list 'default-frame-alist '(font . "PragmataPro Liga-15"))
(use-package atom-one-dark-theme
  :ensure t
  :config (load-theme 'atom-one-dark t))
(use-package rainbow-mode ;; String Backgrounds when hex colors are present
  :ensure t
  :config
  (setq rainbow-x-colors nil)
  (add-hook 'prog-mode-hook 'rainbow-mode))

;(use-package solarized-theme
;  :ensure t
;  :config
;  (if (eq window-system 'x)
;	  (setq x-underline-at-descent-line t))
;  (solarized-create-theme-file-with-palette 'dark
;											'solarized-idea
;											'("#292c34" "#F8F8F2" "#aa6700" "#90b6fe" "#ffffff" "#b05080" "#805090" "#fec66c" "#859c61" "#c64e3b")
;											'((custom-theme-set-faces
;											   'solarized-idea
;											   `(font-lock-function-name-face((t (:foreground "#29ac88"))))
;											   `(font-lock-type-face((t (:foreground "#5f819d"))))
;											   `(font-lock-built-in-face((t (:foreground "#5f819d"))))
;											   `(font-lock-string-face((t (:foreground "#859c61"))))
;											   `(font-lock-negation-char-face((t (:foreground "#f1ad21")))))))
;  (load-theme 'solarized-idea t))

; Smart Delimiters
(defun electric-pair ()
  "If at end of line, insert character pair without surrounding spaces.
Otherwise, just insert the typed character."
  (interactive)
  (if (eolp)
	  (let (parens-require-spaces) (insert-pair))
	(self-insert-command 1)))
(add-hook 'prog-mode-hook
		  (lambda ()
			(define-key prog-mode-map "\"" 'electric-pair)
			(define-key prog-mode-map "\'" 'electric-pair)
			(define-key prog-mode-map "(" 'electric-pair)
			(define-key prog-mode-map "[" 'electric-pair)
			(define-key prog-mode-map "{" 'electric-pair)))
(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package ace-window ;; Open a New Window With C-x 2+ | Change To With M-\
  :ensure t
  :config
  (setq aw-background nil)
  (global-set-key (kbd "M-\\") 'ace-window))
(use-package which-key ;; Any
  :ensure t
  :config (add-hook 'after-init-hook 'which-key-mode))

(use-package goto-last-change ;; C-;
  :ensure t
  :bind (("C-;" . goto-last-change)))
(use-package undo-tree ;; C-x u
  :ensure t
  :config (global-undo-tree-mode))

;; Text Scaling
(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)
(when (display-graphic-p)
  (setq mouse-wheel-scroll-amount 		'(2 ((shift) . 1))
        mouse-wheel-progressive-speed 	nil))
(setq scroll-step 			2
      scroll-margin 		0
      scroll-conservatively 100000)

;; Loading external files
(add-to-list 'load-path (concat user-emacs-directory "lisp/"))
(add-to-list 'load-path (concat user-emacs-directory "lisp/langs/"))
(add-to-list 'load-path (concat user-emacs-directory "lisp/prefs/"))
(add-to-list 'load-path (concat user-emacs-directory "lisp/prefs/modes/"))
(add-to-list 'load-path (concat user-emacs-directory "lisp/prefs/modes/planetary/"))
(add-to-list 'load-path (concat user-emacs-directory "lisp/prefs/modes/planetary/images/"))
(add-to-list 'load-path (concat user-emacs-directory "site-lisp/"))

;; ~/.emacs.d/lisp/prefs/
(require 'config-projectile)
(require 'config-persp)
(require 'config-company)
(require 'config-flycheck)
(require 'config-modeline)
(require 'config-org)
(require 'config-dashboard)
(require 'config-treemacs)
(require 'config-yasnippet)
(require 'pragmatapro-lig)
(pragmatapro-lig-global-mode)
(global-prettify-symbols-mode +1)

;; ~/.emacs.d/lisp/langs/
(require 'config-c)
(require 'config-python)
(require 'config-lisp)
(require 'config-dotnet)

;; Garbage collector - decrease threshold to 5 MB
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold (* 5 1024 1024))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("d1af5ef9b24d25f50f00d455bd51c1d586ede1949c5d2863bef763c60ddf703a" "a1966abd6ce763bdb037b913890d796813807bcb63183f072ea272d323c45c20" "d88049c628f3a8a92f9e46982d3e891867e4991de2b3a714f29f9f5eb91638c1" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "f2039484a1c9aea786674570981e130f3004c92088136e700e51009735ec5bcb" default)))
 '(package-selected-packages
   (quote
	(csharp-mode dashboard rainbow-delimiters smartparens hlinum org-plus-contrib))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-error ((t (:underline (:style wave :color "red")))))
 '(flycheck-warning ((t (:underline (:style wave :color "yellow")))))
 '(icomplete-first-match ((t (:weight normal :foreground "#5a76cd"))))
 '(mode-line-buffer-id ((t (:weight bold)))))

;;; init.el ends here
