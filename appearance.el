(set-face-attribute 'default nil :font "Consolas-10")

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq-default fill-column 1200)
(global-linum-mode t)
(setq-default tab-width 4)

(setq-default truncate-lines t)
(setq-default truncate-partial-width-windows nil)

(setq-default delete-selection-mode t)

(setq-default inhibit-startup-echo-area-message t)
(setq-default inhibit-startup-screen t)

;; Colors
(load "~/.emacs.d/site-lisp/color-theme-molokai/color-theme-molokai.el")
(color-theme-molokai)
(setq color-theme-is-global t )

(provide 'appearance)
