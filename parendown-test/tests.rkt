#lang parendown racket/base

; parendown/tests
;
; Unit tests.

;   Copyright 2018 The Lathe Authors
;
;   Licensed under the Apache License, Version 2.0 (the "License");
;   you may not use this file except in compliance with the License.
;   You may obtain a copy of the License at
;
;       http://www.apache.org/licenses/LICENSE-2.0
;
;   Unless required by applicable law or agreed to in writing,
;   software distributed under the License is distributed on an
;   "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
;   either express or implied. See the License for the specific
;   language governing permissions and limitations under the License.


(require rackunit)

(require #/only-in parendown pd)

; (We provide nothing from this module.)


(check-equal?
  '(a #/b c #/d . #/e . f . #/g)
  '(a (b c (d . (e . f . (g)))))
  "Using the `#/` reader syntax from `#lang parendown`")

(check-equal?
  (pd / quote / a / b c / d f e / g)
  '(a (b c (d . (e . f . (g)))))
  "Using the `pd` macro")