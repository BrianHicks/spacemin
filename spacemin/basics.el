;; basics --- the junk drawer, by another name

;;; Commentary:
;;; Very few controversial decisions here, hopefully.  Just stuff that
;;; makes Emacs better for me.  Experiments labelled as such.

;;; Code:

;; exec-path-from-shell looks for environment variables set in SHELL
;; and brings them into emacs. This stops having to set things like
;; PATH twice. It's useful for me in particular because git is set to
;; sign each commit with GPG, which is installed in a non-default
;; (homebrewed) path.
;;
;; we do this here instead of in a sub-file because
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package popwin
  :config
  (popwin-mode 1))

(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1))

;; this is a trial... I'm not sure how I like this.
(use-package idle-highlight-mode
  :config
  (idle-highlight-mode 1))

;; which-key helps me remember random keybindings and rediscover
;; things I had lost.
(use-package which-key
  :config
  (which-key-mode 1))

;; backup files somewhere outside of where project file watchers will
;; pick them up
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 20
      kept-old-version 5)

;; lock files are really not necessary for how I use emacs
(setq create-lockfiles nil)

;; code folding is handy!
;; TODO: should this go in a separate file?
(use-package origami
  :config
  (global-origami-mode t)

  (define-key evil-normal-state-map (kbd "TAB") 'origami-recursively-toggle-node))

;;; basics.el ends here
