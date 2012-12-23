(require 'yasnippet)

(setq yas/root-directory
       (expand-file-name "snippets/" dotfiles-dir))
(yas/load-directory yas/root-directory)
(yas/global-mode)

(provide 'setup-yasnippet)
