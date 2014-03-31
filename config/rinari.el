;; Rinari (Minor Mode for Ruby On Rails)
(mapc (lambda (mode-hook) (add-hook mode-hook 'rinari-minor-mode))
      '(mumamo-after-change-major-mode-hook
        enh-ruby-mode-hook
        css-mode-hook
        yaml-mode-hook
        html-mode-hook
        js-mode-hook))

;;|=======================================
;;| Keybindings
;;|
(define-prefix-command 'ri-map nil "Rinari [c]onsole, [f]ind")

(define-key ri-map (kbd "c") 'rinari-console)

(define-prefix-command 'ri-find-map nil "Rinari-find [a]pplication [c]ontroller [file] [h]elper [m]igration [j]avascript [l]ib [m]odel [p]artial [t]est [v]iew [s]tylesheet")
(define-key ri-map (kbd "f") ri-find-map)

(define-key ri-find-map (kbd "a") 'rinari-find-application)
(define-key ri-find-map (kbd "c") 'rinari-find-controller)
(define-key ri-find-map (kbd "f") 'rinari-find-file-in-project)
(define-key ri-find-map (kbd "h") 'rinari-find-helper)
(define-key ri-find-map (kbd "m") 'rinari-find-migration)
(define-key ri-find-map (kbd "j") 'rinari-find-javascript)
(define-key ri-find-map (kbd "l") 'rinari-find-lib)
(define-key ri-find-map (kbd "m") 'rinari-find-model)
(define-key ri-find-map (kbd "p") 'rinari-goto-partial)
(define-key ri-find-map (kbd "t") 'rinari-find-test)
(define-key ri-find-map (kbd "v") 'rinari-find-view)
(define-key ri-find-map (kbd "s") 'rinari-find-stylesheet)

(add-hook 'rinari-minor-mode-hook (lambda () (local-set-key (kbd "M-r") ri-map)))
