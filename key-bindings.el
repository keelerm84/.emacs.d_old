(global-set-key (kbd "C-c b") 'create-scratch-buffer)

;; emms controls
(require 'emms-setup)
(emms-standard)
(emms-default-players)

(global-set-key (kbd "<f5>") 'emms-shuffle)
(global-set-key (kbd "<f6>") 'emms-pause)
(global-set-key (kbd "<f7>") 'emms-previous)
(global-set-key (kbd "<f8>") 'emms-next)
(global-set-key (kbd "<f9>") 'emms-volume-lower)
(global-set-key (kbd "<f10>") 'emms-volume-raise)

;; Hide / Show
(global-set-key (kbd "M-<left>") 'hs-hide-block)
(global-set-key (kbd "M-<right>") 'hs-show-block)
(global-set-key (kbd "M-S-<left>") 'hs-hide-all)
(global-set-key (kbd "M-S-<right>") 'hs-show-all)

;; Window controls
(global-set-key (kbd "C-c h") 'windmove-left)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c k") 'windmove-up)
(global-set-key (kbd "C-c l") 'windmove-right)

(global-set-key (kbd "C-<kp-add>") 'enlarge-window)
(global-set-key (kbd "C-<kp-subtract>") 'shrink-window)

;; Expand region
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "M-n") 'next-line)
(global-set-key (kbd "M-p") 'previous-line)

;; Project Management
(global-set-key (kbd "C-c p") 'fuzzy-find-in-project)
(global-set-key (kbd "C-c C-p") 'set-fuzzy-project-root)

;; Text manipulation
(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR.")
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "M-Z") 'zap-to-char)

(global-set-key (kbd "M-i") 'change-inner)
(global-set-key (kbd "M-o") 'change-outer)

(global-set-key (kbd "C-x r t") 'inline-string-rectangle)

(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-*") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C-c d") 'duplicate-line)

;; Modes and more
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-;") 'magit-status)
(global-set-key (kbd "C-x e") 'eshell)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Slime-JS
(global-set-key [f12] 'slime-js-reload)
(add-hook 'js2-mode-hook
          (lambda ()
            (slime-js-minor-mode 1)))

(add-hook 'css-mode-hook
          (lambda ()
            (define-key css-mode-map "\M-\C-x" 'slime-js-refresh-css)
            (define-key css-mode-map "\C-c\C-r" 'slime-js-embed-css)))


;; eproject global bindings
(defmacro .emacs-curry (function &rest args)
  `(lambda () (interactive)
     (,function ,@args)))

(defmacro .emacs-eproject-key (key command)
  (cons 'progn
        (loop for (k . p) in (list (cons key 4) (cons (upcase key) 1))
              collect
              `(global-set-key
                (kbd ,(format "C-x p %s" k))
                (.emacs-curry ,command ,p)))))

(.emacs-eproject-key "k" eproject-kill-project-buffers)
(.emacs-eproject-key "v" eproject-revisit-project)
(.emacs-eproject-key "b" eproject-ibuffer)
(.emacs-eproject-key "o" eproject-open-all-project-files)

(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

(define-key global-map (kbd "C-c c") 'org-capture)

(provide 'key-bindings)
