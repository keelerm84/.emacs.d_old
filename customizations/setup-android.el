(setq android-mode-sdk-dir "/opt/local/android-sdk-linux/")

(add-hook 'gud-mode-hook
          (lambda ()
			(dolist (jar (file-expand-wildcards (concatenate android-mode-sdk-dir "platforms/android-*/*jar")))
			  (add-to-list 'gud-jdb-classpath jar))))

(provide 'setup-android)
