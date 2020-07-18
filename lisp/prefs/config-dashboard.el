;;; config-dashboard.el --- config-dashboard.el starts here -*- lexical-binding: t -*-

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

;; Startup Dashboard Configuration

;;; Code:

;; Dependencies
(use-package page-break-lines
  :ensure t
  :config (global-page-break-lines-mode))
(use-package all-the-icons
  :ensure t)

(use-package dashboard
  :preface (defun banner-data ()
			 "Set the dashboard's init-info to initialization data."
			 (setq dashboard-init-info
				   (format "Initialized in %.2f seconds with %d Garbage Collections.\n"
						   (float-time (time-subtract after-init-time before-init-time)) gcs-done)))
  :ensure t
  :hook ('dashboard-mode . #'banner-data)
  :config
  (setq dashboard-set-init-info t
        dashboard-banner-logo-title "Welcome to your Emacs REPL!"
		dashboard-set-navigator t
		dashboard-center-content t
		dashboard-set-heading-icons t
		dashboard-footer-messages nil
		dashboard-startup-banner (concat user-emacs-directory "images/nicholascage.png"))
  (setq dashboard-navigator-buttons
		`(((,""
			"GitHub"
			"https://www.github.com/slightlycommonzach/.emacs.d/"
			(lambda () (browse-url "https://www.github.com/slightlycommonzach/.emacs.d/"))))))
  (setq dashboard-items '((recents . 5)
						  (bookmarks . 5)
						  (agenda . 5)))
  (dashboard-setup-startup-hook))

(provide 'config-dashboard)
;;; config-dashboard.el ends here
