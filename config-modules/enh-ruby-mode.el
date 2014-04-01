;;|=======================================
;;| Auto detects
;;|

(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))

;;|=======================================
;;| Helper functions
;;|

;; From: https://github.com/asok/.emacs.d/blob/master/inits/init-enh-ruby-mode.el
(defun mpeschke/enh-ruby/toggle-ruby-block-style ()
  (interactive)
  (enh-ruby-beginning-of-block)
  (if (looking-at-p "{")
      (let ((beg (point)))
	(delete-char 1)
	(insert (if (looking-back "[^ ]") " do" "do"))
	(when (looking-at "[ ]*|.*|")
	  (search-forward-regexp "[ ]*|.*|" (line-end-position)))
	(insert "\n")
	(goto-char (- (line-end-position) 1))
	(delete-char 1)
	(insert "\nend")
	(evil-indent beg (point))
	)
    (progn
      (ruby-end-of-block)
      (save-excursion ;; join lines if block is 1 line of code long
	(let ((end (line-end-position)))
	  (enh-ruby-beginning-of-block)
	  (if (= 2 (- (line-number-at-pos end) (line-number-at-pos)))
	      (evil-join (point) end)))
	(kill-line)
	(insert " }")
	(enh-ruby-beginning-of-block)
	(delete-char 2)
	(insert "{" )))))

;;|=======================================
;;| Variable settings
;;|
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(setq
 enh-ruby-bounce-deep-indent         t
 enh-ruby-hanging-brace-indent-level 2
 )
;;|=======================================
;;| Mode Hooks
;;|

;; Ruby block toggle
(add-hook 'enh-ruby-mode-hook
          (lambda () (local-set-key (kbd "C-c t")
                                    'mpeschke/enh-ruby/toggle-ruby-block-style)))
