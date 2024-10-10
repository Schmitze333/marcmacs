;;;; Shell Stuff ;;;;

(use-package with-editor)

(use-package vterm
  :after with-editor
  :defer t
  :bind (:map vterm-mode-map
	      ;; Unset the keys I want to forward to emacs
	      ("M-0". nil)
	      ("M-1". nil)
	      ("M-2". nil)
	      ("M-3". nil)
	      ("M-4". nil)
	      ("M-g". nil)
	      ("M-c" . vterm-copy-mode))
  :config
  ;; this function is from http://xahlee.info/emacs/emacs/elisp_read_file_content.html
  (defun read-lines-from-files (filePath)
    "Return a list of lines of a file at filePath."
    (with-temp-buffer
      (insert-file-contents filePath)
      (split-string (buffer-string) "\n" t)))

  (defun vterm-history (histfile)
    (vterm-send-string (completing-read "Commands: " (read-lines-from-files histfile)) t))

  (defun vterm-history-zsh ()
    (interactive)
    (vterm-history "~/.config/zsh/.histfile"))

  (define-key vterm-mode-map (kbd "M-g h") 'vterm-history-zsh)
  (add-hook 'vterm-mode-hook 'with-editor-export-editor))

(use-package eshell
  :after with-editor
  :init
  (add-hook 'eshell-mode-hook 'with-editor-export-editor)
  (add-hook 'eshell-mode-hook
	    (lambda ()
	      (setenv "TERM" "xterm-256color")
	      (turn-on-comint-history (getenv "HISTFILE"))))
  :custom
  (defun eshell-colorize-diff-lines (line)
    (cond ((s-starts-with? "+") (propertize line 'font-lock-face '(:foreground "forest green")))
	  ((s-starts-with? "-") (propertize line 'font-lock-face '(:foreground "red")))
	  (t line)))
  (defun eshell-handle-ansi-color ()
    (ansi-color-apply-on-region eshell-last-output-start eshell-last-output-end))

  (add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)
  (add-to-list 'eshell-output-filter-functions 'eshell-colorize-diff-lines)
  (eshell-scroll-show-maximum-output nil))

(use-package eshell-git-prompt
  :after eshell
  :config
  (eshell-git-prompt-use-theme 'powerline))

(use-package eshell-syntax-highlighting
  :after eshell-mode
  :ensure t
  :config
  (eshell-syntax-highlighting-global-mode t))

;; Ansi-colors in terminal
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point)))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; Shell improvements ;;

;; Get BIG history
(set-variable 'comint-input-ring-size 5000)

(defun turn-on-comint-history (history-file)
  (setq comint-input-ring-size 10000)
  (setq comint-input-ring-file-name history-file)
  (comint-read-input-ring 'silent))

(add-hook 'inf-ruby-mode-hook
          (lambda ()
            (turn-on-comint-history "~/.irb_history")))

(add-hook 'shell-mode-hook
          (lambda ()
            (turn-on-comint-history (getenv "HISTFILE"))
	    (setq comint-scroll-show-maximum-output nil)))
(add-hook 'shell-mode-hook (lambda () (goto-address-mode)))
(add-hook 'shell-mode-hook #'compilation-shell-minor-mode)
(add-hook 'shell-mode-hook #'with-editor-export-editor)
(setq history-delete-duplicates t)

;;; Source .zshrc also for asynchronous shell commands
(setq shell-command-switch "-ic")
