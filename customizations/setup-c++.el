(add-hook 'c-mode-common-hook (lambda() (local-set-key (kbd "C-c o") 'ff-find-other-file)))
(add-hook 'c-mode-common-hook (lambda() (local-set-key (kbd "C-c C-c") 'compile)))
(add-hook 'c-mode-common-hook (lambda() (local-set-key (kbd "C-c C-r") 'recompile)))

(provide 'setup-c++)
