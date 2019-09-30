(ns two-fer)

(defn two-fer
  ([]
   (two-fer "you"))
  ([forName]
   (str "One for " forName ", one for me.")))
