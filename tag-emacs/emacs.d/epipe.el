;; epipe.el

(defun pager-read-pipe (fname)
  (let ((buf (generate-new-buffer "*pager*"))
        (pname (concat "pager-" fname)))
    (with-current-buffer buf (read-only-mode))
    (switch-to-buffer buf)

    (let ((proc (start-process pname buf "/bin/cat" fname)))
      (set-process-sentinel proc (lambda (proc e) ()))
      (set-process-filter proc (lambda (proc string)
                                 (when (buffer-live-p (process-buffer proc))
                                   (with-current-buffer (process-buffer proc)
                                     (save-excursion
                                       ;; Insert the text, advancing the process marker.
                                       (let ((inhibit-read-only t))
                                         (goto-char (process-mark proc))
                                         (insert string)
                                         (set-auto-mode)
                                         (set-marker (process-mark proc) (point))))))))
      proc)))

