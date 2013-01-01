(delete-selection-mode t)
(setq blink-matching-paren t)

(fset 'yes-or-no-p 'y-or-n-p)

(set-default 'indent-tabs-mode nil)


(eval-after-load "dired-aux"
   '(add-to-list 'dired-compress-file-suffixes
                 '("\\.zip\\'" ".zip" "unzip")))

(provide 'my-misc)
