;; Rinari (Minor Mode for Ruby On Rails)
(mapc (lambda (mode-hook) (add-hook mode-hook 'rinari-minor-mode))
      '(mumamo-after-change-major-mode-hook
        enh-ruby-mode-hook
        css-mode-hook
        yaml-mode-hook
        html-mode-hook
        js-mode-hook))

;; Wrapper function
(defun mpeschke/rinari/gowim (tgt)
  (let ((tgt
         (mpeschke/shell-command-to-string
          "rails-goto-apropos.rb"
          buffer-file-name
          tgt)))
    (when (not (string-match "is not .*a handled directory" tgt))
      (find-file tgt))
    (message tgt)
      ))

;;|=======================================
;;| Keybindings
;;|

;; Main menu
(define-prefix-command 'ri-map nil "Rinari [c]onsole, [f]ind, [g]o")
(define-key ri-map (kbd "c") 'rinari-console)

;; Find sub-menu
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

;; Go sub-menu
(define-prefix-command 'ri-go-map nil "Rinari-go [m]odel [v]iew [c]ontroller [h]elper [j]avascript [s]tylesheet [t]ests")
(define-key ri-map (kbd "g") ri-go-map)

(define-key ri-go-map (kbd "m") (lambda () (interactive) (mpeschke/rinari/gowim "model" )))
(define-key ri-go-map (kbd "v") (lambda () (interactive) (mpeschke/rinari/gowim "view"  )))
(define-key ri-go-map (kbd "c") (lambda () (interactive) (mpeschke/rinari/gowim "contr" )))
(define-key ri-go-map (kbd "h") (lambda () (interactive) (mpeschke/rinari/gowim "helper")))
(define-key ri-go-map (kbd "j") (lambda () (interactive) (mpeschke/rinari/gowim "javas" )))
(define-key ri-go-map (kbd "s") (lambda () (interactive) (mpeschke/rinari/gowim "style" )))

(define-prefix-command 'ri-go-test-map nil "Rinari-go tests [u]nit [f]unctional [i]ntegration fi[x]tures")
(define-key ri-go-map (kbd "t") ri-go-test-map)

(define-key ri-go-test-map (kbd "u") (lambda () (interactive) (mpeschke/rinari/gowim "unit"  )))
(define-key ri-go-test-map (kbd "f") (lambda () (interactive) (mpeschke/rinari/gowim "func"  )))
(define-key ri-go-test-map (kbd "i") (lambda () (interactive) (mpeschke/rinari/gowim "integ" )))
(define-key ri-go-test-map (kbd "x") (lambda () (interactive) (mpeschke/rinari/gowim "fixtu" )))

(add-hook 'rinari-minor-mode-hook (lambda () (local-set-key (kbd "M-r") ri-map)))
