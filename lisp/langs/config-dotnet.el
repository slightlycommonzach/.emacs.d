;;; config-dotnet.el --- config-dotnet.el starts here -*- lexical-binding: t -*-

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

;; Various Dotnet Configuration Things

;;; Code:

(require 'config-company)

(defadvice omnisharp-install-server (around auto-confirm compile activate)
  "Map the size prompt of Omnisharp-Install-Server to always be yes, but hindered under the circumstance that it is already installed."
  (cl-letf (((symbol-function 'yes-or-no-p) (lambda (&rest args) t))
			((symbol-function 'y-or-n-p) (lambda (&rest args) t)))
	ad-do-it))

(use-package csharp-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode)))

(use-package omnisharp
  :ensure t
  :commands omnisharp-code-format-entire-file recompile omnisharp-run-code-action-refactoring
  :hook (csharp-mode . omnisharp-mode)
  :bind (:map omnisharp-mode-map
			  ([(meta shift f)] . omnisharp-code-format-entire-file))
  :config
  (when (not (file-directory-p (concat user-emacs-directory ".cache/omnisharp/")))
	(omnisharp-install-server nil)
	(ad-unadvise #'omnisharp-install-server))
  (ad-unadvise #'omnisharp-install-server)
  (add-hook 'omnisharp-mode (function (lambda ()
										(local-set-key (kbd "C-c C-c") #'recompile)
										(local-set-key (kbd "C-c r r") #'omnisharp-run-code-action-refactoring)
										(omnisharp-start-omnisharp-server))))
  (add-to-list 'company-backends #'company-omnisharp)
  (setq c-syntactic-indentation t))

(provide 'config-dotnet)
;;; config-dotnet.el ends here
