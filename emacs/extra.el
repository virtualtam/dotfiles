;;------------------------
;; Extra Lisp Modes
;;------------------------

;; AUCTeX
(use-package tex :ensure auctex)

;; C#
;(use-package csharp-mode :ensure t)

;; Cobol
;(autoload 'cobol-mode "cobol-mode" "Cobol editing mode." t)
;(add-to-list 'auto-mode-alist '("\\.cbl$" . cobol-mode))
;(add-to-list 'auto-mode-alist '("\\.cob$" . cobol-mode))

;; Graphviz
(use-package graphviz-dot-mode :ensure t)

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
;(autoload 'vhdl-mode "vhdl-mode" "VHDL Mode" t)
;(setq auto-mode-alist (cons '("\\.vhdl?\\'" . vhdl-mode) auto-mode-alist))
