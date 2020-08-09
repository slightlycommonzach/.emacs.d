;;; config-java.el --- config-java.el starts here -*- lexical-binding: t -*-

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

;; LSP Java Configuration

;;; Code:

(require 'config-company)

(use-package lsp-mode
  :ensure t
  :preface (use-package lsp-java :ensure t)
  :hook (java-mode . #'lsp)
  :config (require 'lsp-mode)
  (if (not (file-directory-p lsp-java-server-install-dir))
	  (let ((collect (--map (cons (funcall (-compose #'symbol-name #'lsp--client-server-id) it) it) ;; Taken from LSP-Mode source code to auto-install jdtls without user prompt
							(->> lsp-clients (ht-values)
								 (-filter (-andfn (-orfn (-not #'lsp--server-binary-present?)
														 (-const nil))
												  (-not #'lsp--client-download-in-progress?)
												  #'lsp--client-download-server-fn))))))
		(lsp--install-server-internal
		 (cdr (assoc (or (elt (car collect)
							  (cl-position "jdtls" (car collect) :test 'equal))
						 (user-error "There are no servers with automatic installation"))
					 collect))
		 nil)))
  (setq lsp-diagnostic-package nil))
(with-eval-after-load 'lsp-mode
  (define-key lsp-mode-map (kbd "TAB") #'company-indent-or-complete-common))

(use-package dap-mode
  :ensure t
  :after lsp-java
  :config (require 'dap-java)
  (dap-mode t)
  (dap-ui-mode t))

(use-package lsp-java
  :ensure nil
  :after lsp-mode
  :hook (java-mode . company-mode)
  :commands lsp-java-vmargs
  :bind (:map lsp-mode-map
			  ("M-S f" . lsp-format-buffer)
			  ("C-S i" . lsp-java-organize-imports)
			  ("<f9>"  . lsp-java-build-project)
			  ("<f7>"  . lsp-java-generate-getters-and-setters))
  :config
  (setq lsp-java-vmargs
		(list
		 "-noverify"
		 "-Xmx2G"
		 "-XX:+UseG1GC"
		 "-XX:+UseStringDeduplication")
		lsp-java-format-settings-profile "GoogleStyle"
		lsp-java-java-path (getenv "JAVA_HOME") ;; Set to the directory of ‎a java-8-openjdk installation
		lsp-file-watch-ignored '(".idea" ".git" "build")
		lsp-java-format-on-type-enabled nil))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :defines lsp-ui-flycheck-list-position ui-doc-header
  :config (setq lsp-ui-flycheck-list-position 'right
				lsp-ui-doc-include-signature t
				lsp-ui-doc-border "white"
				ui-doc-header t))

(provide 'config-java)
;;; config-java.el ends here
