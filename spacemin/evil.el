;; vim has nice keybindings, emacs has nice other things, so let's use both.
(use-package evil
  :config
  (evil-mode 1)
  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd ":") 'evil-repeat-find-char)
    (define-key evil-motion-state-map (kbd ";") 'evil-ex)))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

;; TODO: this may be in the wrong place and will not get scratch and messages.
(use-package evil-leader
  :init
  (setq evil-leader/leader "<SPC>")

  :config
  (global-evil-leader-mode 1)

  (evil-leader/set-key
    ;; *b*uffers
    "bn" 'evil-next-buffer
    "bp" 'evil-prev-buffer

    ;; *c*ompilation
    "cc" 'compile
    "cr" 'recompile
    "cd" 'popwin:close-popup-window

    ;; *f*iles
    "fs" 'save-buffer

    ;; *w*indowing
    "wh" 'evil-window-left
    "wj" 'evil-window-down
    "wk" 'evil-window-up
    "wl" 'evil-window-right
    "wv" 'evil-window-vsplit
    "ws" 'evil-window-split)
  )

(use-package evil-commentary
  :config (evil-commentary-mode 1))

(use-package evil-matchit
  :config (global-evil-matchit-mode 1))

(use-package evil-exchange
  :config (evil-exchange-install))

(use-package evil-visualstar
  :config (global-evil-visualstar-mode 1))

(use-package evil-escape
  :config
  (evil-escape-mode 1)
  (setq-default evil-escape-key-sequence "fd"))

;;; evil.el ends here
