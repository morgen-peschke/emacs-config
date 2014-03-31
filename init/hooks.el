;; Replace scratch buffer with "Untitled" buffer
(add-hook 'emacs-startup-hook      'mpeschke/close-scratch)

;; Add ANSI color in compilation buffer
(add-hook 'compilation-filter-hook 'mpeschke/colorize-compilation-buffer)

;; Add niceities to text modes and common programming modes
(add-hook 'text-mode-hook
          '(lambda ()
             (auto-fill-mode 1)
             (set-fill-column 80)
             (flyspell-mode t)))

(defun prog-mode-hooks ()
  (set-fill-column 80)
  (flyspell-prog-mode)
  (if (fboundp 'c-subword-mode)
      (c-subword-mode)
    (subword-mode))
  )

(mapc (lambda (mode-hook) (add-hook mode-hook 'prog-mode-hooks))
      '(
        emacs-lisp-mode-hook
        html-mode-hook
        java-mode-hook
        lisp-mode-hook
        js-mode-hook
        php-mode-hook
        python-mode-hook
        sh-mode-hook
        sql-mode-hook
        c-mode-hook
        c++-mode-hook
        enh-ruby-mode-hook
))

;; Add auto-fill-mode to some modes
(mapc (lambda (mode-hook) (add-hook mode-hook '(lambda () (auto-fill-mode 1))))
      '(
        c++-mode-hook
        c-mode-hook
        java-mode-hook
        php-mode-hook
        js-mode-hook
        python-mode-hook
        sh-mode-hook
        enh-ruby-mode-hook
        ))

;; Prevent auto-fill-mode in others
(mapc (lambda (mode-hook) (add-hook mode-hook '(lambda () (auto-fill-mode 0))))
      '(
        emacs-lisp-mode-hook
        html-mode-hook
        lisp-mode-hook
        sql-mode-hook
        ))

;; Set toggle truncate lines in some modes
(mapc (lambda (mode-hook) (add-hook mode-hook '(lambda () (toggle-truncate-lines 1))))
      '(
        emacs-lisp-mode-hook
        html-mode-hook
        enh-ruby-mode-hook
        sql-mode-hook
        js-mode-hook
        ))

;; Delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
