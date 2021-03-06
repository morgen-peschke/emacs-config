(require 'ensime)
(require 'popup)

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(add-hook 'ensime-mode-hook (lambda ()
                              (yas-minor-mode 0)
                              (toggle-truncate-lines 1)
                              (linum-mode 1)
                              (scala-mode:goto-start-of-code)
                              ))

(define-key scala-mode-map (kbd "C-c C-e") 'scala-outline-popup)
(setq scala-outline-popup-position 'point)
(add-to-list 'auto-mode-alist '("\\.proto$" . scala-mode))
