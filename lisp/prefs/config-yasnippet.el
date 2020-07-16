;;; config-yasnippet.el --- config-yasnippet.el -*- lexical-binding: t -*-

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

;; Snippet insertion through keywords

;;; Code:

(use-package yasnippet
  :ensure t
  :commands yas-reload-all
  :config
  (setq yas-verbosity 1)
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode))

(use-package yasnippet-snippets
  :ensure t)

(provide 'config-yasnippet)
;;; config-yasnippet.el ends here
