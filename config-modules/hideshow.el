(require 'hideshow)
(require 'sgml-mode)

(add-to-list 'hs-special-modes-alist
             '(sgml-mode
               "<!--\\|<[^/>]*[^/]>"
               "-->\\|</[^/>]*[^/]>"
               "<!--"
               sgml-skip-tag-forward
               nil))
(define-key hs-minor-mode-map (kbd "C-c h") 'hs-toggle-hiding)
