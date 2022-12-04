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
