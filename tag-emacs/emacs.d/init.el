(set-language-environment "utf-8")
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(load "~/.emacs.d/epipe.el")
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq server-socket-dir (format "/tmp/emacs%d" (user-uid)))
(server-start)		; Normal emacs server
