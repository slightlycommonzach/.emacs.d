;;; config-projectile.el --- config-projectile.el starts here -*- lexical-binding: t -*-

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

;; Project Traversal

;;; Code:

(use-package projectile
  :ensure t
  :hook (after-init . projectile-mode)
  :bind (:map projectile-mode-map
			  ("s-p" . projectile-switch-project)) ;; Git project or ".projectile" file in project root.
  :config
  (icomplete-mode t)
  (setq projectile-completion-system 'default
		projectile-sort-order 'modification-time)
  (projectile-mode +1))

(provide 'config-projectile)
;;; config-projectile.el ends here
