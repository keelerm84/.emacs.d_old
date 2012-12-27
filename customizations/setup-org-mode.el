(setq org-todo-keywords
      '((sequence "TODO" "WAITING" "STARTED" "|" "DONE" "DELEGATED")))

(setq org-todo-keyword-faces
      (quote (
              ("TODO" :foreground "gold" :weight bold)
              ("WAITING" :foreground "chocolate" :weight bold)
              ("STARTED" :foreground "yellow green" :weight bold)
              ("DELEGATED" :foreground "PaleVioletRed3" :weight bold)
              ("DONE" :foreground "gray" :weight bold)
              )))

(setq org-log-done 'time)

(provide 'setup-org-mode)
