(setq twittering-use-master-password t)

(add-hook 'twittering-edit-mode-hook (lambda() (flyspell-mode t)))

(provide 'setup-twitter)
