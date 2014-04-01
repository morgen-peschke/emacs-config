;;|=======================================
;;| Helper functions
;;|

(defun imenu-sh-sections ()
  (setq imenu-prev-index-position-function nil)
  (setq imenu-generic-expression ())
  (add-to-list 'imenu-generic-expression
               '(nil "^[[:space:]]*##[[:space:]]\\([[:punct:]]?.*\\b[[:punct:]]?\\)[[:space:]]*#*$" 1) t)
  (add-to-list 'imenu-generic-expression
               '("Functions"
                "^\\s-*function\\s-+\\([[:alpha:]_-][[:alnum:]_-]+\\)\\s-*\\(()\\)?" 1)
               t)
  (add-to-list 'imenu-generic-expression
               '("Functions"
                 "^\\s-*\\(function\\s-+\\)?\\([[:alpha:]_-][[:alnum:]_-]+\\)\\s-*()" 2)
               t)
  )

;; Not working at the moment
(defun imenu-perl-sections ()
  (setq imenu-create-index-function 'imenu-default-create-index-function)
  (setq imenu-prev-index-position-function nil)
  (setq imenu-generic-expression ())

  (add-to-list 'imenu-generic-expression
               '(nil "^[[:space:]]*##[[:space:]]\\([[:punct:]]?.*\\b[[:punct:]]?\\)[[:space:]]*#*$" 1) t)
  (add-to-list 'imenu-generic-expression
               '("Functions"
                 "sub[[:space:]]+\\(\\b.*\\b\\)[[:space:]]*{?$" 1) t)
  )

(defun imenu-c-sections ()
  (setq imenu-prev-index-position-function nil)
  (add-to-list 'imenu-generic-expression
               '("Sections" "[[:space:]]*[*]+[[:space:]]+\\(\\b.*\\b[[:punct:]]?\\)[[:space:]]+[*]+$" 1) t)
  )

;; From: http://metasandwich.com/2013/01/19/emacs-config-youre-doing-it-wrong/
(defun imenu-elisp-sections ()
  (setq imenu-prev-index-position-function nil)
  (add-to-list 'imenu-generic-expression
               '("Sections" ";;[*]+[[:space:]]+\\(\\b.*\\b\\)[[:space:]]+[*]+$" 1) t)

  (add-to-list 'imenu-generic-expression
               '("Sections" ";;|\\([[:space:]]+\\b.*\\b\\)$" 1) t)
  )

;;|=======================================
;;| Install the hooks
;;|

(add-hook 'emacs-lisp-mode-hook 'imenu-elisp-sections)
(add-hook 'sh-mode-hook         'imenu-sh-sections)
(add-hook 'c-mode-hook          'imenu-c-sections)
(add-hook 'c++-mode-hook        'imenu-c-sections)
(add-hook 'java-mode-hook       'imenu-c-sections)
