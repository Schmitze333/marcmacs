;;;; Shell Stuff ;;;;

(use-package with-editor)

(use-package vterm
  :after with-editor
  :defer t
  :init
  (add-hook 'vterm-mode-hook 'with-editor-export-editor))

(use-package eshell
  :after with-editor
  :init
  (add-hook 'eshell-mode-hook 'with-editor-export-editor)
  :custom
  (eshell-scroll-show-maximum-output nil))

(use-package eshell-git-prompt
  :after eshell
  :config
  (eshell-git-prompt-use-theme 'powerline))

;; Ansi-colors in terminal
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point)))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; Shell improvements ;;
(defun turn-on-comint-history (history-file)
  (setq comint-input-ring-size 10000)
  (setq comint-input-ring-file-name history-file)
  (comint-read-input-ring 'silent))

(add-hook 'inf-ruby-mode-hook
          (lambda ()
            (turn-on-comint-history "~/.irb_history")))

(add-hook 'shell-mode-hook
          (lambda ()
            (turn-on-comint-history (getenv "HISTFILE"))))
(add-hook 'shell-mode-hook (lambda () (goto-address-mode)))
(add-hook 'shell-mode-hook #'compilation-shell-minor-mode)
(add-hook 'shell-mode-hook #'with-editor-export-editor)
(setq history-delete-duplicates t)

;;; Source .zshrc also for asynchronous shell commands
(setq shell-command-switch "-ic")
