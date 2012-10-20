;; Main load point for all emacs customizations
;; Heavily inspired by magnars .emacs.d repo @ https://github.com/magnars/.emacs.d

;; Set path to .emacs.d directory
(setq dotfiles-dir (file-name-directory
		    (or (buffer-file-name) load-file-name)))

;; vendor packages are loaded in site-lisp
(setq site-lisp-dir (expand-file-name "site-lisp" dotfiles-dir))

(setq customizations (expand-file-name "customizations" dotfiles-dir))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path site-lisp-dir)
(add-to-list 'load-path customizations)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" dotfiles-dir))
(load custom-file)

;; Write backup files to own directory
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))

(require 'server)
(unless (server-running-p)
  (server-start))

(require 'setup-package)

(packages-install
 (cons 'magit melpa)
 (cons 'color-theme melpa)
 (cons 'jabber marmalade)
 (cons 'ecb marmalade)
 (cons 'ido-ubiquitous marmalade)
 (cons 'smex marmalade)
)

;; Load extensions
(eval-after-load 'magit '(require 'setup-magit))
(eval-after-load 'jabber '(require 'setup-jabber))
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'android-mode '(require 'setup-android))
(eval-after-load 'ecb '(require 'setup-ecb))
(eval-after-load 'twittering-mode '(require 'setup-twitter))

(require 'smex)
(smex-initialize)

(require 'ido)
(require 'appearance)
(require 'key-bindings)
(require 'change-inner)
(require 'mark-multiple)
(require 'expand-region)
(require 'fuzzy-find-in-project)
(require 'twittering-mode)
(require 'android-mode)
(require 'my-misc)
