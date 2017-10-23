;; bootstrap straight.el
(let ((bootstrap-file (concat user-emacs-directory "straight/bootstrap.el"))
      (bootstrap-version 2))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq use-package-always-ensure t)

;; set up some basic things (load paths, etc.) that we will use later.
(defvar emacs-d
  (file-name-directory (file-chase-links load-file-name))
  "Our .emacs.d location")

(add-to-list 'load-path (expand-file-name "spacemin" emacs-d))

;; load each of the configuration modules independently. "Wait", you
;; may ask, "why is this specified manually instead of by looking at
;; the files locally?" Well, there are some dependencies (like
;; multiple things depending on `evil-leader/set-key`) that an
;; automatic solution couldn't handle unless it was reasonably
;; smart. I'm too lazy to write a proper graph walk right now, and
;; there are not many, so manual it is.
(load "basics")
(load "evil") ;; prerequisite for anything that uses leader keys
(load "git")

;; emacs auto-generated nonsense

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-escape evil-visualstar evil-exchange evil-matchit use-package-chords pallet exec-path-from-shell evil-visual-mark-mode evil-surround evil-nerd-commenter evil-leader evil-commentary))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
