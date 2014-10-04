;;; 01_minor-modes.el --- Summary

;;; Commentary:

;;; Code:

;; ace-jump-mode
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

;; anyins
(require 'anyins)

;; anzu
(global-anzu-mode 1)

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(global-auto-complete-mode t)

;; auto-ident-mode
(require 'auto-indent-mode)
(setq auto-indent-on-visit-file t)
(add-hook 'emacs-lisp-mode-hook 'auto-indent-mode)
(add-hook 'c-mode-common-hook 'auto-indent-mode)

;; c-eldoc
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

;; cmake-project
(require 'cmake-project)
(defun maybe-cmake-project-hook ()
  "Start cmake-project-mode When sees CMakeLists.txt."
  (if (file-exists-p "CMakeLists.txt") (cmake-project-mode)))
(add-hook 'c-mode-hook 'maybe-cmake-project-hook)
(add-hook 'c++-mode-hook 'maybe-cmake-project-hook)

;; crontab-mode
(require 'crontab-mode)
(add-to-list 'auto-mode-alist '("cron\\(tab\\)?\\."   . crontab-mode))

 ;; eldoc
(add-hook 'lisp-mode-hook 'eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)

;; fic-mode
(require 'fic-mode)
(add-hook 'c-mode-hook 'turn-on-fic-mode)
(add-hook 'c++-mode-hook 'turn-on-fic-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-fic-mode)

;; fly-check
(add-hook 'after-init-hook #'global-flycheck-mode)

;; ggtags
(require 'ggtags)
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'lisp-mode)
	      (ggtags-mode 1))))

;; ;; irony-mode
;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'objc-mode-hook 'irony-mode)

;; ;; replace the `completion-at-point' and `complete-symbol' bindings in
;; ;; irony-mode's buffers by irony-mode's function
;; (defun irony-mode-remap ()
;;   (define-key irony-mode-map [remap completion-at-point]
;;     'irony-completion-at-point-async)
;;   (define-key irony-mode-map [remap complete-symbol]
;;     'irony-completion-at-point-async))
;; (add-hook 'irony-mode-hook 'irony-mode-remap)

;; paredit
(require 'paredit)
(show-paren-mode 1)
(paredit-everywhere-mode t)
					;(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
					;(add-hook 'lisp-interacton-mode-hook 'enable-paredit-mode)

;; projectile
(require 'projectile)
(projectile-global-mode t)

;; smart-cursor-color
(smart-cursor-color-mode +1)

;; vlf
(require 'vlf)

;; window-number
(require 'window-number)
(window-number-mode 1)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;;; 01_minor-modes.el ends here
