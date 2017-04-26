emacs
=====

~/.emacs
--------

.. code-block:: lisp

   (setq user-full-name "Us3r")
   (setq user-mail-address "user@domain.tld")

   ;; Main configuration
   (load-file "~/.dots/emacs/main.el")

   ;; Advanced editing and project management
   (load-file "~/.dots/emacs/modes-ide.el")

   ;; Major modes
   (load-file "~/.dots/emacs/modes.el")

   ;; Extra modes
   (load-file "~/.dots/emacs/modes-extra.el")

   (custom-set-variables
    ;; [...] other custom variables
    '(custom-theme-directory "~/.dots/emacs/themes")
    '(custom-enabled-themes (quote (urxvt-solarized-dark))))
