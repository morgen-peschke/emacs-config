(define-prefix-command 'co-map nil "Outline [h]ide [s]how [u]p,[n]ext,[p]rev,[f]wd,[b]ack")
;; HIDE
(define-prefix-command 'coh-map nil "Outline-Hide [s]ublevels,[b]ody,[o]ther,[e]ntry,[l]eaves,[s]ubtree")
(define-key co-map  (kbd "h") coh-map)
(define-key coh-map (kbd "s") 'hide-sublevels)    ; Hide everything but the top-level headings
(define-key coh-map (kbd "a") 'hide-body)         ; Hide everything but headings (all body lines)
(define-key coh-map (kbd "o") 'hide-other)        ; Hide other branches
(define-key coh-map (kbd "e") 'hide-entry)        ; Hide this entry's body
(define-key coh-map (kbd "l") 'hide-leaves)       ; Hide body lines in this entry and sub-entries
(define-key coh-map (kbd "t") 'hide-subtree)      ; Hide everything in this entry and sub-entries
;; SHOW
(define-prefix-command 'cos-map nil "Outline-Show [a]ll,[e]ntry,[c]hildren,[b]ranches,[s]ubtree")
(define-key co-map  (kbd "s") cos-map)
(define-key cos-map (kbd "a") 'show-all)          ; Show (expand) everything
(define-key cos-map (kbd "e") 'show-entry)        ; Show this heading's body
(define-key cos-map (kbd "c") 'show-children)     ; Show this heading's immediate child sub-headings
(define-key cos-map (kbd "b") 'show-branches)     ; Show all sub-headings under this heading
(define-key cos-map (kbd "t") 'show-subtree)      ; Show (expand) everything in this heading & below
;; MOVE
(define-key co-map (kbd "u") 'outline-up-heading)                ; Up
(define-key co-map (kbd "n") 'outline-next-visible-heading)      ; Next
(define-key co-map (kbd "p") 'outline-previous-visible-heading)  ; Previous
(define-key co-map (kbd "f") 'outline-forward-same-level)        ; Forward - same level
(define-key co-map (kbd "b") 'outline-backward-same-level)       ; Backward - same level

(add-hook 'outline-minor-mode-hook
          (lambda () (local-set-key "\C-o" co-map)))
