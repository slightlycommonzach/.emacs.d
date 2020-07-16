;;; config-python.el --- config-python.el starts here -*- lexical-binding: t -*-

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

;; Python coding environment setup

;;; Code:

(use-package python
  :ensure nil
  :config
  ;; I use: pip pyenv flake8
  (setq python-shell-interpreter "python3"
		python-shell-interpreter-args "-i")
  (setq python-indent-offset 4)
  (use-package pipenv
	:ensure t
	:config
	(setq pipenv-projectile-after-switch-function 'pipenv-projectile-after-switch-extended)))

(use-package python-black ;; M-S f
  :ensure t
  :after python
  :bind (:map python-mode-map
			  ([(meta shift f)] . python-black-buffer)))

(provide 'config-python)
;;; config-python.el ends here
