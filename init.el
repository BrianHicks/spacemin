;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; first we're gonna get cask and pallet set up correctly following
;; the instructions at http://www.lambdacat.com/modern-emacs-package-management-with-cask-and-pallet/
;;
;;I've installed cask with homebrew, so it's in a weird location under /usr/local.
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

;; use-package! At this point, our bootstrapping is done and we can
;; use pallet+use-package to initialize everything else.
(require 'use-package)

;; time for some general philosophizing: I really like Spacemacs'
;; approach to keybindings. Put everything under `SPC`, and all the
;; mode-local bindings under `,` (or `SPC m`.) I'm gonna steal all the
;; ones I need as I need them. If I can get them working in which-key,
;; so much the better!

(use-package evil
  :ensure t
  :config (evil-mode 1)

  (use-package evil-surround
    :ensure t
    :config (global-evil-surround-mode 1))

  ;; TODO: this may be in the wrong place and will not get scratch and messages.
  (use-package evil-leader
    :ensure t
    :config (progn
	      (global-evil-leader-mode 1)
	      (evil-leader/set-leader "<SPC>")))

  (use-package evil-commentary
    :ensure t
    :config (evil-commentary-mode 1))

  (use-package evil-matchit
    :ensure t
    :config (global-evil-matchit-mode 1))

  (use-package evil-exchange
    :ensure t
    :config (evil-exchange-install))

  (use-package evil-visualstar
    :ensure t
    :config (global-evil-visualstar-mode 1))
  )

;; TODO: vim keybindings like fd for escaping and ; instead of :
;; TODO: magit
;; TODO: projectile and perspectives
;; TODO: ivy or smex or something
;; TODO: which-key
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
    (evil-visualstar evil-exchange evil-matchit use-package-chords pallet exec-path-from-shell evil-visual-mark-mode evil-surround evil-nerd-commenter evil-leader evil-commentary))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
