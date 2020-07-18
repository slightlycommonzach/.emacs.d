;;; config-flycheck.el --- config-flycheck.el starts here -*- lexical-binding: t -*-

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

;; Syntax Checker Configuration

;;; Code:

(use-package flycheck
  :commands flycheck-refresh-fringes-and-margins
  :preface (defun fringe-indications ()
			 "."
			 (setq-default right-fringe-width 0 right-margin-width 3
						   flycheck-indication-mode 'right-margin)
			 (flycheck-refresh-fringes-and-margins))
  :ensure t
  :hook ('flycheck-mode . #'fringe-indications)
  :config
  (global-flycheck-mode)
  (setq flycheck-emacs-lisp-load-path 'inherit))

(use-package flycheck-irony
  :ensure t
  :after flycheck
  :hook (flycheck-mode . flycheck-irony-setup))

(use-package flycheck-posframe
  :ensure t
  :after flycheck
  :hook (flycheck-mode . flycheck-posframe-mode))

(use-package flycheck-pos-tip
  :ensure t
  :after flycheck
  :hook (flycheck-mode . flycheck-pos-tip-mode))

(provide 'config-flycheck)
;;; config-flycheck.el ends here
