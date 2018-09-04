;; start package.el with emacs
(require 'package)

;; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(package-initialize)

;;Load zenburn theme
(load-theme 'zenburn t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(custom-safe-themes
   (quote
    ("10db656adc5afc477ae0d25e739cd233fbcb90d06dc91b0286b1faed8324a8a5" default)))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (highlight-parentheses auto-complete-c-headers yasnippet auto-complete)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'yasnippet)
(yas-global-mode 1)

(defun srnd:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
  
(add-hook 'c++-mode-hook 'srnd:ac-c-header-init)
(add-hook 'c-mode-hook 'srnd:ac-c-header-init)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;MY CUSTOMIZATIONS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(normal-erase-is-backspace-mode 1)                  ;; This makes delete and backspace behave in the normal way
;;(setq c-default-style "linux" c-basic-offset 2)     ;; Tab size is 2
(global-linum-mode t)

(setq-default indent-tabs-mode nil)                 ;; turn tabs into spaces in all buffers
;; set tab-width to 2 in all buffers
(setq-default tab-width 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;BUFFER MANAGEMENT;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(ido-mode 1)                                        ;; enables ido mode, with this C-x b will show list of buffers
(setq ido-separator "\n")                           ;; This makes the list of buffers vertically 
(global-set-key (kbd "C-<tab>") 'buffer-menu-other-window)                  ;; Paste, was M-w
(setq-default truncate-lines t)                     ;; makes M-x toggle-truncate-lines on by default on all buffers, else you'll have to turn it on on all buffers manually
;;(setq-default scroll-lock-mode t)                 ;; Makes moving up and down with cursor less painful, moves one line at a time

(global-set-key (kbd "<f5>") 'revert-buffer)        ;; Bind F5 to revert-buffer
(setq revert-without-query (quote (".*.dbg")))      ;; Do not ask for confirmation for revert-buffer for log files only 

;(when (fboundp 'windmove-default-keybindings)       ;; Wind Move, use SHIFT + ARROW keys to switch windows, https://www.emacswiki.org/emacs/WindMove
;  (windmove-default-keybindings))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;SCROLL AND MOUSE MOVEMENTS;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq mouse-wheel-scroll-amount `(2))               ;; How many lines to scroll per mouse wheel click
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)                  ;; Scroll mouse under window
(setq scroll-step 1)                                ;; Keyboard scroll one line at a time

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;BASIC EDITING;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(global-set-key (kbd "C-c") 'copy)                  ;; Paste, was M-w
;;(global-set-key (kbd "C-v") 'yank)                  ;; Paste, was C-y
(global-set-key (kbd "C-z") 'undo)                  ;; Undo,  was C-x u
;;(global-set-key (kbd "C-y") 'redo)                  ;; Redo, was ..?
(setq mouse-drag-copy-region t)                     ;; Selecting a block of test with mouse automatically copies it
(global-set-key (kbd "C-o") 'ff-find-other-file)    ;; opens header files
(electric-pair-mode 1)                              ;; AUtomatically inserts right bracket when left is typed

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;SEARCHING;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-f") 'isearch-forward)       ;; Simple Find next in buffer
(global-set-key (kbd "C-S-f") 'occur)               ;; Notepad++ like Find all in buffer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;HIGHLIGHTING;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Enables highlight-parentheses-mode on all buffers
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;;(idle-highlight-mode 1)
;;(global-hl-line-mode 1)                             ;; Highlights current line
(show-paren-mode 1)                                 ;; Highlights matching brackets

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;IDE MANAGEMENT;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(global-set-key (kbd "C-m") 'compile)                  ;; Compile

;; This sets the title of the buffer to the path of the file
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))
