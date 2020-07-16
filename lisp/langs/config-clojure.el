;;; config-clojure.el --- config-clojure.el starts here -*- lexical-binding: t -*-

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

;; Clojure-flavor Configuration

;;; Code:

()

(use-package clojure-mode ;; I partake in setting my JAVA_HOME variable to jdk8_openjdk's location
  :ensure t
  :config
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook (lambda () (setq-local comment-column 0))))

(use-package cider
  :ensure t
  :bind (:map cider-mode-map
			  ("C-c C-x c r" . cider-jack-in))
  :config
  (setq cider-prompt-for-symbol nil
		cider-jump-to-pop-to-buffer-actions '((display-buffer-same-window))
		cider-eval-result-prefix ";;|==> "
		cider-allow-jack-in-without-project t
		nrepl-hide-special-buffers t
		nrepl-log-messages t))

(provide 'config-clojure)
;;; config-clojure.el ends here
