;;|====================================
;;| el-get install/load
;;|
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(setq mpeschke/packages/el-get-package-list
      '(nxhtml
        iedit
        ))

(el-get 'sync mpeschke/packages/el-get-package-list)

;;|====================================
;;| package.el
;;|

;; add MELPA to the repositories
(require 'package)
(package-initialize)
(package-refresh-contents)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)

(setq mpeschke/packages/package-list
      '(enh-ruby-mode
        json-mode
        lua-mode
        markdown-mode
        org
        rinari
        yaml-mode

        ansi-color ;; Ansi color in compilation buffer
        jump-char
        ido
        ))

(defun mpeschke/packages/install (p)
  (when (not (package-installed-p p))
    (package-install p)
  ))

(add-hook 'after-init-hook (lambda ()
                             (mapc (lambda (p) (mpeschke/packages/install p))
                                   mpeschke/packages/package-list)
                             ))

;;|====================================
;;| Manually installed packages
;;|

;; add directories to load path
(add-to-list 'load-path "~/.emacs.d/")

;; Improved automatic alignment
(load "align-string.el")

;; Requires
(require 'uniquify)   ;; Needed to avoid <#> buffer names
