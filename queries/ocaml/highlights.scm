; Modules
;--------

[(module_name) (module_type_name)] @structure

; Types
;------

(
  (type_constructor) @type.builtin
  (#contains? @type.builtin "int" "char" "bytes" "string" "float" "bool" "unit" "exn" "array" "list" "option" "int32" "int64" "nativeint" "format6" "lazy_t")
)

[(class_name) (class_type_name) (type_constructor)] @type

[(constructor_name) (tag)] @constructor

; Functions
;----------

(let_binding
  pattern: (value_pattern) @function
  (parameter))

(let_binding
  pattern: (value_pattern) @function
  body: [(fun_expression) (function_expression)])

(value_specification (value_name) @function)

(external (value_pattern) @function)

(method_name) @method

; Variables
;----------

[(value_name) (type_variable)] @variable

(let_binding pattern: (value_pattern) @variable)
(let_binding pattern: (tuple_pattern (value_pattern) @variable))

(let_binding (parameter (label_name) @parameter))
(let_binding (parameter (value_pattern) @parameter))
(let_binding (parameter (typed_pattern (value_pattern) @parameter)))
(function_type (typed_label (label_name) @parameter))

; Application
;------------

(infix_expression
  left: (value_path (value_name) @function)
  (infix_operator) @operator
  (#eq? @operator "@@"))

(infix_expression
  (infix_operator) @operator
  right: (value_path (value_name) @function)
  (#eq? @operator "|>"))

(application_expression
  function: (value_path (value_name) @function))

(
  (value_name) @function.builtin
  (#match? @function.builtin "^(raise(_notrace)?|failwith|invalid_arg)$")
)

; Properties
;-----------

[(label_name) (field_name) (instance_variable_name)] @property

; Constants
;----------

(boolean) @constant

(number) @number

[(string) (character)] @string

(quoted_string "{" @string "}" @string) @string

(escape_sequence) @string.escape

(conversion_specification) @punctuation.special

; Operators
;----------

(match_expression (match_operator) @keyword)

(value_definition [(let_operator) (and_operator)] @keyword)

[
  (prefix_operator)
  (infix_operator)
  (indexing_operator)
  (let_operator)
  (and_operator)
  (match_operator)
] @operator

(prefix_operator "!" @operator)

(infix_operator ["&" "+" "-" "=" ">" "|" "%"] @operator)

["*" "#" "::" "<-"] @operator

; Keywords
;---------

[
  "and" "as" "assert" "begin" "class" "constraint"
  "end" "external" "fun" "function" "functor" "in"
  "inherit" "initializer" "lazy" "let" "match" "method" "module"
  "mutable" "new" "nonrec" "object" "of" "private" "rec" "sig" "struct"
  "type" "val" "virtual" "when" "with"
] @keyword

["if" "then" "else"] @conditional

["exception" "try"] @exception

["include" "open"] @include

["for" "to" "downto" "while" "do" "done"] @repeat
; Punctuation
;------------

(attribute ["[@" "]"] @punctuation.special)
(item_attribute ["[@@" "]"] @punctuation.special)
(floating_attribute ["[@@@" "]"] @punctuation.special)
(extension ["[%" "]"] @punctuation.special)
(item_extension ["[%%" "]"] @punctuation.special)
(quoted_extension ["{%" "}"] @punctuation.special)
(quoted_item_extension ["{%%" "}"] @punctuation.special)

"%" @punctuation.special

["(" ")" "[" "]" "{" "}" "[|" "|]" "[<" "[>"] @punctuation.bracket

(object_type ["<" ">"] @punctuation.bracket)

[
  "," "." ";" ":" "=" "|" "~" "?" "!" ">" "&"
  "->" ";;" ":>" "+=" ":=" ".."
] @punctuation.delimiter

; Attributes
;-----------

(attribute_id) @property

; Comments
;---------

[(comment) (line_number_directive) (directive) (shebang)] @comment

(ERROR) @error
