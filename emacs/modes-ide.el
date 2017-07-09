;;----------------------------;;
;; Advanced environment modes ;;
;;----------------------------;;
(setq grep-find-ignored-directories '("build" "doxygen" "vendor"))

(use-package ag :ensure t)

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package helm-ag :ensure t)

(require 'helm-config)
(use-package helm-mode
  :config
  (progn 
    (helm-mode t)
    (global-set-key (kbd "C-c h") 'helm-command-prefix)
    (global-unset-key (kbd "C-x c"))
    (global-set-key (kbd "C-x C-f") 'helm-find-files)
    (global-set-key (kbd "C-x b") 'helm-mini)))

(use-package helm-gtags
  :ensure t
  :init
  (progn
    (add-hook 'prog-mode-hook 'helm-gtags-mode)
    (setq helm-gtags-ignore-case t
          helm-gtags-auto-update t
          helm-gtags-use-input-at-cursor t
          helm-gtags-pulse-at-cursor t))
  :config
  (progn
    (define-key helm-gtags-mode-map (kbd "C-c gc") 'helm-gtags-create-tags)
    (define-key helm-gtags-mode-map (kbd "C-c gu") 'helm-gtags-update-tags)
    (define-key helm-gtags-mode-map (kbd "C-c gs") 'helm-gtags-find-symbol)
    (define-key helm-gtags-mode-map (kbd "C-c gf") 'helm-gtags-parse-file)
    (define-key helm-gtags-mode-map (kbd "C-c gg") 'helm-gtags-find-pattern)
    (define-key helm-gtags-mode-map (kbd "C-c gs") 'helm-gtags-find-symbol)
    (define-key helm-gtags-mode-map (kbd "C-c gr") 'helm-gtags-find-rtag)
    (define-key helm-gtags-mode-map (kbd "C-c gt") 'helm-gtags-find-tag)))

(use-package helm-projectile
  :ensure t
  :config
  (progn
    (projectile-global-mode)
    (helm-projectile-on)
    (setq projectile-enable-caching t)))
