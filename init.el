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
  )

;; TODO: vim keybindings like fd for escaping
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
