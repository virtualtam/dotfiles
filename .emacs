;;-----------------------------------------------------------
;; file		.emacs
;; author	VirtualTam
;; updated	2013-04-02
;;
;; Description: emacs configuration file
;;
;;-----------------------------------------------------------
(setq user-full-name "VirtualTam")
(setq user-mail-address "<virtualtam@myopera.com>")
(setq mail-self-address "VirtualTam <virtualtam@myopera.com>")

;; Load path
(add-to-list 'load-path "~/.emacs.d/elisp")

;;------------------------
;; Appearance
;;------------------------
(setq inhibit-startup-message t)
(defalias 'yes-or-no-p 'y-or-n-p)

(custom-set-variables
 '(tool-bar-mode nil)
 '(scroll-bar-mode t)
 '(php-mode-force-pear t))

(custom-set-faces
 '(default
    ((t
      (:inherit nil :stipple nil
       :inverse-video nil :box nil :strike-through nil :overline nil
       :underline nil :slant normal :weight normal :height 100 :width normal
       :foundry "unknown" :family "DejaVu Sans Mono")))))

(column-number-mode t)
(display-time)
(setq display-time-24hr-format t)

;; Line numbers
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
(add-to-list 'auto-mode-alist '("PKGBUILD" . shell-script-mode))
(add-to-list 'auto-mode-alist '("sysuplist" . shell-script-mode))
;(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . shell-script-mode))

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

;; PHP
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
;(add-to-list 'auto-mode-alist '("\\.module$" . php-mode))
;(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
;(add-to-list 'auto-mode-alist '("\\.install$" . php-mode))
;(add-to-list 'auto-mode-alist '("\\.engine$" . php-mode))

;; Qt project files
(autoload 'qt-pro "qt-pro" "Qt project files editing mode." t)
(add-to-list 'auto-mode-alist '("\\.pr[io]$" . qt-pro-mode))

;; SLIME
;(setq inferior-lisp-program "/path/to/lisp-executable")
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
;(require 'slime)
;(slime-setup '(slime-fancy))

;; VHDL
;(autoload 'vhdl-mode "vhdl-mode" "VHDL Mode" t)
;(setq auto-mode-alist (cons '("\\.vhdl?\\'" . vhdl-mode) auto-mode-alist))

;;--------------
;; Auto-insert
;;--------------
(require 'auto-insert-tkld)

(setq auto-insert-path (cons "~/.emacs.d/insert" auto-insert-path))
(setq auto-insert-automatically t)
(setq auto-insert-alist
      '(("\\.c$" . "C")			; C
	("\\.cpp$"."CPP")		; C++
	("\\.cc$"."CPP")		; |
	("\\.h$" . "Cinclude")		; C include
	("\\.hh$" . "CPPinclude")	; C++ include
	("\\.hpp$" . "CPPinclude")	; |

	("[Rr]eadme$" . "Readme")	; Readme
	("README$" . "Readme")		; |
	("[Rr]eadme.txt" . "Readme")	; |
	("README.txt" . "Readme")	; |
	("READ.ME" . "Readme")		; |

	("\\.sh$" . "Shell")		; Shell
	("[Mm]akefile$" . "Makefile")	; Makefile

	("\\.php$" . "php")		; php
	("\\.sql$" . "SQL")		; SQL
	("\\.lsp$" . "Lisp")		; Lisp
	))
(setq auto-insert-type-alist
      '(("C" . "insert.c")
	("CPP" . "insert.cpp")
	("Cinclude" . "insert.h")
	("CPPinclude" . "insert.hh")
	("Lisp" . "insert.lsp")
	("Makefile" . "insert.makefile")
	("php" . "insert.php")
	("Readme" . "insert.readme")
	("Shell" . "insert.sh")
	("SQL" . "insert.sql")
	))
