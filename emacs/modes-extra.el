;;------------------------
;; Extra Lisp Modes
;;------------------------

;; AUCTeX
(use-package tex :ensure auctex)

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
