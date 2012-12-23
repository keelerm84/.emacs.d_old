(defun file-path-to-namespace ()
  (interactive)
  (let (
        (root (find-project-root))
        (base (file-name-nondirectory buffer-file-name))
        )
    (substring (replace-regexp-in-string "/" "\\" (substring buffer-file-name (length root) (* -1 (length base))) t t) 0 -1)
    )
  )
