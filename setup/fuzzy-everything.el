;;; fuzzy-everything --- fuzzy find eveyrthing!

;;; Commentary:
;;; I tried counsel and it was OK...  I think I like Helm better, if I
;;; can get it working reliably!

;;; Code:

(use-package helm
  :delight
  :general
  (general-nvmap :prefix "SPC"
                 "<SPC>" 'helm-M-x

                 "bb" 'helm-mini

                 "y" '(:ignore t :wk "yanking")
                 "yp" 'helm-show-kill-ring)

  :config
  (helm-mode 1)

  (setq helm-M-x-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t
        helm-file-cache-fuzzy-match t
        helm-window-prefer-horizontal-split t
        helm-display-function 'pop-to-buffer))


(use-package helm-ag
  :after helm)

(provide 'fuzzy-everything)

;;; fuzzy-everything.el ends here
