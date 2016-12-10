;;------------;;
;; Lisp Modes ;;
;;------------;;

;; Default: text-mode
(setq initial-major-mode 'text-mode)
(setq default-major-mode 'text-mode)

;; CC mode: C, C++, Java & affiliated
(setq c-default-style "k&r"
      c-basic-offset 4)

;; Config files: shell-mode
(add-to-list 'auto-mode-alist '("\\.bash" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.conf$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.po$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.rules$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("sysuplist" . shell-script-mode))

;; CMake
(use-package cmake-mode :ensure t)

;; Docker
(use-package docker :ensure t)
(use-package dockerfile-mode :ensure t)

;; Groovy
;(use-package groovy-mode :ensure t)

;; Java decompiled classes
;(add-to-list 'auto-mode-alist '("\\.jad\\'" . java-mode))

;; LUA
(use-package lua-mode :ensure t)

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
