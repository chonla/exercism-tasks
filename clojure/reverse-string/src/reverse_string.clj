(ns reverse-string)

(defn reverse-string [s]
  (loop [ss s
         acc ""]
    (if (empty? ss) acc
        (recur (rest ss) (str (first ss) acc)))))
