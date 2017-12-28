;;; init.el --- user init file -*- no-byte-compile: t -*-

;;; Commentary:
;;; Bootstrap everything.  As little as possible should live here.

;;; Code:

;; enable package.  This wasn't required before, I'm not sure what changed! :(
(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)

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

;; integrate with use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; use-package dependencies
(straight-use-package 'delight)

;;;; bootstrapping done! ;;;;

(defvar emacs-d
  (file-name-directory (file-chase-links load-file-name))
  "Our .emacs.d location.")

;; wrap use-package to load local packages
(defmacro local (from name &rest body)
  `(use-package ,name
     :straight nil
     :load-path ,from
     ,@body))

;; base packages. These set up the basic editor functionality I expect.
(local "setup" keys) ;; needs to be first to register :bind-prefix and :bind-prefix-local
(local "setup" vim) ;; needs to be second to register evil state maps

(local "setup" basics)
(local "setup" git)
(local "setup" projects)

;; language packages
