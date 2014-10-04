;;; package --- Summary:

;;; Commentary:

;;; Code:
(setenv "PATH" "/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/opt/local/bin")
(put 'narrow-to-region 'disabled nil)
(fset 'yes-or-no-p 'y-or-n-p)
(require 'flycheck)
(add-to-list 'flycheck-disabled-checkers 'emacs-lisp-checkdoc)
(add-hook 'desktop-after-read-hook 'powerline-reset)

;;; 05_hooks.el ends here
