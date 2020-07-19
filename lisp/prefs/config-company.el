;;; config-company.el --- config-company.el starts here -*- lexical-binding: t -*-

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

;; Auto Completion

;;; Code:

(require 'config-lisp)

(use-package company
  :ensure t
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :commands company-indent-or-complete-common
  :hook (after-init	. global-company-mode)
  :config (require 'company-capf)
  (setq company-idle-delay 0.2
		company-tooltip-limit 14
		company-minimum-prefix-length 1
		company-dabbrev-downcase nil
		company-dabbrev-ignore-case nil
		company-global-modes '(not org-mode
								   shell-mode
								   help-mode
								   text-mode))
  (define-key company-mode-map [remap indent-for-tab-command] 'company-indent-or-complete-common)
  (add-to-list 'company-backends 'company-capf))

(use-package slime-company
  :ensure t
  :after (slime company)
  :config (setq slime-company-completion 'fuzzy
                slime-company-after-completion 'slime-company-just-one-space))

(use-package company-irony
  :ensure t
  :after company
  :config (add-to-list 'company-backends #'company-irony))

(use-package company-box
  :ensure t
  :after company
  :hook (company-mode . company-box-mode))

(provide 'config-company)
;;; config-company.el ends here
