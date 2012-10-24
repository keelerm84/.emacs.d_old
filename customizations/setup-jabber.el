'(jabber-activity-personal-face (:foreground "deep pink" :weight bold))
'(jabber-chat-prompt-foreign (:foreground "salmon" :weight bold))
'(jabber-chat-prompt-local (:foreground "olive drab" :weight bold))
'(jabber-rare-time-face (:foreground "LightGoldenrod3" :underline t))
'(jabber-roster-user-away (:foreground "peru" :slant italic :weight normal))
'(jabber-roster-user-online (:foreground "dark orange" :slant normal :weight bold))
(setq jabber-roster-line-format "%c %-25n %u %-8s  %S")

(add-hook 'jabber-chat-mode-hook (lambda() (flyspell-mode t)))

(provide 'setup-jabber)
