;;----------------------------;;
;; Advanced environment modes ;;
;;----------------------------;;
(setq grep-find-ignored-directories '("build" "doxygen" "vendor"))

(use-package ag :ensure t)
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

(use-package helm-projectile
  :ensure t
  :config
  (progn
    (projectile-global-mode)
    (helm-projectile-on)
    (setq projectile-enable-caching t)))
