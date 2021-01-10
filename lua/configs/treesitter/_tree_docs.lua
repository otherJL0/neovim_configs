_tree_docs = {}

function setup()
  return {
    enable = true,
    spec_config = {
      jsdoc = {
        slots = {
          class = {author = true}
        }
      }
    },
  }
end

return _tree_docs
