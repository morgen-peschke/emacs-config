;;|=======================================
;;| Completion options
;;|

;; preserve case in hippie-expand
(defadvice hippie-expand (around hippie-expand-case-fold)
  "Try to do case-sensitive matching (not effective with all functions)."
  (let ((case-fold-search nil))
    ad-do-it))
(ad-activate 'hippie-expand)

;; This switches tab and space so space will be the one that completes as
;; far as possible, which is the one we usually want.
(define-key minibuffer-local-must-match-map "\040" 'minibuffer-complete)
(define-key minibuffer-local-must-match-map "\011" 'minibuffer-complete-word)
(define-key minibuffer-local-completion-map "\040" 'minibuffer-complete)
(define-key minibuffer-local-completion-map "\011" 'minibuffer-complete-word)
