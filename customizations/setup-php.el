(add-hook 'php-mode-hook
		  (lambda()
			  (setq c-basic-offset 4)
			  (setq indent-tabs-mode nil)
			  (setq show-trailing-whitespace t)
			  (add-hook 'before-save-hook 'delete-trailing-whitespace)
			  (c-set-offset 'case-label '+)
			  (c-set-offset 'arglist-close 0)
			  (c-set-offset 'arglist-intro '+) ; for FAPI arrays and DBTNG
			  (c-set-offset 'arglist-cont-nonempty 'c-lineup-math) ; for DBTNG fields and values
))

(provide 'setup-php)
