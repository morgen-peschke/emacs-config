(mapc (lambda (mode-hook) (add-hook mode-hook 'rainbow-mode))
      '(css-mode-hook
        html-mode-hook
        ))
