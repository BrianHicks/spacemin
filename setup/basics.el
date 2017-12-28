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
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package smartparens
  :delight
  :init
  (require 'smartparens-config)
  (smartparens-global-mode 1))

;; which-key helps me remember random keybindings and rediscover
;; things I had lost.
(use-package which-key
  :delight
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

;; highlight the current line
(hl-line-mode 1)

;; add shackle, with which we will define a bunch of custom rules for popup buffers.
(use-package shackle
  :init
  (shackle-mode 1)

  :config
  (setq shackle-rules '(("\\`*helm.*?\\*\\'" :regexp t :align t :size 0.4)
			(neotree-mode        :align left))))

;; emojify things like :smile: and :wave:
(use-package emojify
  :bind-leader
  ("i" '(:ignore t :which-key "inserting")
   "ie" 'emojify-insert-emoji)

  :init
  ;; TODO: these mess up the line height. I'd like them a little smaller, please!
  (add-hook 'after-init-hook #'global-emojify-mode))

;; hydra lets us make nice little GUIs for common tasks like file navigation
(use-package hydra)

;; hide some minor modes
(delight 'auto-revert-mode nil "autorevert")
(delight 'undo-tree-mode nil "undo-tree")

;; _ should be a word character
(modify-syntax-entry ?_ "w")

(provide 'basics)

;;; basics.el ends here
