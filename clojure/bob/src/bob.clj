(ns bob
  (:require [clojure.string :as str]))

(defn remove-unword-chars [s]
  (apply str (filter (fn [c] (Character/isLetter c)) s)))

(defn shouting? [s]
  (let [clean-s (remove-unword-chars s)]
    (and (= clean-s (str/upper-case clean-s)) (> (count clean-s) 0))))

(defn questioning? [s]
  (str/ends-with? s "?"))

(defn nothing? [s]
  (str/blank? s))

(defn response-for [s]
    (cond
      (nothing? s) "Fine. Be that way!"
      (and (questioning? s) (shouting? s)) "Calm down, I know what I'm doing!"
      (questioning? s) "Sure."
      (shouting? s) "Whoa, chill out!"
      :else "Whatever.")
  )
