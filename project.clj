(defproject bill-tracker "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.4.0"]
                 [http-kit "2.0-rc1"]
                 [compojure "1.1.5"]
                 [ring-accept-param "0.1.1"]
                 [org.clojure/java.jdbc "0.2.3"]
                 [mysql/mysql-connector-java "5.1.6"]
                 [postgresql "9.1-901.jdbc4"]
                 [org.clojure/tools.cli "0.2.2"]
                 [cheshire "5.0.1"]
                 [jamesdphillips/dieter "0.3.2"]
                 [jamesdphillips/dieter-handlebars "0.1.1"]]
  :main bill-tracker.core)
