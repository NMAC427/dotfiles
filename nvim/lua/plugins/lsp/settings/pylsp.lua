return {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          maxLineLength = 88,
          ignore = {
            "F841",
            "E501",
          },
        },
        pyflakes = {
          enabled = false,
        },
      },
    },
  },
}
