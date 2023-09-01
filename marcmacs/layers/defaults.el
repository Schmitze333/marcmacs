;;; Setting some defaults in Emacs ;;;;

(setq inhibit-startup-message t)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Get rid of visual distractions
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; No sound, no flash
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; Do not make backups or lock files
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq create-lockfiles nil)

;; Confirm with y only
(fset 'yes-or-no-p 'y-or-n-p)

;; Enable ALL commands
(setq disabled-command-function nil)

;; Process communication optimization
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; Exec-path-from-shell
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "HISTFILE"))

;; For non-(m)elpa packages we need quelpa and quelpa-use-package
(use-package quelpa)
(use-package quelpa-use-package)

;; EWW
(setq eww-search-prefix "https://duckduckgo.com/?q=")
