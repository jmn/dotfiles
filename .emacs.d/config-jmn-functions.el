;; jmn custom emacs functions

(defun jmn/insert-scratch-buffer ()
  (interactive)
  "Yanks the contents of the scratch buffer into the position of the cursor."
  (condition-case err
      (insert-buffer "*scratch*")
    (wrong-type-argument
     (message "No scratch buffer was found. %s" (error-message-string err))
     ))
  )

(defun jmn/url-get-title (url &optional descr)
  "Takes a URL and returns the value of the <title> HTML tag,
   Thanks to https://frozenlock.org/tag/url-retrieve/ for documenting url-retrieve"
  (let ((buffer (url-retrieve-synchronously url))
        (title nil))
    (save-excursion
      (set-buffer buffer)
      (goto-char (point-min))
      (search-forward-regexp "<title>\\([^<]+?\\)</title>")	
      (setq title (match-string 1 ) )
      (kill-buffer (current-buffer)))
    title))
