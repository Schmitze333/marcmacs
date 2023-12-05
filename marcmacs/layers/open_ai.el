;;;; Integration OpenAI ChatGPT and Dall-E ;;;;

(use-package gptel
  :ensure t
  :config
  (setq gptel-api-key (auth-source-pick-first-password :host "api.openai.com")))
