IEx.configure([
  colors: [
    syntax_colors: [
      atom: :cyan,
      boolean: [:green, :bright],
      nil: :red,
      number: :green,
      string: :green,
    ],
    ls_directory: :blue,
    ls_device: :yellow,
    doc_code: :green,
    doc_inline_code: :magenta,
    doc_headings: [:cyan, :underline],
    doc_title: [:cyan, :bright, :underline],
  ],
  alive_prompt: "%prefix(%node)%counter>",
  default_prompt: "%prefix(%counter)>",
  history_size: 50,
  inspect: [
    pretty: true,
  ],
])
