(setq inhibit-startup-message t)

(scroll-bar-mode -1)     ; Disable visibale scrollbar
(tool-bar-mode -1)       ; Disable the toolbar
(tooltip-mode -1)        ; Disable tooltips
(set-fringe-mode 10)     ; Give some breathing room

(set-frame-position (selected-frame) 1 1) ; set the init position
(set-frame-height (selected-frame) 30) ; set the init height
(set-frame-width (selected-frame) 100) ; set the init width

;; Set up the visible bell
(menu-bar-mode -1)

(setq visible-bell t)

(set-face-attribute 'default nil :font "FiraCode NF" :height 130)

(load-theme 'tango-dark)

;; Make ESC quit prompts
;; (global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; (clomun-number-mode)
;; (global-display-line-numbers-mode t)

(dolist (mode '(shell-mode-hook
		term-mode-hook
		org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; ;; Initialize use-package on non-Linux platforms
;; (unless (package-installed-p 'use-package)
;;  (package-install 'use-package))

;; (require 'use-package)
;; (setq use-package-always-ensure t)

;; (use-package command-log-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number-mode nil)
 '(package-selected-packages '(gom-mode go org-tree-slide auto-complete evil company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:inherit default :weight bold :foreground "#eeeeec" :font "Verdana" :height 1.5 :underline nil))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#eeeeec" :font "Verdana" :height 1.75))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#eeeeec" :font "Verdana" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#eeeeec" :font "Verdana" :height 1.25))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#eeeeec" :font "Verdana" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "#eeeeec" :font "Verdana"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "#eeeeec" :font "Verdana"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "#eeeeec" :font "Verdana"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#eeeeec" :font "Verdana")))))

;; evil
;; (add-to-list 'load-path "~/.emacs.d/evil")
;; (require 'evil)
;; (evil-mode 1)

;; org mode
(setq org-hide-emphasis-markers t)
(font-lock-add-keywords 'org-mode
                            '(("^ +\\([-*]\\) "
                               (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
;; org as word processer
(font-lock-add-keywords 'org-mode
    '(("^ +\\([-*]\\) "
	(0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(let* ((variable-tuple (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                                 ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                                 ((x-list-fonts "Verdana")         '(:font "Verdana"))
                                 ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                                 (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
           (base-font-color     (face-foreground 'default nil 'default))
           (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

      (custom-theme-set-faces 'user
                              `(org-level-8 ((t (,@headline ,@variable-tuple))))
                              `(org-level-7 ((t (,@headline ,@variable-tuple))))
                              `(org-level-6 ((t (,@headline ,@variable-tuple))))
                              `(org-level-5 ((t (,@headline ,@variable-tuple))))
                              `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
                              `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.1))))
                              `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.25))))
                              `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.5))))
                              `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))))

;; (add-to-list 'load-path "~/.emacs.d/auto-complete")
;; (require 'auto-complete)
;; (auto-complete-mode 1)

;; all backups goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.emacs-backups"))))
(put 'upcase-region 'disabled nil)

(setq org-image-actual-width nil)
(setq org-log-done 'time)
