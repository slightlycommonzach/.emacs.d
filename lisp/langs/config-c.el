;;; config-c.el --- config-c.el starts here -*- lexical-binding: t -*-

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

;; C & C++ Configuration

;;; Code:

(require 'config-company)

(use-package cc-mode
  :ensure nil
  :commands c-toggle-auto-newline
  :bind (:map c-mode-base-map
			  ("C-c c" . compile)
			  ("\C-m" . c-context-line-break))
  :hook ((c-mode-common . (lambda () (c-set-style "stroustrup")))
		 (c-mode-common . (lambda () (c-toggle-auto-newline 1))))
  :config
  (setq-default c-basic-offset 4))

(defun irony-get-proper-dir (dir)
  "Go through DIR to try and find the most recent version of irony, for the sake of its name so automatic installation can occur without user specification."
  (expand-file-name
   (concat dir
		   (elt (directory-files (expand-file-name dir) nil "^\\(irony-[0-9]+\.[0-9]+.*$\\)") 0))))

(use-package irony
  :ensure t
  :after cc-mode
  :hook ((c-mode . irony-mode)
		 (c++-mode . irony-mode)
		 (irony-mode . irony-cdb-autosetup-compile-options))
  :config (require 'irony)
  (if (not (file-directory-p ;; Doesn't work if you've installed irony-server before, if you need to reinstall just remove (not) and restart. May fix later.
			(concat (file-name-as-directory temporary-file-directory)
					(file-name-as-directory (format "build-irony-server-%s"
													(irony-version))))))
	  (irony-install-server (concat "cmake -DCMAKE_INSTALL_PREFIX\="
									(expand-file-name user-emacs-directory)
									"irony/ "
									(irony-get-proper-dir (concat user-emacs-directory "elpa/"))
									"/server && cmake --build . --use-stderr --config Release --target install"))))

(use-package modern-cpp-font-lock
  :ensure t
  :config (modern-c++-font-lock-global-mode t))

(provide 'config-c)
;;; config-c.el ends here
