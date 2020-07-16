;;; config-writing.el --- config-writing.el -*- lexical-binding: t -*-

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

;; Style of writing, be it literature or coding!

;;; Code:

(use-package writegood-mode
  :ensure t
  :bind ("C-c g" . writegood-mode))

(use-package writeroom-mode
  :ensure t
  :hook (writeroom-mode . writegood-mode))

(use-package flyspell ;; Install aspell-en if receiving an error message about failing to get "en_US"
  :ensure t
  :hook ((org-mode . flyspell-mode)
		 (text-mode . flyspell-mode)
		 (flyspell-mode . writegood-mode))
  :config (define-key flyspell-mode-map (kbd "<f12>") 'flyspell-auto-correct-previous-word)
  (setq ispell-local-dictionary "english"))

(use-package define-word
  :ensure t
  :config
  (global-set-key (kbd "M-#") 'define-word-at-point)
  (global-set-key (kbd "M-#") 'define-word))

(use-package origami
  :ensure t
  :init (use-package s :ensure t)
  (use-package dash :ensure t)
  :config
  (add-hook 'prog-mode-hook 'origami-mode))

(provide 'config-writing)
;;; config-writing.el ends here
