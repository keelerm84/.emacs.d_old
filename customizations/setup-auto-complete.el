(add-to-list 'load-path (expand-file-name "auto-complete/lib/popup/" site-lisp-dir))

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (expand-file-name
             (concat site-lisp-dir  "/auto-complete/dict")))
(setq ac-comphist-file (expand-file-name
             (concat dotfiles-dir "/ac-comphist.dat")))
(ac-config-default)

(provide 'setup-auto-complete)
