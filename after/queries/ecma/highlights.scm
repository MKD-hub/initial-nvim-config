((comment) @comment.documentation
  (#match? @comment.documentation "^/[*][*]")
  (#set! "priority" 110))
