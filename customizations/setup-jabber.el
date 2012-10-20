'(jabber-activity-personal-face (:foreground "deep pink" :weight bold))
'(jabber-chat-prompt-foreign (:foreground "salmon" :weight bold))
'(jabber-chat-prompt-local (:foreground "olive drab" :weight bold))
'(jabber-rare-time-face (:foreground "LightGoldenrod3" :underline t))
'(jabber-roster-user-away (:foreground "peru" :slant italic :weight normal))
'(jabber-roster-user-online (:foreground "dark orange" :slant normal :weight bold))
(setq jabber-roster-line-format "%c %-25n %u %-8s  %S")

(setq jabber-account-list '(
                            ("keelerm84@gmail.com"
							 (:password . nil)
							 (:network-server . "talk.google.com")
							 (:port . 443)
							 (:connection-type . ssl))
                            ))

(provide 'setup-jabber)
