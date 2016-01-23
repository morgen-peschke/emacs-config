;;|=======================================
;;| Variable-controlled settings
;;|

(when window-system
  ;; use extended compound-text coding for X clipboard
  (set-selection-coding-system 'compound-text-with-extensions)

  ;; Mouse interactivity settings
  (setq
   mouse-drag-copy-region     nil
   x-select-enable-clipboard  t
   )
)

;; Tab inserts spaces, not tabs
(setq-default indent-tabs-mode nil)

(setq
 uniquify-buffer-name-style 'forward          ;; Avoid <#> buffer names
 require-final-newline      t                 ;; always end a file with a newline
 dabbrev-case-replace       nil               ;; preserve case when expanding dabbrevs
 inhibit-startup-screen     t                 ;; Disable the startup screen
 compile-command            "make"            ;; Set default compile command to a simple make
 transient-mark-mode        t                 ;; enable visual feedback on selections
 diff-switches              "-u"              ;; default to unified diffs
 mac-command-modifier       'meta             ;; Mac meta setting
 ;; default to better frame titles
 frame-title-format         (concat  "%b - emacs@"
                                     (system-name))
 )

(put 'narrow-to-region 'disabled nil) ;; Enable narrowing the buffer to a region
(put 'upcase-region    'disabled nil) ;; Enable up-casing a entire region with one command
(put 'downcase-region  'disabled nil) ;; Enable down-casing a entire region with one command

;; Have Emacs know about bash's exec path
(let ((path (shell-command-to-string ". ~/.bashrc; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path
        (append
         (split-string-and-unquote path ":")
         exec-path)))

;; Have emacs know about the prefered browser
(let ((envbrowser (shell-command-to-string ". ~/.bashrc; echo -n $BROWSER")))
  (setenv "BROWSER" envbrowser))

;;|=======================================
;;| Function call settings
;;|

(global-font-lock-mode t         ) ;; turn on font-lock mode
(delete-selection-mode 1         ) ;; Typing replaces text in region
(display-time                    ) ;; Show time in the status bar
(menu-bar-mode         0         ) ;; Hide the menu bar
(tool-bar-mode        -1         ) ;; Hide the tool bar
(column-number-mode    1         ) ;; Column numbers in mode line
(line-number-mode      1         ) ;; Row numbers in mode line
(global-linum-mode     0         ) ;; Display line numbers on side of frame,
                                   ;; cannot be enabled globally as it borks
                                   ;; docview.
(text-scale-set        0         ) ;; Set initial zoom level
(fset 'yes-or-no-p     'y-or-n-p ) ;; uses y instead of yes
(electric-pair-mode    t         ) ;; allows for matching "" and () and []
(ido-mode              1         ) ;; nicer completions

;; Set UTF-8 the default text encoding
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(set-locale-environment "en_US.UTF-8")
(prefer-coding-system 'utf-8)
