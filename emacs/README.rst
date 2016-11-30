emacs
=====

~/.emacs
--------

.. code-block:: lisp

   (setq user-full-name "Us3r")
   (setq user-mail-address "user@domain.tld")
   
   (load-file "~/<dotfiles>/emacs/main.el")
   (load-file "~/<dotfiles>/emacs/extra.el")

   (custom-set-variables
    ;; [...] other custom variables
    '(custom-theme-directory "~/<dotfiles>/emacs/themes")
    '(custom-enabled-themes (quote (urxvt-solarized-dark))))
