(setq default-frame-alist '((font . "Mensch-10")))
(setq-default fill-column 1200)
(global-linum-mode t)
(setq-default tab-width 4)

(setq-default truncate-lines t)
(setq-default truncate-partial-width-windows nil)

(setq-default delete-selection-mode t)

(setq-default inhibit-startup-echo-area-message t)
(setq-default inhibit-startup-screen t)

(global-hl-line-mode 1)
(set-face-background 'hl-line "gray30")

(setq-default show-trailing-whitespace t)

;; Colors
(load "~/.emacs.d/site-lisp/color-theme-molokai/color-theme-molokai.el")
(color-theme-molokai)
(setq color-theme-is-global t )

(set-face-foreground 'default "seashell2")

(set-face-foreground 'font-lock-string-face "AntiqueWhite3")
(set-face-italic-p 'font-lock-string-face nil)

(set-face-foreground 'font-lock-comment-face "bisque3")
(set-face-italic-p 'font-lock-comment-face nil)

(set-face-foreground 'font-lock-comment-delimiter-face "bisque3")
(set-face-italic-p 'font-lock-comment-delimiter-face nil)

;; Show paren

(defadvice show-paren-function
  (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in the
        echo area. Has no effect if the character before point is not of
        the syntax class ')'."
  (interactive)
  (if (not (minibuffer-prompt))
      (let ((matching-text nil))
        ;; Only call `blink-matching-open' if the character before point
        ;; is a close parentheses type character. Otherwise, there's not
        ;; really any point, and `blink-matching-open' would just echo
        ;; "Mismatched parentheses", which gets really annoying.
        (if (char-equal (char-syntax (char-before (point))) ?\))
            (setq matching-text (blink-matching-open)))
        (if (not (null matching-text))
            (message matching-text)))))

(show-paren-mode 1)
(setq show-paren-delay 0)
(set-face-attribute 'show-paren-match-face nil :weight 'extra-bold)

(require 'powerline)

(provide 'appearance)

