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

(use-package general
  :init
  (general-evil-setup)
  :config
  (general-create-definer globalleader
			  :states '(normal visual)
			  :prefix "<SPC>")

  (general-create-definer localleader
			  :states '(normal visual)
			  :prefix ",")

  (globalleader
   "b" '(:ignore t :which-key "buffers")
   "bn" 'evil-next-buffer
   "bp" 'evil-prev-buffer

   "c" '(:ignore t :which-key "compilation")
   "cc" 'compile
   "cr" 'recompile

   "f" '(:ignore t :which-key "files")
   "fs" 'save-buffer

   "w" '(:ignore t :which-key "windows")
   "wh" 'evil-window-left
   "wj" 'evil-window-down
   "wk" 'evil-window-up
   "wl" 'evil-window-right
   "wv" 'evil-window-vsplit
   "ws" 'evil-window-split
   ))

;; toggle comments
;; cmd-/ on a line or block
(use-package evil-commentary
  :delight
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
  :delight ;; kinda cool that it puts the sequence in the modeline by default though.
  :config
  (evil-escape-mode 1)
  (setq-default evil-escape-key-sequence "fd"))

;;; evil.el ends here
