;;; package --- Summary:

;;; Commentary:

;;; Code:

(require 'bind-key)

;; cursor
;;(global-set-key (kbd "C-a") 'prefix-help-command)

;;(define-key global-map "\C-u" 'mode-specific-command-prefix)

;; (global-set-key (kbd "C-c") 'previous-line) ;; default C-p take C-c prefix
;; (global-set-key (kbd "C-t") 'next-line)     ;; default C-n take transpose-chars place
;; (global-set-key (kbd "C-h") 'left-char)     ;; default <left> take C-h prefix-help-command
;; (global-set-key (kbd "M-h") 'left-word)     ;; default M-<left> take owdriver-do-scroll-right place
;; (global-set-key (kbd "C-n") 'right-char)    ;; default <right> take next-line place
;; (global-set-key (kbd "M-n") 'right-word)    ;; default M-<right> nil
;; (global-set-key (kbd "C-d") 'move-beginning-of-line) ;; default C-a take delete-char place
;; (global-set-key (kbd "C-s") 'move-end-of-line)       ;; default C-e take isearch-forward place
;; (global-set-key (kbd "C-g") 'scroll-up)              ;; default C-v take keyboard-quit place
;; (global-set-key (kbd "C-r") 'scroll-down)            ;; default M-v take isearch-backward place


;; ;; remapt
;; (global-unset-key (kbd "C-c"))
;; (global-set-key (kbd "C-i") 'keyboard-quit)
;; iimage-mode

;; ace-jump-mode
(define-key global-map (kbd "M-'") 'ace-jump-mode)
(define-key global-map (kbd "M-q") 'ace-jump-buffer)

;; ace-window
(global-set-key (kbd "M-j") 'ace-window)
(setq aw-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?s))

;; anyins
;;t(global-set-key (kbd "C-c a") 'anyins-mode)

;; buffer-move
(global-set-key (kbd "<C-s-up>")     'buf-move-up)
(global-set-key (kbd "<C-s-down>")   'buf-move-down)
(global-set-key (kbd "<C-s-left>")   'buf-move-left)
(global-set-key (kbd "<C-s-right>")  'buf-move-right)

;; change-inner
(global-set-key (kbd "M-i") 'change-inner)
(global-set-key (kbd "M-o") 'change-outer)

;; dired-subtree
(require 'dired+)
(define-key dired-mode-map (kbd "i") 'dired-subtree-insert)

;; goto-chg
(global-set-key (kbd "C-? .") 'goto-last-change)
(global-set-key (kbd "C-? ,") 'goto-last-change-reverse)

;; google-translate
(global-set-key "\C-ct" 'google-translate-smooth-translate)

;; magit-find-file
(global-set-key (kbd "C-c p") 'magit-find-file-completing-read)

;; multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; owdriver
(require 'owdriver)
(global-unset-key (kbd "M-o"))
(setq owdriver-prefix-key "M-o")

(global-set-key (kbd "M-h") 'owdriver-do-scroll-right)
;;(global-set-key (kbd "M-j") 'owdriver-do-scroll-up)
(global-set-key (kbd "M-k") 'owdriver-do-scroll-down)
(global-set-key (kbd "M-l") 'owdriver-do-scroll-left)

;; user define
(define-key ctl-x-4-map "t" 'toggle-window-split)
;; I don't use the default binding of 'C-x 5', so use toggle-frame-split instead
(global-set-key (kbd "C-x 5") 'toggle-frame-split)
(global-set-key (kbd "s-i") 'uuid-insert)

;; ggtags
(define-key ggtags-mode-map (kbd "C-c d") 'ggtags-find-definition)

;; org-mode
(unbind-key (kbd "C-o") org-mode-map) ;; belong to org-open-line
(defvar org-prefix-map (make-sparse-keymap)
  "Keymap for subcommands of org mode on C-o.")
(defalias 'org-prefix org-prefix-map)
(define-key org-mode-map (kbd "C-o") 'org-prefix)
(define-key org-mode-map (kbd "C-c e") 'org-encrypt-entries)
(define-key org-mode-map (kbd "C-c d") 'org-decrypt-entries)
(define-key org-prefix-map (kbd "t") 'org-insert-todo-heading)
(global-set-key (kbd "<f11>") (lambda () (interactive) (find-file "~/.emacs.d/org/todo.org")))

(global-set-key (kbd "<f12>") 'emms-pause)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c L") 'org-insert-link-global)
(global-set-key (kbd "C-c o") 'org-open-at-point-global)
(define-key global-map (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c C-a") 'org-attach)

(global-set-key (kbd "C-c M-w") 'org-copy)
(global-set-key (kbd "C-c C-w") 'org-refile)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
;;; 06_key-binding.el ends here
