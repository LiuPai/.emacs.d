;;; package --- Summary

;;; Commentary:


;;; Code:
;; auto-complete-c-headers
(require 'auto-complete)

(defun ac-c-headers-init ()
  "Auto complete C headers."
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
(add-hook 'c++-mode-hook 'ac-c-headers-init)
(add-hook 'c-mode-hook 'ac-c-headers-init)

;; ac-etags
;; (custom-set-variables
;;  '(ac-etags-requires 1))

;; (eval-after-load "etags"
;;   '(progn
;;      (ac-etags-setup)))

;; (defun ark/c-mode-common-hook ()
;;   (add-to-list 'ac-sources 'ac-source-etags))

;; (add-hook 'c-mode-common-hook 'ark/c-mode-common-hook)


;; ac-ispell
(eval-after-load "auto-complete"
  '(progn
     (ac-ispell-setup)))

(defun enable-ac-ispell ()
  "Auto complete spell."
  (add-to-list 'ac-sources 'ac-source-ispell))

(add-hook 'git-commit-mode-hook 'enable-ac-ispell)
(add-hook 'mail-mode-hook 'enable-ac-ispell)
(add-hook 'org-mode-hook 'enable-ac-ispell)
(add-hook 'text-mode-hook 'enable-ac-ispell)

;; ac-js2
;; (setq ac-js2-evaluate-calls t)
;; (add-to-list 'ac-js2-external-libraries "path/to/lib/library.js")

;; auto-complete-clang-async
(require 'auto-complete-clang-async)
(defun ac-cc-mode-setup ()
  "Clang complete mode."
  (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process))

(defun ac-clang-config ()
  "Auto-complete  clang config."
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup))

(ac-clang-config)

;; ac-dabbrev
(add-to-list 'ac-sources 'ac-source-dabbrev)

(add-to-list 'ac-sources 'ac-source-clang-template)
(add-to-list 'ac-sources 'ac-source-files-in-current-dir)
(add-to-list 'ac-sources 'ac-source-gtags)
(add-to-list 'ac-sources 'ac-source-dictionary)
(add-to-list 'ac-sources 'ac-source-functions)
(add-to-list 'ac-sources 'ac-source-symbols)
(add-to-list 'ac-sources 'ac-source-yasnippet)
(ac-flyspell-workaround)

;; flycheck-color-mode-line
(require 'flycheck-color-mode-line)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;; flycheck-tip
(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
(custom-set-variables
 '(flycheck-pos-tip-timeout 10))

;; google-c-style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

;; dired+
(require 'dired+)

;; dired-single
(require 'dired-single)

;; dired-subtree
(require 'dired-subtree)

;; eldoc-extension
(require 'eldoc-extension)

;; el-autoyas
(require 'el-autoyas)

;; eldoc-extension
(require 'eldoc-extension)

;; magit-find-file
(require 'magit-find-file)

;; magit-push-remote
(require 'magit-push-remote)

;; org-ac
(require 'org-ac)
(org-ac/config-default)

;; org-magit
(require 'org-magit)

;; w3m
(setq w3m-pop-up-frames nil)

;; paredit-everywhere
(add-hook 'prog-mode-hook 'paredit-everywhere-mode)

;;; 03_plugins.el ends here
