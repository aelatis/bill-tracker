(ns bill-tracker.config
  (:require [clojure.java.io :as io]))

(defn load-config [filename]
  (with-open [r (io/reader filename)]
    (read (java.io.PushbackReader. r))))

(def fetch-config (memoize load-config))
