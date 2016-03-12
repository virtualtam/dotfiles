emacs
=====

~/.emacs
--------

.. code-block:: lisp

   (setq user-full-name "Us3r")
   (setq user-mail-address "<user@domain.tld>")
   
   ;;(load-file ""~/<dotfiles>/emacs/snapshot-ppa.el"")
   (load-file "~/<dotfiles>/emacs/main.el")

   (custom-set-variables
    ;; [...] other custom variables
    '(custom-theme-directory "~/.dots/emacs/themes")
    '(custom-enabled-themes (quote (urxvt-solarized-dark))))
