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
;;| Cask package management
;;|

(require 'cask "/usr/local/Cellar/cask/0.5.2/cask.el")
(cask-initialize)
(require 'pallet)

;;|====================================
;;| Manually installed packages
;;|

;; add directories to load path
(add-to-list 'load-path "~/.emacs.d/")

;; Improved automatic alignment
(load "align-string.el")

;; Requires
(require 'uniquify)   ;; Needed to avoid <#> buffer names
