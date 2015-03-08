;;-----------------------------------------------------------
;; Emacs configuration file
;;
;; author       VirtualTam
;; revision     2015-03-08
;;-----------------------------------------------------------
(setq user-full-name "VirtualTam")
(setq user-mail-address "<virtualtam@flibidi.org>")
(setq mail-self-address "VirtualTam <virtualtam@flibidi.org>")

;; Load path
(add-to-list 'load-path "~/.emacs.d/elisp")

;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;;------------------------
;; Appearance
;;------------------------
(setq inhibit-startup-message t)
(defalias 'yes-or-no-p 'y-or-n-p)

(custom-set-variables
 '(tool-bar-mode nil)
 '(scroll-bar-mode t))

(custom-set-faces
 '(default
    ((t
      (:inherit nil :stipple nil
       :inverse-video nil :box nil :strike-through nil :overline nil
       :underline nil :slant normal :weight normal :height 100 :width normal
       :foundry "unknown" :family "DejaVu Sans Mono")))))

;; Time
(display-time)
(setq display-time-24hr-format t)

;; Line & column numbers
(column-number-mode t)
(line-number-mode t)
(require 'linum)
(global-linum-mode t)

;; Show truncated lines on as many lines as necessary
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

;; Parenthesis
(require 'paren)
(show-paren-mode t)
(setq-default hilight-parent-expression t)
(setq show-paren-style 'parenthesis)

;; Graphics
(if (eq window-system 'x)
  (progn
    ;; Cursor
    (set-cursor-color "black")))

;; Highlight keywords
(defvar special-words 'special-words)
(add-hook 'find-file-hooks
  (lambda ()
    (font-lock-add-keywords nil
      '(("\\<\\(FIXME\\|TODO\\|WARNING\\|BUG\\|XXX+\\|NB\\|NOTE\\|ATTENTION\\)[  ]*:"
         1 special-words t)))))

(put 'upcase-region 'disabled nil)

;;------------------------
;; Encoding Selection
;;------------------------
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment 'utf-8)

;;------------------------
;; Lisp Modes
;;------------------------

;; Default mode
(setq initial-major-mode 'text-mode)
(setq default-major-mode 'text-mode)

;; Shell mode
(add-to-list 'auto-mode-alist '("\\.conf$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.po$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.rules$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("sysuplist" . shell-script-mode))

;; AUCTeX
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;; C#
;(require 'csharp-mode)
;(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))

;; CMake
(autoload 'cmake-mode "cmake-mode" "CMake editing mode." t)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))

;; Cobol
(autoload 'cobol-mode "cobol-mode" "Cobol editing mode." t)
(add-to-list 'auto-mode-alist '("\\.cbl$" . cobol-mode))
(add-to-list 'auto-mode-alist '("\\.cob$" . cobol-mode))

;; Java decompiled classes
(add-to-list 'auto-mode-alist '("\\.jad\\'" . java-mode))

;; LUA
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; Markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; org-mode
(autoload 'org-install "org-mode" "org-mode" t)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.tdl$" . org-mode))
(add-to-list 'auto-mode-alist '("TODOLIST" . org-mode))

;; PKGBUILD (ArchLinux)
(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(add-to-list 'auto-mode-alist '("\\PKGBUILD$" . pkgbuild-mode))

;; Python
; disable electric-indent
(add-hook 'python-mode-hook
	  (lambda ()
	    (set (make-local-variable 'electric-indent-functions)
		 (list (lambda (arg) 'no-indent)))))

;; Qt project files
(autoload 'qt-pro "qt-pro" "Qt project files editing mode." t)
(add-to-list 'auto-mode-alist '("\\.pr[io]$" . qt-pro-mode))

;; SLIME
(setq inferior-lisp-program "/usr/bin/clisp")
(require 'slime)
(setq slime-contribs '(slime-fancy))

;; VHDL
;(autoload 'vhdl-mode "vhdl-mode" "VHDL Mode" t)
;(setq auto-mode-alist (cons '("\\.vhdl?\\'" . vhdl-mode) auto-mode-alist))

;; Web: html, php, django/jinja
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.sls\\'" . web-mode))

; Web: SaltStack states
(setq web-mode-engines-alist
      '(("django" . "\\.sls\\'")))

;; YAML
(autoload 'yaml-mode "yaml-mode" "YAML mode." t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
