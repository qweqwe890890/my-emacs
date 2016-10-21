;; go语言的自动补全设置                                                                                                                                                                                           
;; 需要预先安装gocode到$PATH中：github.com/nsf/gocode
(add-to-list 'load-path "~/.emacs.d/site-lisp")                                                                                                                                                             
;;(require 'go-complete)
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

;; call 'go fmt' before closing a go file
(add-hook 'before-save-hook #'gofmt-before-save)
(add-hook 'completion-at-point-functions 'go-complete-at-point)

(provide 'gomode-setting)
