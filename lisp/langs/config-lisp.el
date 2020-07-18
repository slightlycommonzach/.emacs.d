;;; config-lisp.el --- config-lisp.el starts here -*- lexical-binding: t -*-

;; Author: Zachary Chamberlain
;; Maintainer: Zachary Chamberlain

;; This file is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.


;;; Commentary:

;; Clojure-flavor Configuration

;;; Code:

(eval-when-compile '(require 'cl))

(use-package slime ;; Install SBCL (Steel Bank Common Lisp)
  :ensure t
  :preface
  (defun delete-quicklisp-installer ()
	(when (file-exists-p (expand-file-name (concat user-emacs-directory "lisp/quicklisp.lisp")))
	  (delete-file (expand-file-name (concat user-emacs-directory "lisp/quicklisp.lisp")))
	  (message "Deleted Installation File")))
  
  (defun install-quicklisp ()
	(if (not (file-directory-p (expand-file-name (concat user-emacs-directory "quicklisp/"))))
		(progn (message "quicklisp thang")
			   (shell-command
				(concat "sbcl --no-sysinit --no-userinit --noprint --load "
						(expand-file-name (concat user-emacs-directory "lisp/quicklisp.lisp "))
						"--eval '(quicklisp-quickstart:install :path \""
						(expand-file-name (concat user-emacs-directory "quicklisp/"))
						"\")' --eval '(ql:add-to-init-file)' --quit"))
			   (delete-quicklisp-installer))))
  
  (defun install-slime-helper ()
	(when (and (file-directory-p (concat user-emacs-directory "quicklisp/"))
			   (not (file-exists-p (concat user-emacs-directory "quicklisp/slime-helper.el"))))
	  (shell-command "sbcl --eval '(ql:quickload :quicklisp-slime-helper)' --quit")))
  
  (defun prep-slime ()
	(install-quicklisp)
	(install-slime-helper)
	(load (expand-file-name (concat user-emacs-directory "quicklisp/slime-helper.el")))
	(when (not (eq major-mode 'lisp-mode))
	  (slime)
	  (lisp-mode)
	  ))
  :config
  (setq inferior-lisp-program (executable-find "sbcl"))
  (add-to-list 'slime-contribs '(slime-repl slime-autodoc slime-references))
  ;; For Help w/ Slime REPL: https://common-lisp.net/project/slime/doc/html/REPL.html
  (slime-setup '(slime-fancy slime-references slime-autodoc slime-repl slime-company))
  (add-to-list 'auto-mode-alist '("\\.lisp$" . prep-slime)))

(use-package clojure-mode ;; I partake in setting my JAVA_HOME variable to jdk8_openjdk's location
  :ensure t
  :config
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook (function (lambda () (setq-local comment-column 0)))))

(use-package clojure-mode-extra-font-locking :ensure t)

(use-package cider ;; Install Leiningen
  :ensure t
  :bind (:map cider-mode-map
			  ("C-c C-x c r" . cider-jack-in))
  :config
  (setq cider-prompt-for-symbol nil
		cider-jump-to-pop-to-buffer-actions '((display-buffer-same-window))
		cider-eval-result-prefix ";;=<|==> "
		cider-allow-jack-in-without-project t
		nrepl-hide-special-buffers t
		nrepl-log-messages t))

(provide 'config-lisp)
;;; config-lisp.el ends here
