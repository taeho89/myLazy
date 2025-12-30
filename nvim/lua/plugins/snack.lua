return {
  "folke/snacks.nvim", -- 실제 사용된 플러그인 이름 확인 필요
  opts = {
    find_command = { "fd", "--type", "f", "--hidden", "--no-ignore-vcs" }, -- .gitignore 무시 + 숨김 파일 포함
  },
}

