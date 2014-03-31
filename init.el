;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; Global settings
(load-file "~/.emacs.d/init/packages.el")

;; The rest of the config is here, so that the package management system will be
;; up when they are initialized.
(load-file "~/.emacs.d/init/custom-functions.el")
(load-file "~/.emacs.d/init/variable-and-function-calls.el")
(load-file "~/.emacs.d/init/completion.el")
(load-file "~/.emacs.d/init/hooks.el")
(load-file "~/.emacs.d/init/keybindings.el")
(load-file "~/.emacs.d/init/auto-detect.el")
(load-file "~/.emacs.d/init/server.el")

;; Library configurations
(load-file "~/.emacs.d/config/align.el")
(load-file "~/.emacs.d/config/php.el")
(load-file "~/.emacs.d/config/rinari.el")
(load-file "~/.emacs.d/config/mumamo.el")
(load-file "~/.emacs.d/config/imenu.el")
(load-file "~/.emacs.d/config/enh-ruby-mode.el")
(load-file "~/.emacs.d/config/outline-minor-mode.el")

;; Customize Variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(align-text-modes (quote (text-mode outline-mode org-mode)))
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-generic-program "chromium")
 '(custom-enabled-themes (quote (deeper-blue)))
 '(hippie-expand-dabbrev-skip-space nil)
 '(hippie-expand-verbose nil)
 '(ispell-query-replace-choices t)
 '(js-indent-level 2)
 '(lua-indent-level 2)
 '(mumamo-background-colors nil)
 '(mumamo-chunk-coloring 0)
 '(org-archive-location "%s-archive::From %s")
 '(org-default-notes-file "notes")
 '(org-drill-optimal-factor-matrix (quote ((1 (2.5 . 4.0)))))
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-modules (quote (org-bbdb org-bibtex org-jsinfo org-wl org-bookmark org-drill org-man)))
 '(org-todo-keyword-faces (quote (("WAIT" . org-agenda-dimmed-todo-face))))
 '(org-todo-keywords (quote ((sequence "WAIT(3)" "TODO(2)" "DONE(1)"))))
 '(package-archives (quote (("melpa" . "http://melpa.milkbox.net/packages/") ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(ruby-insert-encoding-magic-comment nil)
 '(vc-checkout-carefully t)
 '(vc-command-messages t)
 '(vc-default-init-revision "0.1")
 '(vc-handled-backends (quote (RCS SVN Git)))
 '(vc-initial-comment t)
 '(vc-mistrust-permissions t)
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
