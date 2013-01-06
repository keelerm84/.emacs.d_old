(require 'dired-details)
(setq-default dired-details-hidden-string "--- ")
(dired-details-install)

(eval-after-load "dired-aux"
   '(add-to-list 'dired-compress-file-suffixes
                 '("\\.zip\\'" ".zip" "unzip")))

(provide 'setup-dired)
