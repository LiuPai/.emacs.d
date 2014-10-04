;;; package --- Summary

;;; Commentary:

;; init to load functions

;;; Code:

;; gentoo-site
(require 'site-gentoo)
;; for anthy
(defvaralias 'last-command-char 'last-command-event)
;; aes
(require 'aes)
(aes-enable-auto-decryption)

;; alert
(require 'alert)

;; babel
(autoload 'babel "babel"
  "Use a web translation service to translate the message MSG." t)
(autoload 'babel-region "babel"
  "Use a web translation service to translate the current region." t)
(autoload 'babel-as-string "babel"
  "Use a web translation service to translate MSG, returning a string." t)
(autoload 'babel-buffer "babel"
  "Use a web translation service to translate the current buffer." t)
					; (babel-<zob>-translation from to)
					; (babel-<zob>-fetch msg from to)
					; (babel-<zob>-wash)

;; backup-each-save
(require 'backup-each-save)
(setq backup-each-save-mirror-location "~/.emacs.d/backup")
(add-hook 'after-save-hook 'backup-each-save)

;; bind-key
(require 'bind-key)
					; TODO: read doc
;; bookmark+
(require 'bookmark+)

;; browse-kill-ring
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;; buffer-move
(require 'buffer-move)

;; change-inner
(require 'change-inner)

;; command-freq
(require 'command-frequency)
(command-frequency-mode 1)

;; disaster
(require 'disaster)
;; (define-key c-mode-base-map (kbd "C-c d") 'disaster)

;; emms
(require 'emms-setup)
(emms-devel)
(require 'emms-player-mplayer)

;; enging-mode
(require 'engine-mode)
(engine-mode t)
(defengine google
  "https://www.google.co.jp/search?ie=utf-8&oe=utf-8&q=%s"
  "g")
(defengine duck
  "https://duckduckgo.com/lite/?q=%s"
  "d")

;; EasyPG
(require 'epg)
(require 'epg-config)

;; free-keys
(require 'free-keys)

;; goto-chg
(require 'goto-chg)

;; google-translate
(require 'google-translate)
(require 'google-translate-smooth-ui)

;; hide-comnt
(require 'hide-comnt)

;; hlinum
(require 'hlinum)
(hlinum-activate)

;; keymap-utils
(require 'keymap-utils)

;; linum-mode
(add-hook 'c-mode-common-hook 'linum-mode)
(add-hook 'emacs-lisp-mode-hook 'linum-mode)
(add-hook 'java-mode-hook 'linum-mode)
(add-hook 'python-mode-hook 'linum-mode)
(add-hook 'go-mode-hook 'linum-mode)
(add-hook 'lisp-mode-hook 'linum-mode)
(add-hook 'conf-mode-hook 'linum-mode)
(add-hook 'shell-script-mode-hook 'linum-mode)

;; lispxmp
(require 'lispxmp)

;; memory-usage
(require 'memory-usage)

;; multiple-cursors
(require 'multiple-cursors)

;; org-crypt
(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("CRYPT")))

;; owdriver
(require 'owdriver)
(owdriver-config-default)
(owdriver-mode 1)

;; ;; powerline
;; (require 'powerline)
;; (powerline-default-theme)
;; ;;(powerline-center-theme)

;; rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)

(require 'smartrep)

;; tomatinho
(require 'tomatinho)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode t)

;; unicode-fonts
(require 'unicode-fonts)
;; (unicode-fonts-setup)

;; visual-regexp-steroids
(require 'visual-regexp)

;;; 02_utils.el ends here

