

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
;;(load-theme 'doom-ayu-dark t)
(setq display-line-numbers-type 'relative) ; line numbers
(global-display-line-numbers-mode)
(dolist (mode '(term-mode-hook
                vterm-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
   (add-hook mode (lambda() (display-line-numbers-mode 0))))

(setq backup-directory-alist '(("." . "~/.emacs_saves/"))) ; save directory
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
(use-package vertico ; mode-line completion
  :ensure t
  :init
  (vertico-mode))
(use-package marginalia ; provide extra information for vertico
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy maraginalia-annotators-light nil))
  :init
  (marginalia-mode))
;; (use-package swiper
;;   :config
;;   (global-set-key (kbd "C-s" 'swiper)))
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
(use-package dumb-jump ; jump 
  :init
  (setq xref-show-definitions-function #'xref-show-definition)
  :config
  (add-hook 'xref'backend-functions #'dumb-jump-xref-activate))
(use-package which-key ; which-key
  :ensure t
  :config
  (which-key-mode +1))
(use-package projectile ; projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode +1))

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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#FCFBF9" "#8F5652" "#747B4D" "#886A44" "#556995" "#83577D" "#477A7B" "#605A52"])
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("be84a2e5c70f991051d4aaf0f049fa11c172e5d784727e0b525565bb1533ec78" "b99e334a4019a2caa71e1d6445fc346c6f074a05fcbb989800ecbe54474ae1b0" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "37c8c2817010e59734fe1f9302a7e6a2b5e8cc648cf6a6cc8b85f3bf17fececf" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "49acd691c89118c0768c4fb9a333af33e3d2dca48e6f79787478757071d64e68" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" "0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478" "ba4ab079778624e2eadbdc5d9345e6ada531dc3febeb24d257e6d31d5ed02577" default))
 '(exwm-floating-border-color "#CDCBC7")
 '(fci-rule-color "#9E9A95")
 '(frame-brackground-mode 'dark)
 '(highlight-tail-colors
   ((("#eeeee7" "#eff3ef" "green")
	 . 0)
	(("#e9eeec" "#f3f7f7" "brightgreen")
	 . 20)))
 '(ispell-dictionary nil)
 '(ivy-mode nil)
 '(jdee-db-active-breakpoint-face-colors (cons "#fcfbf9" "#7686A9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#fcfbf9" "#747B4D"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#fcfbf9" "#9E9A95"))
 '(objed-cursor-color "#8F5652")
 '(package-selected-packages
   '(marginalia vertico swiper which-key projectile evil-mode evil move-text dumb-jump treemacs-evil treemacs eww-lnum doom-themes tree-sitter-langs tree-sitter lsp-pyright yasnippet-snippets vterm use-package org-bullets gruber-darker-theme company auctex))
 '(pdf-view-midnight-colors (cons "#605A52" "#FCFBF9"))
 '(rustic-ansi-faces
   ["#FCFBF9" "#8F5652" "#747B4D" "#886A44" "#556995" "#83577D" "#477A7B" "#605A52"])
 '(vc-annotate-background "#FCFBF9")
 '(vc-annotate-color-map
   (list
	(cons 20 "#747B4D")
	(cons 40 "#7a7549")
	(cons 60 "#816f47")
	(cons 80 "#886A44")
	(cons 100 "#886a44")
	(cons 120 "#886a44")
	(cons 140 "#886A44")
	(cons 160 "#866357")
	(cons 180 "#845d69")
	(cons 200 "#83577D")
	(cons 220 "#87566e")
	(cons 240 "#8b5660")
	(cons 260 "#8F5652")
	(cons 280 "#926762")
	(cons 300 "#967873")
	(cons 320 "#9a8984")
	(cons 340 "#9E9A95")
	(cons 360 "#9E9A95")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
