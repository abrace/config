(setq inferior-lisp-program "/usr/local/bin/sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(evil-overriding-maps
   (quote
    ((Buffer-menu-mode-map)
     (color-theme-mode-map)
     (comint-mode-map)
     (compilation-mode-map)
     (grep-mode-map)
     (dictionary-mode-map)
     (ert-results-mode-map . motion)
     (Info-mode-map . motion)
     (speedbar-key-map)
     (slime-mode-map)
     (speedbar-file-key-map)
     (speedbar-buffers-key-map))))
 '(global-paren-face-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (mic-paren evil-paredit paredit paren-face evil)))
 '(paren-face-modes
   (quote
    (lisp-mode emacs-lisp-mode lisp-interaction-mode ielm-mode scheme-mode inferior-scheme-mode clojure-mode cider-repl-mode nrepl-mode arc-mode inferior-arc-mode slime-repl-mode)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Menlo"))))
 '(cursor ((t (:background "gray70"))))
 '(font-lock-comment-face ((t (:foreground "SkyBlue3"))))
 '(font-lock-function-name-face ((t (:foreground "black"))))
 '(font-lock-keyword-face ((t (:foreground "dark slate blue"))))
 '(font-lock-string-face ((t (:foreground "coral4"))))
 '(font-lock-type-face ((t (:foreground "dark slate blue"))))
 '(parenthesis ((t (:foreground "gray40"))))
 '(show-paren-match ((t (:background "light goldenrod")))))

(setq-default line-spacing 4)
(setq-default indent-tabs-mode nil)
;; (menu-bar-mode -1)


;;; Paredit hooks for Lisp-like modes.

(defun both-paredit-modes ()
  (paredit-mode)
  (evil-paredit-mode))

;; Should include eval-expression-minibuffer-setup-hook and ielm-mode-hook?
(add-hook 'emacs-lisp-mode-hook #'both-paredit-modes)
(add-hook 'lisp-mode-hook #'both-paredit-modes)
(add-hook 'lisp-interaction-mode-hook #'both-paredit-modes)
(add-hook 'scheme-mode-hook #'both-paredit-modes)
;; Using both-paredit-modes with slime-repl-mode causes Evil mode not to work in
;; the REPL.
(add-hook 'slime-repl-mode-hook #'paredit-mode)


(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)
(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
;; (evil-set-initial-state 'slime-repl-mode 'emacs)


;;; Parenthesis Highlighting
;;; mic-paren has the advantage of not highlighting the open-paren under the cursor.
;;; But in Evil Mode, mic-paren doesn't highlight the matching open-paren when the
;;; cursor is on a close-paren at the end of a line.

(global-set-key (kbd "C-c m") 'show-paren-mode)
;; (require 'mic-paren) ; loading
;; (paren-activate)     ; activating
;; (setq custom-mic-paren-on t)
;; (global-set-key (kbd "C-c m")
;;                (lambda ()
;;                  "Toggle mic-paren."
;;                  (interactive)
;;                  (if custom-mic-paren-on
;;                      (paren-deactivate)
;;                    (paren-activate))
;;                  (setq custom-mic-paren-on (not custom-mic-paren-on))))


(defun toggle-cursor ()
  (interactive)
  (setq cursor-type (not cursor-type))
  (force-window-update)) ; otherwise cursor doesn't change until you move it

(global-set-key (kbd "C-c h") 'toggle-cursor)


;;; Compilation
;;; Commands for compiling with maximal debug settings by calling the Slime commands
;;; with the prefix argument '(4), which would be produced by entering C-u before
;;; calling the Slime command interactively.

(define-key slime-mode-map (kbd "C-c c")
  (lambda ()
    "Compile the current toplevel form with maximal debug settings."
    (interactive)
    (slime-compile-defun '(4))))

(define-key slime-mode-map (kbd "C-c k")
  (lambda ()
    "Compile and load the buffer’s file with maximal debug settings."
    (interactive)
    (slime-compile-and-load-file '(4))))


(define-key slime-repl-mode-map (kbd "C-c d") 'slime-repl-delete-current-input)

;; http://stackoverflow.com/a/25649189
; (defun my-show-paren-any (orig-fun)
;   (or (funcall orig-fun)
;       (if (looking-at "\\s)")
;           (save-excursion (forward-char 1) (funcall orig-fun)))))

;(add-function :around show-paren-data-function #'my-show-paren-any)

(add-to-list 'slime-contribs 'slime-cl-indent)
(command-execute 'slime-setup) ; needed for slime-cl-indent to take effect

;; SLIME repl gets hidden now that slime-setup is executed.
;; (command-execute 'split-window-right)
;; (command-execute 'other-window)
;; (command-execute 'slime)

(command-execute 'toggle-frame-maximized)
