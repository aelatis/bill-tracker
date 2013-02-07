(ns bill-tracker.core
  (:use org.httpkit.server
        compojure.core
        [ring.middleware.accept-param :only [wrap-accept-param]]
        [cheshire.core :only [generate-string]]
        dieter.core)
  (:require [clojure.java.jdbc :as sql]
            [compojure.handler :as handler]
            [compojure.route :as route]))

(def ^{:const true} json-header {"Content-Type" "application/json; charset=utf-8"})

(def db {:subprotocol "mysql"
         :subname "//127.0.0.1:3306/expenses"
         :user "root"
         :password ""})

(def config-options {:compress false
                     :asset-roots ["./"]
                     :cache-root "resources/asset-cache"})

(defn expenses [] (sql/with-connection db
  (sql/with-query-results rows ["SELECT * FROM expenses"]
    (doall rows))))

(defn get-expenses-page-json []
  (async-response respond
                  (future (respond {:status 200
                                    :headers json-header
                                    :body (generate-string (expenses))}))))

(defroutes html-router
  (route/files "/" {:root (str (System/getProperty "user.dir") "/public")})
  (route/not-found "Not found"))

(defroutes json-router
  (GET "/expenses" [] (get-expenses-page-json))
  (GET "/assets" [] (generate-string {:assets (link-to-asset "js/app.js" config-options)}))
  (route/not-found ""))

(defn dispatcher [req]
  (case (:accept (:params req))
    "html" (html-router req)
    "json" (json-router req)))

(defn -main []
  (run-server (-> (-> dispatcher wrap-accept-param (handler/site))
                  (asset-pipeline config-options))
              {:port 8080}))
