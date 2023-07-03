;; [[GENERAL SETTINGS]]
(setq inhibit-sartup-message t)
(setq inhibit-splash-screen t)
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font-12")

(menu-bar-mode -1) ;; disable menu bar
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1) ; disable scrollbar
(set-fringe-mode 10) ; Give some breathing room
(load-theme 'gruber-darker t)
;;(load-theme 'doom-gruvbox t)
(setq display-line-numbers-type 'relative) ; line numbers
(global-display-line-numbers-mode)
(dolist (mode '(term-mode-hook
                vterm-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
   (add-hook mode (lambda() (display-line-numbers-mode 0))))

x(setq backup-directory-alist '(("." . "~/.emacs_saves/"))) ; save directory
(global-set-key (kbd "TAB") 'self-insert-command) ; insert literal string

;; [[Orgbabel]]
(org-babel-do-load-languages
    'org-babel-load-languages
	'((python . t)
      (java . t)
	  (sql . t)
      (C . t)))
(setq org-babel-python-command "python3")

;; [[Minimal C-Setup]]
(setq-default tab-width 4)
(setq c-default-style "linux"		   
      c-basic-offset 4)
(electric-pair-mode 1)  ; complete brackets (take out <)
(setq electric-pair-inhibit-predicate
      (lambda (c)
        (if (char-equal c ?\<) t (electric-pair-default-inhibit c))))


(require 'package) ; Initialize package sources
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
						 ("org" . "https://orgmode.org/elpa/")
						 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize) ; init packages
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package) ; init use-package on on-Linux platforms
  (package-install 'use-package))

;;;;;;; Packages
(require 'use-package) ; package manager
(setq use-package-always-ensure t)

(use-package gruber-darker-theme) ; Theme
(use-package doom-themes)
(use-package vertico ; mode-line compleiton
  :ensure t
  :config
  (vertico-mode 1))
(use-package yasnippet ; snippets
  :ensure t
  :config
  (yas-global-mode 1))
(use-package company ; auto-completion
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))
(use-package vterm) ; shell
(use-package auctex ; latex
  :ensure t
  :defer t) 
(require 'tex) 
(push (list 'output-pdf "Zathura") TeX-view-program-selection) ; Zathura
(use-package move-text
  :ensure t
  :config
  (global-set-key (kbd "M-p") 'move-text-up)
  (global-set-key (kbd "M-n") 'move-text-down))
;; (use-package dumb-jump
;;   :init
;;   (setq xref-show-definitions-function #'xref-show-definition)
;;   :config
;;   (add-hook 'xref'backend-functions #'dumb-jump-xref-activate))


;; [[Python setup]]
;; (use-package lsp-pyright    ; lsp-pyhon
;;   :ensure t
;;   :hook (python-mode . (lambda ()
;; 						 (require 'lsp-pyright
;; 								  (lsp-deferred))))) ; or lsp-deferred
;;;;;;;;;;

;;;;Org mode setup
(defun efs/org-mode-setup () ; startup with indent
  (org-indent-mode) 
  (setq org-hide-emphasis-markers t)
  (setq org-src-tab-acts-natively t))

(use-package org 
  :hook (org-mode . efs/org-mode-setup))
   
(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))  
;;;;;

(defun my/open-vterm-in-right-window ()
  (interactive)
  (split-window-right)
  (other-window 1)
  (vterm)
  (set-window-dedicated-p (selected-window) t))

;;;;; [[Keymaps]]
(global-set-key "\C-c\C-m" 'compile) ; compile
(global-set-key "\M-]" 'switch-to-next-buffer)  ; Switch Buffers
(global-set-key "\M-[" 'switch-to-prev-buffer)  
;; (global-set-key "\M-n" 'forward-paragraph)  ; jump paragraphs
;; (global-set-key "\M-p" 'backward-paragraph)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ; 3 <esc>
(global-set-key (kbd "C-c t") 'my/open-vterm-in-right-window)
;;;;;;


