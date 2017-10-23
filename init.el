;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; first we're gonna get cask and pallet set up correctly following the instructions at http://www.lambdacat.com/modern-emacs-package-management-with-cask-and-pallet/
;;
;;I've installed cask with homebrew, so it's in a weird location under /usr/local.
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

;; use-package!
(require 'use-package)
