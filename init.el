(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'load-path "~/.emacs.d/evil")
(add-to-list 'load-path "~/.emacs.d/modern-cpp-font-lock")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/emmet-mode")
(global-set-key (kbd "C-<up>") 'text-scale-increase)
(global-set-key (kbd "C-<down>") 'text-scale-decrease)
(require 'evil)
(require 'flycheck-rtags)
;(require 'flymake)
(evil-mode 1)
(require 'yasnippet)
(yas-global-mode 1)
(setq inhibit-startup-screen t)
(load-theme 'tsdh-dark)
(global-display-line-numbers-mode)
(require 'emmet-mode)
(require 'dropdown-list)
 
(fset 'expandEMMET
   [?a ?\C-j escape])

(setq yas/prompt-functions '(yas/dropdown-prompt
                             yas/ido-prompt
                             yas/completing-prompt))

(require 'auto-complete-config)
(evil-commentary-mode)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete/dict")
(ac-config-default)
(require 'modern-cpp-font-lock)
(modern-c++-font-lock-global-mode t)
;;---------------------------------------------------

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(require 'modern-cpp-font-lock)
(require 'rtags)

;;-----------------------------------------------------
;; Evil mode key maps
(define-minor-mode my-override-mode
  "Overrides all major and minor mode keys" t)

(defvar my-override-map (make-sparse-keymap "my-override-map")
  "Override all major and minor mode keys")

(add-to-list 'emulation-mode-map-alists
  `((my-override-mode . ,my-override-map)))


(define-key evil-motion-state-map (kbd "<left>")
  (lambda ()
    (interactive)
    (message "Use Vim keys: h for Left")))


(define-key evil-motion-state-map (kbd "<right>")
  (lambda ()
    (interactive)
    (message "Use Vim keys: l for Right")))


(define-key evil-motion-state-map (kbd "<up>")
  (lambda ()
    (interactive)
    (message "Use Vim keys: k for Up")))


(define-key evil-motion-state-map (kbd "<down>")
  (lambda ()
    (interactive)
    (message "Use Vim keys: j for Down")))

;(define-key evil-normal-state-map (kbd "e")  [a\C-j] )
(define-key evil-normal-state-map (kbd "<SPC>") (kbd "a")  )
(evil-define-key 'normal 'global
  ;; select the previously pasted text
  "e" 'expandEMMET 
  "s" ":w"
  "X" ":q"
  ;; run the macro in the q register
  "Q" "@q")

;;; EXAMPLES;;;
;(define-key evil-motion-state-map "j" 'evil-motion-state-map)
;(define-key evil-motion-state-map "k" 'evil-search-next)
;(define-key evil-motion-state-map "l" 'evil-substitute)
;
;(define-key evil-normal-state-map "t" 'evil-next-line)
;(define-key evil-normal-state-map "n" 'evil-previous-line)
;(define-key evil-normal-state-map "s" 'evil-forward-char)
;
;(define-key evil-normal-state-map "j" 'evil-motion-state-map)
;(define-key evil-normal-state-map "k" 'evil-search-next)
;(define-key evil-normal-state-map "l" 'evil-substitute)
;
;(define-key evil-visual-state-map "t" 'evil-next-line)
;(define-key evil-visual-state-map "n" 'evil-previous-line)
;(define-key evil-visual-state-map "s" 'evil-forward-char)
;
;(define-key evil-visual-state-map "j" 'evil-motion-state-map)
;(define-key evil-visual-state-map "k" 'evil-search-next)
;(define-key evil-visual-state-map "l" 'evil-substitute)
;
;(define-key evil-operator-state-map "t" 'evil-next-line)
;(define-key evil-operator-state-map "n" 'evil-previous-line)
;(define-key evil-operator-state-map "s" 'evil-forward-char)
;
;(define-key evil-operator-state-map "j" 'evil-motion-state-map)
;(define-key evil-operator-state-map "k" 'evil-search-next)
;(define-key evil-operator-state-map "l" 'evil-substitute)
;;Exit insert mode by pressing j and then j quickly
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)
;;-----------------------------------------------------
(require 'flycheck)

(require 'rtags)
(require 'company-rtags)

(setq rtags-completions-enabled t)
(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-rtags))
(setq rtags-autostart-diagnostics t)
(rtags-enable-standard-keybindings)

(add-hook 'c-mode-hook 'flycheck-mode)

(elpy-enable)

(setq-default c-basic-offset 2)
(setq-default python3-basic-offset 4)
(setq-default indent-tabs-mode nil)

(add-hook 'c-mode-common-hook
  (lambda ()
    (flymake-mode t)
    (global-set-key "\C-c\C-v" 'my-flymake-show-next-error)))

(defun my-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)    
(setq tab-width 2)

(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)

(defun my-web-mode-hook ()
  (set (make-local-variable 'company-backends) '(company-css company-web-html company-yasnippet company-files))
)
(require 'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode) 

(add-hook 'sgml-mode-hook 'emmet-mode) 
(add-hook 'css-mode-hook  'emmet-mode) 
(put 'scroll-left 'disabled nil)
