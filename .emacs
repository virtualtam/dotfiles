;;-----------------------------------------------------------
;; Emacs configuration file
;;
;; author       VirtualTam
;; revision     2015-03-12
;;-----------------------------------------------------------
(setq user-full-name "VirtualTam")
(setq user-mail-address "<virtualtam@flibidi.org>")
(setq mail-self-address "VirtualTam <virtualtam@flibidi.org>")

;; emacs-snapshot PPA hack
;(when (>= emacs-major-version 25)
;  (defconst debian-emacs-flavor 'emacs25))

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
  :ensure t
  :init
  (load-theme 'solarized-dark))

;;------------------------
;; Encoding Selection
;;------------------------
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment 'utf-8)

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

;; Graphviz
(use-package graphviz-dot-mode :ensure t)

;; Java decompiled classes
;(add-to-list 'auto-mode-alist '("\\.jad\\'" . java-mode))

;; LUA
;(use-package lua-mode :ensure t)

;; Magit
(use-package magit
  :ensure t
  :init
  (global-set-key (kbd "C-x g") 'magit-status)
  :config
  (progn
    (set-face-foreground 'magit-diff-add "green3")
    (set-face-foreground 'magit-diff-del "red3")
    (set-face-background 'magit-branch nil)
    (set-face-background 'magit-tag nil)
    (set-face-background 'magit-item-highlight "black")
    (set-face-foreground 'magit-item-highlight "white")
    (set-face-background 'magit-log-head-label-head nil)
    (set-face-foreground 'magit-log-head-label-head "yellow")
    (set-face-background 'magit-log-head-label-local nil)
    (set-face-background 'magit-log-head-label-remote nil)
    (set-face-background 'magit-log-head-label-tags nil)
    (set-face-background 'magit-log-reflog-label-amend nil)
    (set-face-background 'magit-log-reflog-label-checkout nil)
    (set-face-background 'magit-log-reflog-label-cherry-pick nil)
    (set-face-background 'magit-log-reflog-label-commit nil)
    (set-face-background 'magit-log-reflog-label-merge nil)
    (set-face-background 'magit-log-reflog-label-other nil)
    (set-face-background 'magit-log-reflog-label-rebase nil)
    (set-face-background 'magit-log-reflog-label-remote nil)
    (set-face-background 'magit-log-reflog-label-reset nil)))

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

;; disable electric-indent
(add-hook 'python-mode-hook
          (lambda ()
	    (set (make-local-variable 'electric-indent-functions)
		 (list (lambda (arg) 'no-indent)))))

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
    (add-hook 'web-mode-hook
	      (lambda ()
                (set (make-local-variable 'electric-indent-functions)
                     (list (lambda (arg) 'no-indent)))
                (setq web-mode-code-indent-offset 4)))))


;; Web: SaltStack states
;; TODO: define a custom mode for SaltStack states
(setq web-mode-engines-alist '(("django" . "\\.sls\\'")))

;; YAML
(use-package yaml-mode :ensure t)
