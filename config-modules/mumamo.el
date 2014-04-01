(require 'mumamo)
;; Workaround the annoying warnings:
;;    Warning (mumamo-per-buffer-local-vars):
;;    Already 'permanent-local t: buffer-file-name
;; From: https://gist.github.com/tkf/3951163
(when (equal emacs-major-version 24)
  (eval-after-load
   "mumamo"
   '(setq mumamo-per-buffer-local-vars
          (delq 'buffer-file-name mumamo-per-buffer-local-vars)
          )))
