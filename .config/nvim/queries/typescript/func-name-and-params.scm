;; Write queries here (see $VIMRUNTIME/queries/ for examples).
;; Move cursor to a capture ("@foo") to highlight matches in the source buffer.
;; Completion for grammar nodes is available (:help compl-omni)


[
 (method_definition
   name: (_) @name
   (formal_parameters (required_parameter (identifier) @params)))
 (function_declaration
   name: (_) @name
   (formal_parameters (required_parameter (identifier) @params)))
]

