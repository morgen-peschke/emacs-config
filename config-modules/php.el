;; Prevent PHP mode from warning about indentation issues
(add-hook 'php-mode-hook (lambda ()
                           (setq php-warned-bad-indent t)
                           (defun php-check-html-for-indentation ()
                             t)
                           ))
