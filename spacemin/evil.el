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

  ;; evil defines a `\` key for escaping to emacs keys, so the
  ;; universal argument is now `\C-u`.
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)

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

;; toggle comments
;; cmd-/ on a line or block
(use-package evil-commentary
  :config (evil-commentary-mode 1))

;; add a bunch more matching pairs like `<div></div>'
;; https://github.com/redguardtoo/evil-matchit
(use-package evil-matchit
  :config (global-evil-matchit-mode 1))

;; swap pairs of regions. `gx' to start, `gX' to cancel.
;; https://github.com/Dewdrops/evil-exchange
(use-package evil-exchange
  :config (evil-exchange-install))

;; start a search from `*' or the visual selection
;; https://github.com/bling/evil-visualstar
(use-package evil-visualstar
  :config (global-evil-visualstar-mode 1))

;; use a key sequence instead of `ESC'
;; https://github.com/syl20bnr/evil-escape
(use-package evil-escape
  :config
  (evil-escape-mode 1)
  (setq-default evil-escape-key-sequence "fd"))

;;; evil.el ends here
