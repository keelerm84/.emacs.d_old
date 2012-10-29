(set-face-attribute 'default nil :font "Consolas-10")

(setq-default fill-column 1200)
(global-linum-mode t)
(setq-default tab-width 4)

(setq-default truncate-lines t)
(setq-default truncate-partial-width-windows nil)

(setq-default delete-selection-mode t)

(setq-default inhibit-startup-echo-area-message t)
(setq-default inhibit-startup-screen t)

(global-hl-line-mode 1)

;; Colors
(load "~/.emacs.d/site-lisp/color-theme-molokai/color-theme-molokai.el")
(color-theme-molokai)
(setq color-theme-is-global t )

(set-face-foreground 'font-lock-string-face "light gray")
(set-face-italic-p 'font-lock-string-face nil)

(set-face-foreground 'font-lock-comment-face "light gray")
(set-face-italic-p 'font-lock-comment-face nil)

(set-face-foreground 'font-lock-comment-delimiter-face "light gray")
(set-face-italic-p 'font-lock-comment-delimiter-face nil)

(provide 'appearance)
