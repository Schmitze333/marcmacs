;;;; Configure the Appearence of Emacs ;;;;

;;; Default Font
;; No window title bar
(add-to-list 'default-frame-alist
	     '(undecorated-round . t))

;; Source Code Pro-12
(add-to-list 'default-frame-alist
       '(font . "Menlo-12"))

(load-theme 'modus-operandi-tritanopia)

;; Show column number in modeline
(column-number-mode)

;; Highlight current line
(global-hl-line-mode 1)

;; Highlight line after jumps
;; stolen from: https://karthinks.com/software/batteries-included-with-emacs/
(defun pulse-line (&rest _)
      "Pulse the current line."
      (pulse-momentary-highlight-one-line (point)))

(dolist (command '(scroll-up-command
		   scroll-down-command
		   recenter-top-bottom
		   move-to-window-line-top-bottom
		   move-to-window-line
		   other-window))
  (advice-add command :after #'pulse-line))

;; ;; All-the-icons
(use-package all-the-icons)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package highlight-indentation
  :hook
  (yaml-mode . highlight-indentation-current-column-mode)
  :config
  (set-face-background 'highlight-indentation-face "#e3e3d3")
  (set-face-background 'highlight-indentation-current-column-face "#c3b3b3"))
