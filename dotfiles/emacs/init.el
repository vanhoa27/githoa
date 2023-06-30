;; [[GENERAL SETTINGS]]
(setq inhibit-sartup-message t)
(setq inhibit-splash-screen t)
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font-12")

(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1) ; disable scrollbar
(set-fringe-mode 10) ; Give some breathing room
(load-theme 'gruber-darker t)
(setq display-line-numbers-type 'relative) ; line numbers
(global-display-line-numbers-mode)

(setq backup-directory-alist '(("." . "~/.saves/")))

;; [[Orgbabel]]
(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)
							 (python . t)))

;; [[Minimal C-Setup]]
(setq-default tab-width 4)
(setq c-default-style "linux"		   
      c-basic-offset 4)
(electric-pair-mode 1)
(setq electric-pair-inhibit-predicate
      (lambda (c)
        (if (char-equal c ?\<) t (electric-pair-default-inhibit c))))

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
						 ("org" . "https://orgmode.org/elpa/")
						 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; init use-package on on-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package gruber-darker-theme)
(use-package vertico
  :ensure t
  :config
  (vertico-mode 1))
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))
(use-package vterm)
 (dolist (mode '(org-mode-hook
                    term-mode-hook
                    vterm-mode-hook
                    shell-mode-hook
                    treemacs-mode-hook
                    eshell-mode-hook))
      (add-hook mode (lambda() (display-line-numbers-mode 0))))


;; Org mode setup
(defun efs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1)
  (setq org-hide-emphasis-markers t))

(use-package org
  :hook (org-mode . efs/org-mode-setup)
  (org-mode . efs/display-checkbox-setup))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; Keymaps
(global-set-key "\C-c\c" 'compile)  ; Compile
(global-set-key "\M-]" 'switch-to-next-buffer)  ; Switch Buffers
(global-set-key "\M-[" 'switch-to-prev-buffer)  
(global-set-key "\M-n" 'forward-paragraph)  ; Switch Buffers
(global-set-key "\M-p" 'backward-paragraph)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(ansi-term-color-vector
   [unspecified "#2d2a2e" "#ff6188" "#a9dc76" "#ffd866" "#78dce8" "#ab9df2" "#a1efe4" "#fcfcfa"] t)
 '(custom-safe-themes
   '("ba4ab079778624e2eadbdc5d9345e6ada531dc3febeb24d257e6d31d5ed02577" "b02eae4d22362a941751f690032ea30c7c78d8ca8a1212fdae9eecad28a3587f" "c8b83e7692e77f3e2e46c08177b673da6e41b307805cd1982da9e2ea2e90e6d7" "24168c7e083ca0bbc87c68d3139ef39f072488703dcdd82343b8cab71c0f62a7" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" default))
 '(exwm-floating-border-color "#504945")
 '(fci-rule-color "#7c6f64")
 '(highlight-tail-colors ((("#363627" "#363627") . 0) (("#323730" "#323730") . 20)))
 '(ispell-dictionary nil)
 '(jdee-db-active-breakpoint-face-colors (cons "#0d1011" "#fabd2f"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d1011" "#b8bb26"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d1011" "#928374"))
 '(objed-cursor-color "#fb4934")
 '(package-selected-packages
   '(gruber-darker-theme monokai-pro-theme doom-themes spaceway-theme vterm org-bullets org-babel-eval-in-repl yasnippet-snippets vertico-prescient use-package projectile popup lsp-mode company command-log-mode))
 '(pdf-view-midnight-colors (cons "#ebdbb2" "#282828"))
 '(rustic-ansi-faces
   ["#282828" "#fb4934" "#b8bb26" "#fabd2f" "#83a598" "#cc241d" "#8ec07c" "#ebdbb2"])
 '(vc-annotate-background "#282828")
 '(vc-annotate-color-map
   (list
	(cons 20 "#b8bb26")
	(cons 40 "#cebb29")
	(cons 60 "#e3bc2c")
	(cons 80 "#fabd2f")
	(cons 100 "#fba827")
	(cons 120 "#fc9420")
	(cons 140 "#fe8019")
	(cons 160 "#ed611a")
	(cons 180 "#dc421b")
	(cons 200 "#cc241d")
	(cons 220 "#db3024")
	(cons 240 "#eb3c2c")
	(cons 260 "#fb4934")
	(cons 280 "#e05744")
	(cons 300 "#c66554")
	(cons 320 "#ac7464")
	(cons 340 "#7c6f64")
	(cons 360 "#7c6f64")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
