;; [[GENERAL SETTINGS]]
(setq inhibit-sartup-message t)
(setq inhibit-splash-screen t)
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font-12")
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10) ; Give some breathing room
(load-theme 'manoj-dark t)
(setq display-line-numbers-type 'relative) ; line numbers
(global-display-line-numbers-mode)

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

;; Org mode setup
(defun efs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(use-package org
  :hook (org-mode . efs/org-mode-setup))
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
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(org-bullets org-babel-eval-in-repl yasnippet-snippets vertico-prescient use-package projectile popup lsp-mode company command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
