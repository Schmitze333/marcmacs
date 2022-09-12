;;;; Ag ;;;;
(use-package ag
  :defer t)

;;;; Rg ;;;;
(use-package rg
  :defer t)

;;;; IEdit ;;;;
(use-package iedit)

;;;; Restclient ;;;;
(use-package restclient
  :defer t)

;;;; Groovy ;;;;
(use-package groovy-mode
  :defer t)

;;;; Dockerfile ;;;;
(use-package dockerfile-mode
  :defer t)

;;;; Read pdfs in Emacs ;;;;
(use-package pdf-tools
  :defer t)

(use-package csv-mode
  :defer t)

;;;; Golang ;;;;
(use-package go-mode
  :defer t
  :init
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook #'gofmt-before-save))
(use-package gotest
  :after go-mode)

;;;; YAML ;;;;
(use-package yaml-mode
  :defer t)

;;;; Markdown ;;;;
(defun xwidget-webkit-markdown-preview (file)
  "Preview FILE with xwidget-webkit to be used with `markdown-live-preview-window-function'."
  (let ((uri (format "file://%s" file)))
      (xwidget-webkit-browse-url uri)
      xwidget-webkit-last-session-buffer))
(use-package markdown-mode
  :defer t
  :init
  (setq markdown-command "multimarkdown")
  (setq markdown-live-preview-window-function 'xwidget-webkit-markdown-preview))
(use-package markdown-changelog)

;;;; Docker ;;;;
(use-package docker
  :defer t
  :custom (docker-container-columns
	   '((:name "Names"
		    :width 25
		    :template "{{ json .Names }}"
		    :sort nil
		    :format nil)
	     (:name "Status"
		    :width 20
		    :template "{{ json .Status }}"
		    :sort nil
		    :format nil)
	     (:name "Ports"
		    :width 30
		    :template "{{ json .Ports }}"
		    :sort nil
		    :format nil)
	     (:name "Created"
		    :width 23
		    :template "{{ json .CreatedAt }}"
		    :sort nil
		    :format (lambda (x)
			      (format-time-string "%F %T" (date-to-time x))))
	     (:name "Image"
		    :width 15
		    :template "{{ json .Image }}"
		    :sort nil
		    :format nil)
	     (:name "Id"
		    :width 16
		    :template "{{ json .ID }}"
		    :sort nil
		    :format nil)
	     (:name "Command"
		    :width 30
		    :template "{{ json .Command }}"
		    :sort nil
		    :format nil)))
  :bind ("s-d" . docker))

;;;; Format ELisp
(use-package elisp-format
  :defer t)

;;;; Google Translate ;;;;
(use-package google-translate
  :defer t
  :custom
  (require 'google-translate)
  (require 'google-translate-default-ui)
  (google-translate-backend-method 'curl)
  (google-translate-backend-debug t)
  (google-translate-default-source-language "en")
  (google-translate-default-target-language "de")
  :bind ("C-x T" . google-translate-query-translate))


