;;; display --- how things look

;;; Commentary:
;;; This ends up kind of a grab bag of things.  That's probably
;;; alright.

;;; Code:

;; turn off scroll bars (it's in modeline)
(scroll-bar-mode -1)

;; turn off the tool bar (which-key works fine and I've been vimming
;; for long enough that I never use it.)
(tool-bar-mode -1)

;; themes!
(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)

  (doom-themes-visual-bell-config)

  (doom-themes-org-config)

  (add-to-list 'custom-safe-themes "9f569b5e066dd6ca90b3578ff46659bc09a8764e81adf6265626d7dc0fac2a64")
  (load-theme 'doom-one)

  (set-face-attribute 'font-lock-comment-face nil :foreground "#828B92")

  ;; TODO: theme switcher

  (use-package solaire-mode
    :config
    (add-hook 'after-change-major-mode-hook #'turn-on-solaire-mode)
    (add-hook 'after-revert-hook #'turn-on-solaire-mode)
    (add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)

    (solaire-mode-swap-bg)))

;; pretty modeline
(use-package telephone-line
  :config
  (setq telephone-line-primary-left-separator 'telephone-line-flat
        telephone-line-secondary-left-separator 'telephone-line-flat
        telephone-line-primary-right-separator 'telephone-line-flat
        telephone-line-seconary-right-separator 'telephone-line-flat

	telephone-line-height 30

	;; TODO: make nice small names for all the minor modes, or diminish/delight them
	;; TODO: remove Git: or Git- from the branch name

	;; TODO:
	;; NORMAL | project (git-branch) | filename --- minors | major | position

	telephone-line-lhs '((evil   . (telephone-line-evil-tag-segment))
			     (accent . (telephone-line-vc-segment))
			     (nil    . (telephone-line-minor-mode-segment
					telephone-line-buffer-segment)))

	telephone-line-rhs '((nil    . (telephone-line-misc-info-segment))
			     (accent . (telephone-line-major-mode-segment))
			     (evil   . (telephone-line-airline-position-segment))))

  (telephone-line-mode 1))

;; fonts and ligatures
(when (window-system)
  (set-frame-font "Fira Code")
  (set-face-attribute 'default nil :height 130))

;; highlight todos in code.  This package should support:
;;
;; - HOLD
;; - TODO
;; - NEXT
;; - THEM
;; - PROG
;; - OKAY
;; - DONT
;; - FAIL
;; - DONE
;; - NOTE
;; - KLUDGE
;; - HACK
;; - FIXME
;; - XXX
;; - XXXX
;; - ???
(use-package hl-todo
  :config
  (global-hl-todo-mode))


;;; display.el ends here
