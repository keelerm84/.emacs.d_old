(set-face-foreground 'jabber-activity-personal-face "deep pink")
(set-face-bold-p 'jabber-activity-personal-face t)

(set-face-foreground 'jabber-chat-prompt-foreign "salmon")
(set-face-bold-p 'jabber-chat-prompt-foreign t)

(set-face-foreground 'jabber-chat-prompt-local "olive drab")
(set-face-bold-p 'jabber-chat-prompt-local t)

(set-face-foreground 'jabber-rare-time-face "LightGoldenrod3")
(set-face-underline-p 'jabber-rare-time-face t)

(set-face-foreground 'jabber-roster-user-away "peru")
(set-face-italic-p 'jabber-roster-user-away t)
(set-face-bold-p 'jabber-roster-user-away nil)

(set-face-foreground 'jabber-roster-user-online "dark orange")
(set-face-italic-p 'jabber-roster-user-online nil)
(set-face-bold-p 'jabber-roster-user-online t)

(setq jabber-roster-line-format "%c %-25n %u %-8s  %S")

(add-hook 'jabber-chat-mode-hook (lambda() (flyspell-mode t)))

(provide 'setup-jabber)
