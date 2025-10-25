;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b49f66a2e1724db880692485a5d5bcb9baf28ed2a3a05c7a799fa091f24321da"
     "d89e15a34261019eec9072575d8a924185c27d3da64899905f8548cbd9491a36"
     "5f78a36d69bb8df702a8f6ef8dd523da044050872d3ab9bbc265dbe250d4b0e4"
     "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1"
     "7fea145741b3ca719ae45e6533ad1f49b2a43bf199d9afaee5b6135fd9e6f9b8"
     "26bd74f80bb7a869de3bf5521a227329cf34cfe2cd2446e421a7f5832e899b1e"
     "4cc9792d6e9fb067124620e579d70e38090a46eea8586d871deafcc1db555450"
     default))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-selected-packages '(meow rust-mode smex solarized-theme))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
