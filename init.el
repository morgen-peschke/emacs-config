;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; Cygwin stuff (needs to be first to avoid issues (stuff that requires bash, etc)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Windows specific settings
(let* ((cygwin-root "c:/cygwin64")
       (cygwin-bin (concat cygwin-root "/bin")))
  (when (and (eq 'windows-nt system-type)
  	     (file-readable-p cygwin-root))

    (setq exec-path (cons cygwin-bin exec-path))
    (setenv "PATH" (concat cygwin-bin ";" (getenv "PATH")))

    ;; By default use the Windows HOME.
    ;; Otherwise, uncomment below to set a HOME
    ;;      (setenv "HOME" (concat cygwin-root "/home/eric"))

    ;; NT-emacs assumes a Windows shell. Change to bash.
    (setq shell-file-name "bash")
    (setenv "SHELL" shell-file-name)
    (setq explicit-shell-file-name shell-file-name)

    ;; This removes unsightly ^M characters that would otherwise
    ;; appear in the output of java applications.
    (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

    ;; Prevent issues with the Windows null device (NUL)
    ;; when using cygwin find with rgrep.
    (defadvice grep-compute-defaults (around grep-compute-defaults-advice-null-device)
      "Use cygwin's /dev/null as the null-device."
      (let ((null-device "/dev/null"))
	ad-do-it))
    (ad-activate 'grep-compute-defaults)
    ))

;; Add common alternate install path to exec-path (looking at you Homebrew!)
(setq exec-path (append exec-path '("/usr/local/bin")))

;; Global settings
(load-file "~/.emacs.d/init/packages.el")

;; These are loaded here explicitly as the order matters somewhat
(load-file "~/.emacs.d/init/custom-functions.el")
(load-file "~/.emacs.d/init/variable-and-function-calls.el")
(load-file "~/.emacs.d/init/completion.el")
(load-file "~/.emacs.d/init/hooks.el")
(load-file "~/.emacs.d/init/keybindings.el")
(load-file "~/.emacs.d/init/server.el")

;; Library configurations will be loaded from ~/.emacs.d/config-modules, as the order doesn't really matter

;; Customize Variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(align-text-modes (quote (text-mode outline-mode org-mode)))
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(hippie-expand-dabbrev-skip-space nil)
 '(hippie-expand-verbose nil)
 '(ispell-query-replace-choices t)
 '(js-indent-level 2)
 '(load-dirs "~/.emacs.d/config-modules")
 '(lua-indent-level 2)
 '(org-agenda-files (quote ("~/agenda.org")))
 '(org-archive-location "%s-archive::From %s")
 '(org-default-notes-file "notes")
 '(org-drill-optimal-factor-matrix (quote ((1 (2.5 . 4.0)))))
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . emacs)
     ("\\.pdf\\'" . default))))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-jsinfo org-wl org-bookmark org-drill org-man)))
 '(org-todo-keyword-faces
   (quote
    (("TODO" . org-todo)
     ("DOING" . org-agenda-current-time)
     ("IN-REVIEW" . org-done)
     ("MERGED" . org-done)
     ("WAIT" . org-agenda-dimmed-todo-face)
     ("BLOCKED" . org-warning)
     ("BROKEN" . org-warning)
     ("DONE" . org-done))))
 '(org-todo-keywords
   (quote
    ((sequence "TODO(1)" "DOING(2)" "IN-REVIEW(3)" "MERGED(4)" "WAIT(5)" "BLOCKED(6)" "BROKEN(7)" "DONE(8)"))))
 '(package-archives
   (quote
    (("melpa" . "http://melpa.milkbox.net/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (groovy-mode string-inflection yaml-mode ws-butler vlf unicode-fonts rainbow-mode pallet markdown-mode lua-mode load-dir jump-char json-mode iedit highlight-indentation expand-region enh-ruby-mode csv-mode auto-complete ag)))
 '(pretty-symbol-categories (lambda relational logical nil))
 '(pretty-symbol-patterns
   (quote
    ((955 lambda "\\<lambda\\>"
          (emacs-lisp-mode inferior-lisp-mode inferior-emacs-lisp-mode lisp-mode scheme-mode python-mode inferior-python-mode))
     (402 lambda "\\<function\\>"
          (js-mode))
     (8800 relational "!="
           (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode))
     (8800 relational "/="
           (emacs-lisp-mode inferior-lisp-mode inferior-emacs-lisp-mode lisp-mode scheme-mode))
     (8805 relational ">="
           (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode emacs-lisp-mode inferior-lisp-mode inferior-emacs-lisp-mode lisp-mode scheme-mode))
     (8804 relational "<="
           (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode emacs-lisp-mode inferior-lisp-mode inferior-emacs-lisp-mode lisp-mode scheme-mode))
     (8743 logical "&&"
           (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode))
     (8743 logical "\\<and\\>"
           (emacs-lisp-mode inferior-lisp-mode inferior-emacs-lisp-mode lisp-mode scheme-mode))
     (8744 logical "||"
           (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode))
     (8744 logical "\\<or\\>"
           (emacs-lisp-mode inferior-lisp-mode inferior-emacs-lisp-mode lisp-mode scheme-mode))
     (172 logical "\\<not\\>"
          (emacs-lisp-mode inferior-lisp-mode inferior-emacs-lisp-mode lisp-mode scheme-mode))
     (8709 nil "\\<nil\\>"
           (emacs-lisp-mode inferior-lisp-mode inferior-emacs-lisp-mode lisp-mode scheme-mode ruby-mode)))))
 '(ruby-insert-encoding-magic-comment nil)
 '(scala-indent:align-forms t)
 '(scala-indent:align-parameters nil)
 '(scala-indent:default-run-on-strategy 1)
 '(vc-checkout-carefully t)
 '(vc-command-messages t)
 '(vc-default-init-revision "0.1")
 '(vc-handled-backends (quote (RCS SVN Git)))
 '(vc-initial-comment t)
 '(vc-mistrust-permissions t)
 '(visible-bell t)
 '(ws-butler-global-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ensime-implicit-highlight ((t (:underline "Blue")))))
