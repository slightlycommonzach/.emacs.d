;;; config-org.el --- config-org.el starts here -*- lexical-binding: t -*-

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

;; Org-Mode Configuration

;;; Code:

(require 'org-agenda)

(global-set-key (kbd "C-c a") #'org-agenda)

(when (and (not (file-directory-p (concat (expand-file-name "~/Documents/") "Org/")))
		   (y-or-n-p (concat "Make directory " (concat (expand-file-name "~/Documents/") "Org/") "?")))
  (if (file-directory-p (expand-file-name "~/Documents/"))
	  (make-directory (concat (expand-file-name "~/Documents/") "Org/"))
	(progn
	  (make-directory (expand-file-name "~/Documents/"))
	  (make-directory (concat (expand-file-name "~/Documents/") "Org/")))))

(setq org-directory (concat (expand-file-name "~/Documents/") "Org/")
	  org-todo-keywords '((sequence "TODO(t)" "DOING(p)" "|" "FINISHED(f)" "CANCELLED(c)"))
	  org-support-shift-select t)
(setq org-agenda-files (list (concat org-directory
									 (elt (directory-files org-directory nil "\\.org$")
										  (cl-position "agenda.org" (directory-files org-directory nil "\\.org$") :test 'equal)))))

(use-package org-bullets
  :ensure t
  :config (setq org-ellipsis " ⏷ "
				org-catch-invisible-edits 'smart
				org-hide-emphasis-markers t))

(use-package org-rich-yank
  :ensure t
  :bind (:map org-mode-map
			  ("C-M-y" . org-rich-yank))
  :config
  (setq org-rich-yank-add-target-indent t))

(use-package org-chef
  :ensure t
  :defines org-capture-templates
  :config
  (setq org-capture-templates
		'(("c" "Cookbook" entry (file (expand-file-name "~/Documents/Org/cookbook.org"))
		   "%(org-chef-get-recipe-from-url)"
		   :empty-lines 1)
		  ("m" "Manual Cookbook" entry (file (expand-file-name "~/Documents/Org/cookbook.org"))
		   "* %^{Recipe title: }\n  :PROPERTIES:\n  :source-url:\n  :servings:\n  :prep-time:\n  :cook-time:\n  :ready-in:\n  :END:\n** Ingredients\n   %?\n** Directions\n\n"))))

(provide 'config-org)
;;; config-org.el ends here
