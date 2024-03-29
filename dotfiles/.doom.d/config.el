
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Van Hoa Nguyen"
      user-mail-address "hoa.nguyen@mail.de")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'number)

;; If you use `org' and don't want your org files in the default location below,
;e-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.



;; [[GENERAL]]
;; resize font size
(setq doom-font (font-spec :family "Hack Nerd Font Mono" :size 19))
        ;; (set-face-attribute 'default nil :height 140)

(add-hook 'window-setup-hook 'toggle-frame-maximized t)  ;; maximize screen on start up
(setq scroll-margin 2)                                   ;; set scroll margin


;; [[org-mode]]
(setq org-hide-emphasis-markers t)  ;; ormode hide bold/italic markers etc
(setq org-startup-folded t)         ;; start all org Headings folded
;; (setq org-pretty-entities t)     ;; display math and greek letters
(setq org-cycle-hide-block-startup t)     ;; codeblock startup
(setq org-src-fontify-natively t)   ;; org mode fontify

;; hide source code
;; (let ((background-color (face-attribute 'default :background)))
;;   (set-face-attribute 'org-block-begin-line nil
;;                       :foreground background-color
;;                       :background background-color)
;;   (set-face-attribute 'org-block-end-line nil
;;                       :foreground background-color
;;                       :background background-color))

;; timer
(setq org-clock-sound "~/music/wave_sound_files/alarm-clock-01.wav")
(add-hook 'org-clock-out-hook (lambda () (play-sound-file org-clock-sound)))

;; use custom bullet headings
(use-package! org-bullets
  :after org
  :config
  (setq org-bullets-bullet-list '("◉" "○" "✸" "◆" "✿"))
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; ;; latex preview
;; (setq org-preview-latex-default-process 'dvipng)

;; ORG BABEL add c, mermaid language
(org-babel-do-load-languages
    'org-babel-load-languages
    '((mermaid . t)
      (scheme . t)
      (python . t)
      (java . t)
      (bash . t)
      (C . t)))

;; Specify ob mermaid path
(setq ob-mermaid-cli-path "/home/vanhoa/node_modules/.bin/mmdc")

;; [[ORG ROAM]]
(setq org-roam-directory "~/roam")
(setq org-roam-graph-executable "/usr/bin/dot")
(setq org-roam-graph-viewer nil)

;; [[TREE-SITTER]]
(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; [[PRETTIFY]]
(defun display-code-block-vertically ()
  "Display code blocks vertically using down and up arrows."
  (setq-local prettify-symbols-alist
              '(;; ("#+begin_src" . "▼")
                ;; ("#+end_src" . "▲")
                ;; ("#+BEGIN_SRC" . "▼")
                ;; ("#+END_SRC" . "▲")
                ("[ ]" . "☐")
                ("[X]" . "☑")
                ))
  (prettify-symbols-mode))

(add-hook 'org-mode-hook 'display-code-block-vertically)

;; (setq org-ellipsis " ➤")         ;; set toggle symbol
;; [[KEY-BINDINGS]]
;; [ANKI]]
(map! :leader
      (:prefix ("l" . "flashcards")
       :desc "anki-editor-insert-note"
       "a i" #'anki-editor-insert-note
       :desc "anki-editor-mode"
       "a m" #'anki-editor-mode
       :desc "anki-editor-push-notes"
       "a p" #'anki-editor-push-notes
       :desc "anki-editor-closz-dwim"
       "a c" #'anki-editor-cloze-dwim
       :desc "org-anki-sync-all"
       "o s" #'org-anki-sync-all
       :desc "org-anki-sync-all"
       "o i" #'org-anki-import-deck)
      (:prefix ("v" . "insert-images")
       :desc "insert image"
       "p " #'org-download-clipboard))

;; [[DIRED]]
(after! dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; [[ORG-DOWNLOAD]]
(require 'org-download)

;; Drag-and-drop to `dired'
(add-hook 'dired-mode-hook 'org-download-enable)
(setq-default
 org-download-method 'directory
 org-download-image-dir "attachements"
 org-download-heading-lvl nil)

;; [[ORG-EXPORT]]
;; Foramt Source Code properly in PDF
(add-to-list 'org-latex-packages-alist '("" "listings" nil))
(setq org-latex-src-b t)

(setq org-latex-listings-options '(("breaklines" "true")))

;; [[DEFT]]
(setq deft-directory "~/org/"
      deft-extensions '("org", "txt")
      deft-recursive t)
