;;; project-nav --- project drawer

;;; Commentary:

;;; Code:

; dired
; TODO: how to use use-package here?

(general-nmap "-" 'dired-jump)

(general-nmap :prefix "<SPC>"
              "ff" 'dired-jump-other-window)

(general-nmap :keymaps 'dired-mode-map
              ;; overrides
              ";" 'evil-ex
              ;; "e" 'epa-encrypt-file
              )

(general-nmap :keymaps 'dired-mode-map
              :prefix ","
              "e" '(:ignore t :wk "encryption")
              "ed" 'epa-dired-do-decrypt
              "ee" 'epa-dired-do-encrypt
              "es" 'epa-dired-do-sign
              "ev" 'epa-dired-do-verify)

(provide 'project-nav)

;;; project-nav.el ends here


; TODO: go through the rest of these and explicitly map or drop them, then turn
; off the automatic clobbering of : and friends that evil does.
;; +               dired-create-directory
;; .               dired-clean-directory
;; <               dired-prev-dirline
;; =               dired-diff
;; >               dired-next-dirline
;; ?               dired-summary
;; A               dired-do-find-regexp
;; B               dired-do-byte-compile
;; C               dired-do-copy
;; D               dired-do-delete
;; F               dired-do-find-marked-files
;; G               dired-do-chgrp
;; H               dired-do-hardlink
;; I               dired-info
;; L               dired-do-load
;; M               dired-do-chmod
;; N               dired-man
;; O               dired-do-chown
;; P               dired-do-print
;; Q               dired-do-find-regexp-and-replace
;; R               dired-do-rename
;; S               dired-do-symlink
;; T               dired-do-touch
;; U               dired-unmark-all-marks
;; V               dired-do-run-mail
;; X               dired-do-shell-command
;; Y               dired-do-relsymlink
;; Z               dired-do-compress
;; ^               dired-up-directory
;; a               dired-find-alternate-file
;; c               dired-do-compress-to
;; d               dired-flag-file-deletion
;; i               dired-maybe-insert-subdir
;; m               dired-mark
;; n               dired-next-line
;; o               dired-find-file-other-window
;; p               dired-previous-line
;; q               quit-window
;; s               dired-sort-toggle-or-edit
;; t               dired-toggle-marks
;; u               dired-unmark
;; v               dired-view-file
;; w               dired-copy-filename-as-kill
;; x               dired-do-flagged-delete
;; y               dired-show-file-type
;; ~               dired-flag-backup-files
;; DEL             dired-unmark-backward
;; S-SPC           dired-previous-line
;; <follow-link>   mouse-face
;; <mouse-2>       dired-mouse-find-file-other-window
;; <normal-state>  Prefix Command
;; <override-state>                normal
;; <remap>         Prefix Command
;;
;; C-t C-t         image-dired-dired-toggle-marked-thumbs
;; C-t .           image-dired-display-thumb
;; C-t a           image-dired-display-thumbs-append
;; C-t c           image-dired-dired-comment-files
;; C-t d           image-dired-display-thumbs
;; C-t e           image-dired-dired-edit-comment-and-tags
;; C-t f           image-dired-mark-tagged-files
;; C-t i           image-dired-dired-display-image
;; C-t j           image-dired-jump-thumbnail-buffer
;; C-t r           image-dired-delete-tag
;; C-t t           image-dired-tag-files
;; C-t x           image-dired-dired-display-external
;;
;; C-x ESC         Prefix Command
;;
;; C-M-d           dired-tree-down
;; C-M-n           dired-next-subdir
;; C-M-p           dired-prev-subdir
;; C-M-u           dired-tree-up
;; M-!             dired-smart-shell-command
;; M-$             dired-hide-all
;; M-(             dired-mark-sexp
;; M-G             dired-goto-subdir
;; M-s             Prefix Command
;; M-{             dired-prev-marked-file
;; M-}             dired-next-marked-file
;; M-DEL           dired-unmark-all-files
;;
;; M-s a           Prefix Command
;; M-s f           Prefix Command
;;
;; * C-n           dired-next-marked-file
;; * C-p           dired-prev-marked-file
;; * !             dired-unmark-all-marks
;; * %             dired-mark-files-regexp
;; * (             dired-mark-sexp
;; * *             dired-mark-executables
;; * .             dired-mark-extension
;; * /             dired-mark-directories
;; * ?             dired-unmark-all-files
;; * @             dired-mark-symlinks
;; * O             dired-mark-omitted
;; * c             dired-change-marks
;; * m             dired-mark
;; * s             dired-mark-subdir-files
;; * t             dired-toggle-marks
;; * u             dired-unmark
;; * DEL           dired-unmark-backward
;;
;; <normal-state> -                dired-jump
;; <normal-state> :                evil-repeat-find-char
;; <normal-state> ;                Prefix Command
;; <normal-state> J                dired-goto-file
;; <normal-state> K                dired-do-kill-lines
;; <normal-state> h                evil-backward-char
;; <normal-state> j                evil-next-line
;; <normal-state> k                evil-previous-line
;; <normal-state> l                evil-forward-char
;; <normal-state> r                dired-do-redisplay
;;
;; <remap> <advertised-undo>       dired-undo
;; <remap> <next-line>             dired-next-line
;; <remap> <previous-line>         dired-previous-line
;; <remap> <read-only-mode>        dired-toggle-read-only
;; <remap> <toggle-read-only>      dired-toggle-read-only
;; <remap> <undo>                  dired-undo
;;
;; C-x M-o         dired-omit-mode
;;
;; M-s f C-s       dired-isearch-filenames
;; M-s f ESC       Prefix Command
;;
;; M-s a C-s       dired-do-isearch
;; M-s a ESC       Prefix Command
;;
;; <normal-state> ; d              epa-dired-do-decrypt
;; <normal-state> ; e              epa-dired-do-encrypt
;; <normal-state> ; s              epa-dired-do-sign
;; <normal-state> ; v              epa-dired-do-verify
;;
;; M-s f C-M-s     dired-isearch-filenames-regexp
;;
;; M-s a C-M-s     dired-do-isearch-regexp
