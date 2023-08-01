;;;; Git Stuff ;;;;

(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package forge)

(use-package git-gutter
  :config
  (global-git-gutter-mode t))
