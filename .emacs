(require 'package)

(setq inhibit-startup-screen t)

;; If you want to use latest version
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; If you want to use last tagged version
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; M-x auto-complete-mode
(ac-config-default)
(global-auto-complete-mode t)

(setq make-backup-files        nil)
(setq auto-save-default        nil)
(setq auto-save-list-file-name nil)

;; Linum plugin
(require 'linum)
(line-number-mode   t)
(global-linum-mode  t)
(column-number-mode t)
(setq linum-format " %d")

;; Syntax highlighting
(require 'font-lock)
(global-font-lock-mode             t)
(setq font-lock-maximum-decoration t)
(show-paren-mode t)

;; (set-face-attribute 'default nil :height 150)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("/run/media/denysenko/KINGSTON/OrgFiles/home.org")))
 '(package-selected-packages (quote (org-link-minor-mode typescript-mode cedit ecb git-gutter org web-mode color-theme auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'wombat t)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)


;; development

 '(ecb-compile-window-height 0.25)
 '(ecb-compile-window-temporally-enlarge (quote after-selection))
 '(ecb-compile-window-width (quote edit-window))
 '(ecb-enlarged-compilation-window-max-height (quote best))
 '(ecb-layout-name "mylayout")
 '(ecb-options-version "2.40")  ;; I think this is automatic?

;; organization

(add-to-list 'auto-mode-alist '("\\.org'" . org-mode))

(setq org-todo-keywords '((sequence "TODO" "NEXT" "|" "DONE" "CANCELED")))

;; The following lines are always needed.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

;; local dropbox
(setq org-agenda-files (quote ("~/OrgFiles")))
(setq org-agenda-diary-file  "~/OrgFiles/diary.org")
;; flash drive

(setq org-log-done t)

;; blog
;; (load "~/Blog/packages/blog")

(put 'upcase-region 'disabled nil)


;; commands

(defun kill-whitespace ()
  "Kill the whitespace between two non-whitespace characters"
  (interactive "*")
  (save-excursion
    (save-restriction
      (save-match-data
	(progn
	  (re-search-backward "[^ \t\r\n]" nil t)
	  (re-search-forward "[ \t\r\n]+" nil t)
	  (replace-match "" nil nil))))))

