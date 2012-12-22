(defun find-git-repo (dir)
  (if (string= "/" dir)
      nil
    (if (file-exists-p (expand-file-name ".git/" dir))
        dir
      (find-git-repo (expand-file-name "../" dir)))))

(defun set-fuzzy-project-root ()
  (interactive)
  (if (buffer-file-name)
      (fuzzy-find-project-root (find-project-root))))

(defun find-project-root ()
  (interactive)
  (if (ignore-errors (eproject-root))
      (eproject-root)
    (or (find-git-repo (buffer-file-name)) (file-name-directory (buffer-file-name)))))

(provide 'file-defuns)
