; Inject cercis rsx! macro content as HTML
(macro_invocation
  macro: (scoped_identifier
           path: (identifier) @_path
           name: (identifier) @_macro)
  (token_tree) @injection.content
  (#eq? @_path "rsx")
  (#set! injection.language "html"))

