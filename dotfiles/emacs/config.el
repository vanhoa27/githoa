(menu-bar-mode -1) ;; disable menu bar
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1) ; disable scrollbar
(set-fringe-mode 10) ; Give some breathing room
(setq inhibit-sartup-message t) ; inhibit startup screen
(setq inhibit-splash-screen t)

(require 'package) ; Initialize package sources
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize) ; init packages
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package) ; init use-package on on-Linux platforms
  (package-install 'use-package))

(require 'use-package) ; package manager
(setq use-package-always-ensure t)

(use-package gruber-darker-theme
  :ensure t
  :config
  (load-theme 'gruber-darker t)) ; Themes
(use-package doom-themes)

(setq-default tab-width 4)
(setq c-default-style "linux"		   
      c-basic-offset 4)
(electric-pair-mode 1)  ; complete brackets (take out <)
(setq electric-pair-inhibit-predicate
      (lambda (c)
        (if (char-equal c ?\<) t (electric-pair-default-inhibit c))))

(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font-12")

(setq display-line-numbers-type 'relative) ; line numbers
(global-display-line-numbers-mode)
(dolist (mode '(term-mode-hook
                vterm-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 0))))

(setq backup-directory-alist '(("." . "~/.emacs_saves/"))) ; save directory

(use-package vertico ; mode-line completion
  :ensure t
  :init
  (vertico-mode))
(use-package savehist ; remeber most recent vertico commands
  :init
  (savehist-mode))
(use-package marginalia ; provide extra information for vertico
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy maraginalia-annotators-light nil))
  :init
  (marginalia-mode))

(use-package yasnippet ; snippets
  :ensure t
  :config
  (yas-global-mode 1))
(use-package company ; auto-completion
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package lsp-mode    ; lsp
  :commands (lsp lsp-deferred)
  ;; :hook
  ;; (c-mode . lsp-deferred)
  ;; (c++-mode . lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration))
;; (use-package tree-sitter  ; tree-sitter
;;   :ensure t
;;   :hook
;;   ((c-mode c++-mode) . tree-sitter-mode))
;; (use-package tree-sitter-langs
;;   :ensure t)

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

;; (use-package dumb-jump ; jump 
;;   :init
;;   (setq xref-show-definitions-function #'xref-show-definitions-completing-read)
;;   :config
;;   (add-hook 'xref'backend-functions #'dumb-jump-xref-activate))
(use-package which-key ; which-key
  :ensure t
  :config
  (which-key-mode +1))
(use-package projectile ; projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode +1))
(use-package magit   ; Version Control
  :ensure t)

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

(use-package vterm) ; shell
(defun my/open-vterm-in-right-window ()
  (interactive)
  (split-window-right)
  (other-window 1)
  (vterm)
  (set-window-dedicated-p (selected-window) t))
(global-set-key (kbd "C-c t") 'my/open-vterm-in-right-window)

(global-set-key "\M-]" 'switch-to-next-buffer)  ; Switch Buffers
(global-set-key "\M-[" 'switch-to-prev-buffer)  
(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ; 3 <esc>
(global-set-key (kbd "C-c p") 'find-file-at-point)

(defun upward-find-file (filename &optional startdir)
  "Move up directories until we find a certain filename. If we
  manage to find it, return the containing directory. Else if we
  get to the toplevel directory and still can't find it, return
  nil. Start at startdir or . if startdir not given"
  (let ((dirname (expand-file-name
                  (if startdir startdir ".")))
        (found nil) ; found is set as a flag to leave loop if we find it
        (top nil))  ; top is set when we get
                                        ; to / so that we only check it once
                                        ; While we've neither been at the top last time nor have we found
                                        ; the file.
    (while (not (or found top))
                                        ; If we're at / set top flag.
      (if (string= (expand-file-name dirname) "/")
          (setq top t))
                                        ; Check for the file
      (if (file-exists-p (expand-file-name filename dirname))
          (setq found t)
                                        ; If not, move up a directory
        (setq dirname (expand-file-name ".." dirname))))
                                        ; return statement
    (if found dirname nil)))
(defun compile-next-makefile (command)
  (interactive "sCompile command: ")
  (let* ((default-directory (or (upward-find-file "Makefile") "."))
         (compile-command (concat "cd " default-directory " && " command)))
    (compile compile-command)))

(global-set-key "\C-c\C-m" 'compile) ; compile
(global-set-key (kbd "C-c m r") 'recompile) ; recompile
(global-set-key (kbd "C-c m c") 'compile-next-makefile) ; makefile
