;; Main load point for all emacs customizations
;; Heavily inspired by magnars .emacs.d repo @ https://github.com/magnars/.emacs.d
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

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

(require 'setup-auto-complete)
(require 'setup-cedet)

;; Write backup files to own directory
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))

(require 'server)
(unless (server-running-p)
  (server-start))

(require 'setup-package)
(defun init--install-packages()
  (packages-install
   (cons 'magit melpa)
   (cons 'color-theme melpa)
   (cons 'jabber marmalade)
   (cons 'ido-ubiquitous marmalade)
   (cons 'smex marmalade)
   (cons 'geben marmalade)
   (cons 'php-mode marmalade)
   ))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Load extensions
(eval-after-load 'magit '(require 'setup-magit))
(eval-after-load 'jabber '(require 'setup-jabber))
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'android-mode '(require 'setup-android))
(eval-after-load 'ecb '(require 'setup-ecb))
(eval-after-load 'twittering-mode '(require 'setup-twitter))
(eval-after-load 'php-mode '(require 'setup-php))
(eval-after-load 'cc-mode '(require 'setup-c++))
(eval-after-load "ace-jump-mode" '(require 'setup-ace-jump))

(require 'mode-mappings)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" dotfiles-dir))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(require 'smex)
(smex-initialize)

(require 'ido)
(require 'appearance)
(require 'key-bindings)
(require 'change-inner)
(require 'mark-multiple)
(require 'expand-region)
(require 'mark-more-like-this)
(require 'inline-string-rectangle)
(require 'multiple-cursors)
(require 'fuzzy-find-in-project)
(require 'twittering-mode)
(require 'android-mode)
(require 'my-misc)
(require 'geben)
(require 'eproject)
(require 'eproject-extras)
(require 'ecb)
(require 'magit)
(autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick move minor mode" t)
(autoload 'ace-jump-pop-mark "ace-jump-mode"  "Ace jump back" t)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" dotfiles-dir))
(if (file-exists-p custom-file)
    (load custom-file))
