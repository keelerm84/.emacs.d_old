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

;; el-get setup
(add-to-list 'load-path (expand-file-name "el-get/el-get/" dotfiles-dir))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get 'sync)

;; el-get installations
(el-get-install 'wanderlust)
(el-get-install 'bbdb)
(el-get-install 'yaml-mode)
(el-get-install 'yasnippet)
(el-get-install 'cmake-mode)
(el-get-install 'markdown-mode)
(el-get-install 'js2-mode)

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
   (cons 'sql-indent marmalade)
   (cons 'emms melpa)
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
(eval-after-load "sql" (load-library "sql-indent"))
(eval-after-load 'org '(require 'setup-org-mode))
(eval-after-load 'hs-minor-mode '(require 'setup-hs-mode))
(eval-after-load 'js2-mode '(require 'setup-js2-mode))

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
(require 'eproject)
(require 'eproject-extras)
(require 'ecb)
(require 'magit)
(require 'sql)
(require 'setup-yasnippet)
(autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick move minor mode" t)
(autoload 'ace-jump-pop-mark "ace-jump-mode"  "Ace jump back" t)
(define-globalized-minor-mode global-hs-minor-mode
  hs-minor-mode hs-minor-mode)

(global-hs-minor-mode 1)

(setq inferior-lisp-program "/usr/bin/sbcl")
(require 'slime)
(slime-setup '(slime-fancy slime-js))

(autoload 'slime-js-jack-in-browser "setup-slime-js" nil t)
(autoload 'slime-js-jack-in-node "setup-slime-js" nil t)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" dotfiles-dir))
(if (file-exists-p custom-file)
    (load custom-file))

(setq user-mail-address "keelerm84@gmail.com")

(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
