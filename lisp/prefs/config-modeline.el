;;; config-modeline.el --- config-modeline.el starts here -*- lexical-binding: t -*-

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

;; Mode Line Simplistic Configuration

;;; Code:

(require 'planetary) ; See my Repo @ https://github.com/slightlycommonzach/planetary
(setq exclude-similar-data t)
(setq animated-timer t)
(planetary-mode 1)

(define-key planetary-mode-map (kbd "C-p s") #'stop-blink)

(use-package minions
  :ensure t
  :config (minions-mode 1)
  (setq minions-direct '(flycheck-mode)))

(display-time)

(provide 'config-modeline)
;;; config-modeline.el ends here
