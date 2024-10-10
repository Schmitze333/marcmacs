;;;; init.el --- My homegrown Emacs init file ;;;;

;;; Initialize package sources
(require 'package)
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
			 ("stable-melpa" . "https://stable.melpa.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;; Setup directories
(setq marcmacs--dir (expand-file-name "marcmacs" user-emacs-directory))
(setq marcmacs--layer-dir (expand-file-name "layers" marcmacs--dir))

;;; Do not clutter this file with custom set variables
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(setq marcmacs-layers '(
			"defaults"
			"macos"
			"emacs_tweaks"
			"appearence"
			"custom_function"
			"completion_framework"
			"control_n_feel"
			"devops"
			"shells"
			"projects"
			"git"
			"develop_foundation"
			"ruby"
			"front_end"
			"cpp"
			"go"
			"groovy"
			"python"
			"rust"
			"org"
			"dashboard"
			"elixir"
			"tools"
			"totp"
			"elfeed"
			"lilypond"
			"supercollider"
			"entertainment"
			))

(defun marcmacs--load-layer (layer-name)
  "Loads a MarcMacs layer"
  (message "Load layer %s" layer-name)
  (load (expand-file-name (concat layer-name ".el") marcmacs--layer-dir)))

(dolist (layer marcmacs-layers)
  (marcmacs--load-layer layer))

;; For some reason this has to be done here 🤷‍♂️
(winner-mode 1)

(provide 'init)
