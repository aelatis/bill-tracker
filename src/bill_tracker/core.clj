(ns bill-tracker.core
  (:use org.httpkit.server
        compojure.core
        [ring.middleware.accept-param :only [wrap-accept-param]]
        [cheshire.core :only [generate-string]]
        slim.core)
  (:require [clojure.java.jdbc :as sql]
            [compojure.handler :as handler]
            [compojure.route :as route]))

(def ^{:const true} json-header {"Content-Type" "application/json; charset=utf-8"})

(def db {:subprotocol "mysql"
               :subname "//127.0.0.1:3306/expenses"
               :user "root"
               :password ""})

(defn expenses [] (sql/with-connection db
  (sql/with-query-results rows ["SELECT * FROM expenses"]
    (doall rows))))

(defn expenses-page-json []
  (async-response respond
                  (future (respond {:status 200
                                    :headers json-header
                                    :body (generate-string (expenses))}))))

(defroutes html-router
  (GET "/" [] "Welcome to the index HTML page")
  (GET "/expenses" [] "Welcome to the expenses HTML page")
  (route/not-found "Not found"))

(defroutes json-router
  (GET "/expenses" [] (expenses-page-json))
  (route/not-found ""))

(defn dispatcher [req]
  (case (:accept (:params req))
    "html" (html-router req)
    "json" (json-router req)))

(defn -main []
  (run-server (-> dispatcher wrap-accept-param (handler/site)) {:port 8080}))
