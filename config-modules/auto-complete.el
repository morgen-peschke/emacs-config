(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/.cask/24.3.1/elpa/auto-complete-20140322.321/dict")
(ac-config-default)

(setq ac-ignore-case nil)

(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)
(mapc (lambda (mode)
        (add-to-list 'ac-modes mode))
      '(
        enh-ruby-mode
        js-mode
        emacs-lisp-mode
        java-mode
        js-mode
        php-mode
        python-mode
        sh-mode
        sql-mode
        c-mode
        c++-mode
        html-mode
        conf-space-mode
        ))
