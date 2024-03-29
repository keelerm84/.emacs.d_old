(delete-selection-mode t)
(setq blink-matching-paren t)

(fset 'yes-or-no-p 'y-or-n-p)

(set-default 'indent-tabs-mode nil)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)



(provide 'my-misc)
