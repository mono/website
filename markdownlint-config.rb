# keep in sync with .markdownlint.json for VSCode
all
exclude_tag :line_length

# MD001: Header levels should only increment by one level at a time
# Justification: enforcing this now would break a gazillion pages
exclude_rule 'MD001'

# MD002/MD041: First header/line should be a h1 header
# Justification: we always have the page title as H1 in the layout
exclude_rule 'MD002'
exclude_rule 'MD041'

# MD003: Header style
# Justification: we actually like both atx and setext style headers
exclude_rule 'MD003'

# MD033: Inline HTML
# Justification: we don't want pure Markdown, inline HTML is fine
exclude_rule 'MD033'

# MD036: Emphasis used instead of a header
# Justification: enforcing this now would break a gazillion pages
exclude_rule 'MD036'

# MD039: Spaces inside link text
# Justification: there's nothing terribly wrong with doing that
exclude_rule 'MD039'

# MD046: Code block style
# Justification: we don't care about mixing indented and fenced code blocks
exclude_rule 'MD046'

rule 'MD026', :punctuation =>  '.,;:!'   # Trailing punctuation in header
rule 'MD029', :style => 'ordered'        # Ordered list item prefix

# TODO: the following rules should ideally be enabled again
exclude_rule 'MD006' # Consider starting bulleted lists at the beginning of the line
exclude_rule 'MD007' # Unordered list indentation
exclude_rule 'MD030' # Spaces after list markers
exclude_rule 'MD032' # Lists should be surrounded by blank lines
