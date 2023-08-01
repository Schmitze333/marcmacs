;;;; Front-end related stuff ;;;;

(use-package web-mode
  :mode (("\\.js\\'" . web-mode)
   ("\\.jsx\\'" . web-mode)
   ("\\.ts\\'" . web-mode)
   ("\\.tsx\\'" . web-mode)
   ("\\.html\\'" . web-mode))
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-code-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-auto-quote-style 2)
  :config
  (require 'flycheck)
  (flycheck-add-mode 'javascript-eslint 'web-mode)

  :hook
  (web-mode . flycheck-mode)
  :commands web-mode)

(use-package eslint-fix)

(use-package npm
  :ensure t)

(use-package flymake-eslint
  :defer t)

(use-package jest
  :after (web-mode)
  :hook (web-mode . jest-minor-mode))

(use-package jest-test-mode
  :ensure t
  :commands jest-test-mode
  :hook (web-mode))
