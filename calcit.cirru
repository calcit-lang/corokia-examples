
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |app
  :entries $ {} $ :default
    {} (:description |) (:init-fn 'app.main/main!) (:mode :js) (:reload-fn 'app.main/reload!) (:target :browser)
      :feature-policy $ {}
      :modules $ [] |respo.calcit/ |respo-ui.calcit/
      :type-slots $ {} $ :dispatch-op 'app.schema/Action
  :files $ {}
    'app.comp.container $ %{} 'FileEntry
      :defs $ {}
        'comp-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-container ()
            div
              {} $ :style $ merge ui/global ui/column
              div
                {} $ :style $ merge ui/center
                  {} (:height 140) (:background-color "|hsl(220,60%,50%)") (:color :white)
                div
                  {} $ :style $ {} (:font-size 32) (:font-family ui/font-fancy)
                  <> "|Corokia Examples"
                div
                  {} $ :style $ {} (:opacity 0.8)
                  <> "|Cirru UI runtime demo index"
              div
                {} $ :style $ {} (:padding "|12px 16px") (:color |#555)
                <> "|The original runtime interpreter has been retired. Demo sources remain available below."
              list->
                {} $ :style $ merge ui/expand
                  {} $ :overflow :auto
                map-indexed demos $ fn (idx demo)
                  [] idx $ comp-demo demo
          :examples $ []
          :schema $ quote $ Fn (-> respo.schema/Component)
        'comp-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-demo (demo)
            div
              {} $ :style $ merge ui/row-parted
                {} (:padding "|10px 16px") (:border-bottom "|1px solid #eee")
              div
                {} $ :style $ {} (:display :flex) (:gap 12) (:align-items :baseline)
                a
                  {}
                    :href $ .unwrap-or (get demo :url) |
                    :target |_blank
                  <> $ .unwrap-or (get demo :name) |
                span
                  {} $ :style $ {} (:color |#888) (:font-size 13)
                  <> $ .unwrap-or (get demo :desc) |
          :examples $ []
          :schema $ quote $ Fn (Map Tag String) (-> respo.schema/Component)
        'demos $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def demos
            []
              {} (:name |default) (:desc "|Default canvas demo") (:url |https://github.com/calcit-lang/corokia-examples)
              {} (:name |primes) (:desc "|Prime whirl animation") (:url |https://github.com/calcit-lang/corokia-examples)
              {} (:name |complex) (:desc "|Complex plane demo") (:url |https://github.com/calcit-lang/corokia-examples)
              {} (:name |rose) (:desc "|Rose curve demo") (:url |https://github.com/calcit-lang/corokia-examples)
          :examples $ []
          :schema $ quote $ List (Map Tag String)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.container
          :require (respo-ui.core :as ui)
            respo.core :refer $ defcomp div span a <> list->
            respo.comp.space :refer $ =<
    'app.main $ %{} 'FileEntry
      :defs $ {}
        'dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn dispatch! (action)
            match action $
              :noop
              , &unit
          :examples $ []
          :schema $ quote $ Fn schema/Action (-> Unit)
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (render-app!) &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :js-ffi :state)
        'mount-target $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def mount-target
            .unwrap $ query-selector |.app
          :examples $ []
          :schema $ quote respo.dom/DomElement
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! ()
            if (nil? build-errors) (render-app!) (println build-errors)
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :js-ffi :state)
        'render-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-app! ()
            render-with! mount-target
              fn () $ comp-container
              , dispatch!
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :js-ffi :state)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.main
          :require
            respo.core :refer $ render-with!
            respo.ffi.browser :refer $ query-selector
            app.comp.container :refer $ comp-container
            app.schema :as schema
            |./calcit.build-errors :default build-errors
    'app.schema $ %{} 'FileEntry
      :defs $ {} $ 'Action
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defenum Action (:noop)
          :examples $ []
          :schema $ quote EnumDef
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.schema
