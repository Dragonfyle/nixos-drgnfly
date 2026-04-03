function fish_user_key_bindings
  fzf --fish | source
  bind \cf accept-autosuggestion
end
