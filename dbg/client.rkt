#lang racket/base

(require racket/contract
         "private/client.rkt"
         "private/gc.rkt")

(provide
 (struct-out gc-info)
 (contract-out
  [client? (-> any/c boolean?)]
  [connect (->* ()
                (#:host string?
                 #:port (integer-in 0 65535))
                client?)]
  [disconnect (-> client? void?)]
  [subscribe (-> client? symbol? void?)]
  [unsubscribe (-> client? symbol? void?)]
  [async-evt (-> client? evt?)]
  [get-info (-> client? hash?)]
  [get-memory-use (-> client? exact-positive-integer?)]
  [get-managed-item-counts (-> client? (hash/c symbol? (or/c exact-positive-integer? list?)))]))