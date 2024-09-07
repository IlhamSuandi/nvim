require("parrot").setup({
  providers = {
    gemini = {
      api_key = os.getenv("GEMINI_API_KEY"),
    },
    groq = {
      api_key = os.getenv("GROQ_API_KEY"),
    },
  },
  cmd_prefix = "AI",
  chat_confirm_delete = false,
  chat_free_cursor = true,
})
