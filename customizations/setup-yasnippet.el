(require 'yasnippet)

(setq yas/root-directory
       '("~/.emacs.d/snippets/" "~/.emacs.d/el-get/yasnippet/snippets/"))
(mapc 'yas/load-directory yas/root-directory)
(yas/global-mode)
(setq yas/indent-line nil)

(add-hook 'yas/after-exit-snippet-hook 'clean-up-buffer-or-region)

(provide 'setup-yasnippet)
