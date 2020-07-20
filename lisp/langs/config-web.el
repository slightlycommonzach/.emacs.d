;;; config-web.el --- config-web.el starts here -*- lexical-binding: t -*-

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

;; Web-Related Programming Functionality

;;; Code:

(use-package web-beautify :ensure t)

;; HTML
(use-package web-mode
  :ensure t
  :bind (:map web-mode-map ("C-c b" . web-beautify-html))
  :config (add-to-list 'auto-mode-alist '("\\.html$" . web-mode)))

;; CSS
(use-package css-mode
  :ensure nil
  :config (setq css-indent-offset 2))
(use-package css-eldoc
  :commands turn-on-css-eldoc
  :hook (css-mode  . turn-on-css-eldoc))

(use-package json-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.json$" . json-mode)))
(use-package yaml-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))

;; JavaScript
(use-package js2-mode
  :ensure t
  :bind (:map js2-mode-map
			  ("C-c b" . web-beautify-js))
  :config (setq js2-mode-assume-strict t
				js2-strict-trailing-comma-warning t)
  (add-to-list 'auto-mode-alist '())
  (add-to-list 'auto-mode-alist '()))
(use-package js2-refactor
  :ensure t
  :hook (js2-mode . js2-refactor-mode)
  :config (js2r-add-keybindings-with-prefix "C-c C-m"))

(eval-after-load 'json-mode
  '(add-hook 'json-mode-hook
             (lambda () (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))
(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook
             (lambda () (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))
(eval-after-load 'web-mode
  '(add-hook 'web-mode-hook
             (lambda () (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))
(eval-after-load 'css-mode
  '(add-hook 'css-mode-hook
             (lambda () (add-hook 'before-save-hook 'web-beautify-css-buffer t t))))

(provide 'config-web)
;;; config-web.el ends here
