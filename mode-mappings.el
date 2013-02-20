(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-agenda-files '("~/Documents/Dropbox/OrgFiles"))

(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(add-to-list 'auto-mode-alist '("\\.sql\\'" . sql-mode))

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))


(provide 'mode-mappings)
