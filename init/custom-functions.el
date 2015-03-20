;;|=======================================
;;| Startup functions
;;|

;; Get rid of the scratch buffer
;; From: http://stackoverflow.com/a/2667426
;;;###autoload
(defun mpeschke/close-scratch ()
  (kill-buffer "*scratch*")
  (if (not (or
            (delq nil (mapcar 'buffer-file-name (buffer-list)))
            (get-buffer "Folder")))
      (mpeschke/goto-or-create-untitled-buffer)
    ))

;;;###autoload
(defun mpeschke/goto-or-create-untitled-buffer ()
  "Opens a new empty buffer."
  (interactive)
  (if (get-buffer "Untitled")
      (switch-to-buffer "Untitled")
    (let ((buf (generate-new-buffer "Untitled")))
      (switch-to-buffer buf)
      (text-mode)
      )))

;;|=======================================
;;| Enhancements to built in commands
;;|

;; Wraps around move-beginning-of-line to jump to the indentation point if the
;; cursor is already at the beginning of the line.
;;;###autoload
(defun mpeschke/better-move-beginning-of-line ()
  (interactive)
  (if (eq (current-column) 0)
      (back-to-indentation)
    (move-beginning-of-line nil)))

;; Unfill paragraph
;;;###autoload
(defun mpeschke/unfill-paragraph ()
  (interactive)
  (save-excursion

    (if (region-active-p)
        (let ((fill-column (point-max)))
          (fill-region (region-beginning) (region-end) nil))

      (let ((fill-column (point-max)))
        (fill-paragraph nil))
      )))

;; Align on whitespace
;;;###autoload
(defun mpeschke/align-in-text-mode ()
  (interactive)
  (let ((current-prefix-arg '(4)))
    (call-interactively 'align)
    ))

;;|=======================================
;;| Date functions
;;|

;; Insert today's date as yymmdd
;;;###autoload
(defun mpeschke/insert-datestamp ()
  "Inserts today's date"  (interactive)
  (insert (format-time-string "%Y%m%d")))

;;;###autoload
(defun mpeschke/insert-timestamp ()
  "Inserts a pretty formatted date"  (interactive)
  (insert (format-time-string "%s")))

;;;###autoload
(defun mpeschke/insert-date ()
  "Inserts a pretty formatted date"  (interactive)
  (insert (format-time-string "%Y/%m/%d")))

;;|=======================================
;;| Comment block - C/C++
;;|

;;;###autoload
(defun mpeschke/comment-block-c-section ()
  "Inserts a section comment block"  (interactive)
  (insert  "/**********************************************************************" ) (c-indent-line)
  (insert "\n**********************************************************************" ) (c-indent-line)
  (insert "\n**                                                                  **" ) (c-indent-line)
  (insert "\n**                                                                  **" ) (c-indent-line)
  (insert "\n**                                                                  **" ) (c-indent-line)
  (insert "\n**********************************************************************" ) (c-indent-line)
  (insert "\n**********************************************************************/") (c-indent-line))

;;;###autoload
(defun mpeschke/comment-block-c ()
  "Inserts an empty comment block"  (interactive)
  (insert  "/**********************************************************************" ) (c-indent-line)
  (insert "\n*")                                                                       (c-indent-line)
  (insert "\n**********************************************************************/") (c-indent-line))

;;;###autoload
(defun mpeschke/comment-block-c-small()
  "Inserts a smaller comment block"  (interactive)
  (insert  "/****************************************" ) (c-indent-line)
  (insert "\n*")                                         (c-indent-line)
  (insert "\n****************************************/") (c-indent-line))

;;;###autoload
(defun mpeschke/comment-block-c-critical()
  "Inserts an opening and closing critical section comment block"
  (interactive)
  (insert   "/****************************************" ) (c-indent-line)
  (insert  "\n* BEGIN Critical Section")                  (c-indent-line)
  (insert  "\n****************************************/") (c-indent-line)
  (insert "\n/****************************************" ) (c-indent-line)
  (insert  "\n* END   Critical Section")                  (c-indent-line)
  (insert  "\n****************************************/") (c-indent-line))

;;|=======================================
;;| Comment block - Lisp
;;|

;;;###autoload
(defun mpeschke/comment-block-lisp-section()
  "Inserts a section comment block"
  (interactive)
  (insert ";;****************************************\n") (lisp-indent-line)
  (insert ";;**                                    **\n") (lisp-indent-line)
  (insert ";;**                                    **\n") (lisp-indent-line)
  (insert ";;**                                    **\n") (lisp-indent-line)
  (insert ";;****************************************\n") (lisp-indent-line)
  )

;;;###autoload
(defun mpeschke/comment-block-lisp()
  "Inserts a sub-section comment block"
  (interactive)
  (insert ";;|=======================================\n") (lisp-indent-line)
  (insert ";;| \n"                                      ) (lisp-indent-line)
  (insert ";;| \n"                                      ) (lisp-indent-line)
  )

;;|=======================================
;;| Comment block - shell
;;|

;;;###autoload
(defun mpeschke/comment-block-shell()
  "Inserts a sub-section comment block"
  (interactive)
  (insert "#########################################\n" ) (indent-according-to-mode)
  (insert "##                                      #\n" ) (indent-according-to-mode)
  (insert "##                                      #\n" ) (indent-according-to-mode)
  (insert "##                                      #\n" ) (indent-according-to-mode)
  (insert "#########################################\n" ) (indent-according-to-mode)
  )

;;|=======================================
;;| Shell command extensions
;;|

;; Execute region in shell (http://stackoverflow.com/a/6293423/1188897)
;;;###autoload
(defun mpeschke/shell-region-as-command (start end)
  "execute region in an inferior shell"
  (interactive "r")
  (shell-command-with-aliases  (buffer-substring-no-properties start end)))

;; Execute shell command with aliases (functions really more than aliases)
;;;###autoload
(defun mpeschke/shell-command-with-aliases (cmd)
  (interactive (list (read-shell-command "Shell command: ")))
  (shell-command (concat "~/bin/eval-alias " cmd) current-prefix-arg))

;; Shell command to string (comment in http://stackoverflow.com/a/5020475)
;;;###autoload
(defun mpeschke/shell-command-to-string (&rest cmd)
  (replace-regexp-in-string "\r?\n$" ""
                            (shell-command-to-string
                             (mapconcat 'identity cmd " "))))

;;|=======================================
;;| Miscellaneous
;;|

;; Removes extra characters from dos files
;;;###autoload
(defun mpeschke/dedosify ()
  "Remove any ^M or ^Z characters in a buffer."
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\015" nil t)  ;^M
    (replace-match "\n" nil t))
  (goto-char (point-min))
  (while (search-forward "\032" nil t)  ;^Z
    (replace-match "" nil t))
  )

;;;###autoload
(defun mpeschke/colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))

;; Processes ANSI color codes
;;;###autoload
(defun mpeschke/fixcolor ()
  "Correctly display ANSI color in a buffer - modifies file!"
  (interactive)
  (ansi-color-apply-on-region (point-min) (point-max)))

;; Insert file name
;; Normal   - normal
;; Prefix - full path
;;;###autoload
(defun mpeschke/insert-file-name (p)
  (interactive "P")
  (if p
      (insert (buffer-file-name (mpeschke/current-buffer)))
    (insert (file-relative-name (buffer-file-name (mpeschke/current-buffer))))
    )
  )

;; http://stackoverflow.com/questions/455345/in-emacs-how-to-insert-file-name-in-shell-command
(defun mpeschke/current-buffer ()
  "Return current-buffer if current buffer is not the *mini-buffer*
  else return buffer before minibuf is activated."
  (if (not (window-minibuffer-p)) (current-buffer)
      (if (eq (get-lru-window) (next-window))
    	  (window-buffer (previous-window)) (window-buffer (next-window)))))

;; Current buffer mode
;;;###autoload
(defun mpeschke/current-mode ()
  (interactive)
  (buffer-local-value 'major-mode (current-buffer))
  (message "Current mode: %s" (symbol-value 'major-mode)))

;; Current active keymaps
;; Source: David Kastrup via http://www.emacswiki.org/emacs/KeyBindingDiscussion
;;;###autoload
(defun mpeschke/current-keymaps ()
  (interactive)
  (mapcar (lambda (x)
            (car (rassq x minor-mode-map-alist)))
          (current-minor-mode-maps))
  )

;; Toggle between split windows and a single window
;; Source: Nelson Gonçalves via the Emacs Community on G+
;;;###autoload
(defun mpeschke/toggle-windows-split()
  "Switch back and forth between one window and whatever split offset windows we
might have in the frame. The idea is to maximize the current buffer, while being
able to go back to the previous split of windows in the frame simply by calling
this command again."
  (interactive)
  (if (not (window-minibuffer-p (selected-window)))
      (progn
        (if (< 1 (count-windows))
            (progn
              (window-configuration-to-register ?u)
              (delete-other-windows))
          (jump-to-register ?u)))))

;; Macro for Perl style join
(defmacro join (join-char &rest others) `(mapconcat 'identity ',others ,join-char))

;; Switch quickly between zoom levels
;;;###autoload
(defun mpeschke/zoom ()
  (interactive)
  (if (equal text-scale-mode-amount 0)
      (text-scale-set -1)
    (text-scale-set 0)
    ))

;; Copy entire buffer to kill ring
;;;###autoload
(defun mpeschke/kill-ring-save-buffer ()
  "Copy entire buffer to kill ring"
  (interactive)
  (clipboard-kill-ring-save (point-min) (point-max)))
