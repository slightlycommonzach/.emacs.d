;;; config-treemacs.el --- config-treemacs.el starts here -*- lexical-binding: t -*-

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

;; Treemacs File Explorer

;;; Code:

(use-package treemacs
  :ensure t
  :defer t
  :commands treemacs-git-mode treemacs-follow-mode treemacs-set-scope-type
  :config (require 'treemacs-tags)
  (define-key treemacs-mode-map [mouse-1] 'treemacs-doubleclick-action)
  (define-key treemacs-mode-map (kbd "<left>") 'treemacs-toggle-node)
  (define-key treemacs-mode-map (kbd "<right>") 'treemacs-toggle-node)
  (setq treemacs-width 30)
  (treemacs-follow-mode t)
  (pcase (cons (not (null (executable-find "git")))
			   (not (null (executable-find "python3"))))
	(`(t . t)
	 (treemacs-git-mode 'deferred))
	(`(t . _)
	 (treemacs-git-mode 'simple)))
  (setq treemacs--width-is-locked t)
  :bind
  (:map global-map
        ("C-x t t"   . treemacs)
        ([f8]        . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))
(use-package lsp-treemacs
  :ensure t
  :hook (java-mode . (lambda () (lsp-treemacs-sync-mode 1))))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)
(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))
(use-package treemacs-persp
  :after treemacs persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

(provide 'config-treemacs)
;;; config-treemacs.el ends here
