;;|=======================================
;;| Comment block hooks
;;|

(defun mpeschke/comment-blocks/c-style-bindings ()
  (local-set-key (kbd "C-c b") 'mpeschke/comment-block-c)
  (local-set-key (kbd "C-c s") 'mpeschke/comment-block-c-small)
  (local-set-key (kbd "C-c B") 'mpeschke/comment-block-c-section)
  (local-set-key (kbd "C-c c") 'mpeschke/comment-block-c-critical)
  )

(defun mpeschke/comment-blocks/shell-style-bindings ()
  (local-set-key (kbd "C-c b") 'mpeschke/comment-block-shell)
  (local-set-key (kbd "C-c B") 'mpeschke/comment-block-shell-section)
  )

(defun mpeschke/comment-blocks/lisp-style-bindings ()
  (local-set-key (kbd "C-c b") 'mpeschke/comment-block-lisp)
  (local-set-key (kbd "C-c B") 'mpeschke/comment-block-lisp-section)
  )

(mapc (lambda (mode-hook) (add-hook mode-hook 'mpeschke/comment-blocks/c-style-bindings))
      '(c-mode-hook
        c++-mode-hook
        java-mode-hook
        ))

(mapc (lambda (mode-hook) (add-hook mode-hook 'mpeschke/comment-blocks/shell-style-bindings))
      '(sh-mode-hook
        enh-ruby-mode-hook
        ))

(mapc (lambda (mode-hook) (add-hook mode-hook 'mpeschke/comment-blocks/lisp-style-bindings))
      '(emacs-lisp-mode-hook
        ))

;;;; Global keybindings
;;|=======================================
;;| Global hooks
;;|

;; My global prefix command ESC ESC
(define-prefix-command 'mpeschke/global-map nil "My Commands [d]edosify co[m]pile [M-q]:unfill [c]omment [|]toggle_split_window [a]lign(sub-menu) [i]nsert(sub-menu)")
(global-set-key "\e\e" 'mpeschke/global-map)

;; Main commands
(define-key mpeschke/global-map (kbd "d"  ) 'dedosify)
(define-key mpeschke/global-map (kbd "M-m") 'kill-compilation)
(define-key mpeschke/global-map (kbd "m"  ) 'compile)
(define-key mpeschke/global-map (kbd "M-q") 'mpeschke/unfill-paragraph)
(define-key mpeschke/global-map (kbd "c"  ) 'comment-or-uncomment-region)
(define-key mpeschke/global-map (kbd "|"  ) 'mpeschke/toggle-windows-split)

(define-key mpeschke/global-map (kbd "a") 'mpeschke/align-map)
(define-key mpeschke/global-map (kbd "i") 'mpeschke/insert-map)

;; Align sub-menu
(define-prefix-command 'mpeschke/align-map nil "[a]lign [c]urrent [t]ext [r]egex all-[s]trings")

(define-key mpeschke/align-map (kbd "a") 'align)
(define-key mpeschke/align-map (kbd "c") 'align-current)
(define-key mpeschke/align-map (kbd "t") 'mpeschke/align-in-text-mode)
(define-key mpeschke/align-map (kbd "r") 'align-regexp)
(define-key mpeschke/align-map (kbd "s") 'align-all-strings)

;; Insert sub-menu
(define-prefix-command 'mpeschke/insert-map nil "[u]nicode [d]ate date[s]tamp [t]imestamp [f]ile")

(define-key mpeschke/insert-map (kbd "i") 'ucs-insert)
(define-key mpeschke/insert-map (kbd "d") 'mpeschke/insert-date)
(define-key mpeschke/insert-map (kbd "s") 'mpeschke/insert-datestamp)
(define-key mpeschke/insert-map (kbd "t") 'mpeschke/insert-timestamp)
(define-key mpeschke/insert-map (kbd "f") 'mpeschke/insert-file-name)

;; Bindings for iedit
(global-set-key (kbd "C-c i"  ) 'iedit-mode)
(global-set-key (kbd "C-x r e") 'iedit-rectangle-mode)

;;|=======================================
;;| Other keybindings
;;|

;; Overrides
(global-set-key (kbd "C-a") 'mpeschke/better-move-beginning-of-line)
(global-set-key (kbd "C-n") 'goto-line)

;; Misc
(global-set-key (kbd "C-z") 'mpeschke/zoom)
(global-set-key (kbd "S-<tab>") 'auto-complete)
(global-set-key (kbd "C-<tab>") 'er/expand-region)

;; Bindings for the improved zap-to-char
(global-set-key [(meta m)]       'jump-char-forward)
(global-set-key [(shift meta m)] 'jump-char-backward)

;;|=======================================
;;| Mini-buffer key-bindings
;;|

;; Adds expansion to lisp evals in the minibuffers
(define-key read-expression-map [(tab)] 'hippie-expand)

;; Mini-buffer insert menu
(define-key minibuffer-local-map "\e\e" 'mpeschke/insert-map)

;;|=======================================
;;| Changes I liked from:
;;| http://en.wikipedia.org/wiki/User:Gwern/.emacs
;;|

;; Change C-x C-b behavior so it uses bs; shows only interesting buffers.
(global-set-key (kbd "C-x C-b") 'bs-show)

;; M-down and M-up do nothing! :(  Let's make them do something, like M-left and M-right do.
(global-set-key [M-down] '(lambda () (interactive) (progn (forward-line 10)  (recenter) ) ))
(global-set-key [M-up]   '(lambda () (interactive) (progn (forward-line -10) (recenter) ) ))
