(ns bob
  (:require [clojure.string :as str]))

(defn remove-unword-chars [s]
  (apply str (filter (fn [c] (or (= c \?) (Character/isLetter c))) s)))

(defn shouting? [s]
  (let [clean-s (remove-unword-chars s)]
    (and (= clean-s (str/upper-case clean-s)) (> (count clean-s) 0))))

(defn questioning? [s]
  (str/ends-with? (remove-unword-chars s) "?"))

(defn saying? [s]
  (> (count (remove-unword-chars s)) 1))

(defn nothing? [s]
  (str/blank? s))

(defn response-for [s]
    (cond
      (nothing? s) "Fine. Be that way!"
      (and (saying? s) (questioning? s) (shouting? s)) "Calm down, I know what I'm doing!"
      (questioning? s) "Sure."
      (shouting? s) "Whoa, chill out!"
      :else "Whatever.")
  )
