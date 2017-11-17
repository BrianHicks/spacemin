;;; jumping --- move around the screen efficiently

;;; Commentary:
;;; This will probably end up being a bunch of keys across packages
;;; all in one place.  It should probably be towards the end of the
;;; load list.

;;; Code:

(use-package avy
  :config
  (evil-leader/set-key
    "j" 'avy-goto-word-1))

(use-package ace-window
  :config
  (evil-leader/set-key
    "J" 'ace-window))

;;; jumping.el ends here