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

;; time for some general philosophizing: I really like Spacemacs'
;; approach to keybindings. Put everything under `SPC`, and all the
;; mode-local bindings under `,` (or `SPC m`.) I'm gonna steal all the
;; ones I need as I need them. If I can get them working in which-key,
;; so much the better!

;; vim has nice keybindings, emacs has nice other things, so let's use both.
(use-package evil
  :config
  (evil-mode 1)
  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd ":") 'evil-repeat-find-char)
    (define-key evil-motion-state-map (kbd ";") 'evil-ex))

  (use-package evil-surround
    :config (global-evil-surround-mode 1))

  ;; TODO: this may be in the wrong place and will not get scratch and messages.
  (use-package evil-leader
    :config 
    (global-evil-leader-mode 1)
    (setq evil-leader/leader "<SPC>"))

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
  )

(use-package magit
  :config
  (evil-leader/set-key "gs" 'magit-status)
  (use-package evil-magit))

;; TODO: projectile and perspectives
;; TODO: ivy or smex or something
;; TODO: which-key
;; TODO: <SPC>fs
;; TODO: <SPC>1 through 9 for window jumps?
;; TODO: <SPC>w prefix
;; TODO: better fonts and themes. And a theme switcher would be super nice too.
;; TODO: all the evil plugins one could desire, especially evil-surround
;; TODO: nice bindings for making stuff with make
;; TODO: a shell, maybe? Probably not though.
;; TODO: hide the top bar, I don't really need it.
;; TODO: compile everything to byte code to avoid long startup times

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
