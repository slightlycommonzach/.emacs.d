;;; config-reading.el --- config-reading.el starts here -*- lexical-binding: t -*-

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

;; Reading various things, doesnt have to be PDF-esque stuff,
;; file traversal, the like.

;;; Code:

(use-package dumb-jump
  :ensure t
  :config (add-to-list 'xref-backend-functions #'dumb-jump-xref-activate)
  (setq dumb-jump-prefer-searcher 'ag))

(use-package nov
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.epub$" . nov-mode)))

(use-package elfeed
  :ensure t
  :config (global-set-key (kbd "C-x w") 'elfeed)
  (setq url-queue-timeout 30
                elfeed-db-directory (locate-user-emacs-file ".elfeed")
                elfeed-show-entry-switch #'pop-to-buffer
                elfeed-show-entry-delete #'delete-window
                elfeed-feeds '(("https://www.reddit.com/r/unixporn.rss" reddit)))
  (elfeed-update))

(use-package sx
  :ensure t
  :config
  (bind-keys :prefix "C-c s"
             :prefix-map my-sx-map
             :prefix-docstring "Global keymap for SX."
             ("q" . sx-tab-all-questions)
             ("o" . sx-open-link)
             ("s" . sx-search)))

(provide 'config-reading)
;;; config-reading.el ends here
