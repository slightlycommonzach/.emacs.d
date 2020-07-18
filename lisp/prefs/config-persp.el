;;; config-persp.el --- config-persp.el starts here -*- lexical-binding: t -*-

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

;; Buffer configurations to be saved when quit

;;; Code:

(use-package persp-mode
  :ensure t
  :init
  (use-package workgroups
	:ensure t)
  :config
  (setq wg-morph-on nil
		persp-save-dir (concat user-emacs-directory "lisp/prefs/persp-confs/")
		persp-auto-save-fname "buffer-lineup"
		persp-autokill-buffer-on-remove 'kill-weak)
  (add-hook 'after-init-hook (lambda () (persp-mode 1))))

(use-package golden-ratio
  :ensure t
  :config (golden-ratio-mode 1))

(provide 'config-persp)
;;; config-persp.el ends here
