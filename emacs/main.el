;;------------------------
;; Package management
;;------------------------

;; Package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;; Package helper
(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(require 'use-package)

;; Local packages
(add-to-list 'load-path "~/.emacs.d/elisp")

;;------------------------
;; Buffer Appearance
;;------------------------
(setq inhibit-startup-message t)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Hide toolbars
(menu-bar-mode -1)
(custom-set-variables
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(scroll-bar-mode t)
 '(tool-bar-mode nil))

;; Line & column numbers
(column-number-mode t)
(line-number-mode t)
(global-linum-mode t)

;; Parenthesis
(show-paren-mode t)

;; Show truncated lines on as many lines as necessary
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

;; TABS: get rid of'em!
(setq-default indent-tabs-mode nil)

;; Time
(display-time)
(setq display-time-24hr-format t)

;; Highlight keywords
(defvar special-words 'special-words)
(add-hook
 'find-file-hooks
 (lambda ()
   (font-lock-add-keywords
    nil
    '(("\\<\\(FIXME\\|TODO\\|WARNING\\|BUG\\|XXX+\\|NB\\|NOTE\\|ATTENTION\\)[  ]*:"
       1 special-words t)))))

;; Column marker
(use-package column-marker :ensure t)

;; Rainbow: display colors after their code
(use-package rainbow-mode :ensure t)

;;------------------------
;; Theming
;;------------------------
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;;------------------------
;; Encoding Selection
;;------------------------
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment 'utf-8)

;;------------------------
;; Editing
;;------------------------

;; Disable electric-mode for RET
(add-hook 'after-change-major-mode-hook (lambda() (electric-indent-mode -1)))
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

;; Windmove - easy buffer cycling
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)
