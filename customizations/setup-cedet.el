(require 'auto-complete)
(load-file (expand-file-name (concat site-lisp-dir  "/cedet-1.1/common/cedet.el")))

(global-ede-mode 1)
(global-semantic-tag-folding-mode 1)

(semantic-load-enable-gaudy-code-helpers)
(global-srecode-minor-mode 1)
(setq semantic-tag-boundary-p nil)

(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)

;; customisation of modes
(defun keelerm/cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key (kbd "C-c ?") 'semantic-ia-complete-symbol)

  (local-set-key (kbd "C-c >") 'semantic-complete-analyze-inline)
  (local-set-key (kbd "C-c =") 'semantic-decoration-include-visit)

  (local-set-key (kbd "C-c f") 'semantic-ia-fast-jump)
  (local-set-key (kbd "C-c q") 'semantic-ia-show-doc)
  (local-set-key (kbd "C-c s") 'semantic-ia-show-summary)
  (local-set-key (kbd "C-c .") 'semantic-analyze-proto-impl-toggle)
  (local-set-key (kbd "C-c <left>") 'semantic-tag-folding-fold-block)
  (local-set-key (kbd "C-c <right>") 'semantic-tag-folding-show-block)

  (add-to-list 'ac-sources 'ac-source-semantic)
  )

(add-hook 'c-mode-common-hook 'keelerm/cedet-hook)
(add-hook 'lisp-mode-hook 'keelerm/cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'keelerm/cedet-hook)

(defun keelerm/c-mode-cedet-hook ()
  (local-set-key (kbd "C-c t") 'eassist-switch-h-cpp)
  (local-set-key (kbd "C-c e") 'eassist-list-methods)
  (local-set-key (kbd "C-c C-r") 'semantic-symref)

  (setq ac-sources '(ac-source-semantic-raw))
  )
(add-hook 'c-mode-common-hook 'keelerm/c-mode-cedet-hook)

(provide 'setup-cedet)
