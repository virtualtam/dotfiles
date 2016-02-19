;;-----------------------------------------------------------
;; Emacs configuration file
;;
;; author       VirtualTam
;; revision     2015-12-09
;;-----------------------------------------------------------
(setq user-full-name "VirtualTam")
(setq user-mail-address "<virtualtam@flibidi.net>")
(setq mail-self-address "VirtualTam <virtualtam@flibidi.net>")

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

(use-package solarized-theme
  :init
  (load-theme 'solarized-dark)
  :ensure t)

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


;;------------------------
;; Lisp Modes
;;------------------------

;; Default: text-mode
(setq initial-major-mode 'text-mode)
(setq default-major-mode 'text-mode)

;; Config files: shell-mode
(add-to-list 'auto-mode-alist '("\\.bash" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.conf$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.po$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.rules$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("sysuplist" . shell-script-mode))

;; AUCTeX
(use-package tex :ensure auctex)

;; C#
;(use-package csharp-mode :ensure t)

;; CMake
(use-package cmake-mode :ensure t)

;; Cobol
;(autoload 'cobol-mode "cobol-mode" "Cobol editing mode." t)
;(add-to-list 'auto-mode-alist '("\\.cbl$" . cobol-mode))
;(add-to-list 'auto-mode-alist '("\\.cob$" . cobol-mode))

;; Docker
(use-package docker :ensure t)
(use-package dockerfile-mode :ensure t)

;; Graphviz
(use-package graphviz-dot-mode :ensure t)

;; Java decompiled classes
;(add-to-list 'auto-mode-alist '("\\.jad\\'" . java-mode))

;; LUA
;(use-package lua-mode :ensure t)

;; Markdown
(use-package markdown-mode :ensure t)

;; Org-mode
(use-package org
  :ensure t
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.tdl$" . org-mode))
    (add-to-list 'auto-mode-alist '("TODOLIST" . org-mode))))

;; PKGBUILD (ArchLinux)
(use-package pkgbuild-mode :ensure t)

;; Python
(use-package jedi
  ;; TODO: handle virtualenvs
  :commands jedi:setup
  :init
  (progn
    (add-hook 'python-mode-hook 'jedi:setup)
    ;; C-tab is not usable in a terminal
    (global-set-key (kbd "M-§") 'jedi:complete))
  :config
  (progn
    ;(setq jedi:complete-on-dot t)
    (setq jedi:setup-keys t))
  :ensure t)

;; R
;(use-package ess)

;; SLIME
(use-package slime
  :init
  (progn
    (setq inferior-lisp-program "/usr/bin/clisp")
    (setq slime-contribs '(slime-fancy)))
  :ensure t)

;; VHDL
;;(autoload 'vhdl-mode "vhdl-mode" "VHDL Mode" t)
;;(setq auto-mode-alist (cons '("\\.vhdl?\\'" . vhdl-mode) auto-mode-alist))


;; Web: less, sass CSS templates
(use-package less-css-mode :ensure t)
(use-package sass-mode :ensure t)

;; Web: html, php, django/jinja
(use-package web-mode
  :ensure t
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.sls\\'" . web-mode))
    (setq web-mode-markup-indent-offset 2)))

;; Web: SaltStack states
(setq web-mode-engines-alist '(("django" . "\\.sls\\'")))

;; YAML
(use-package yaml-mode :ensure t)
