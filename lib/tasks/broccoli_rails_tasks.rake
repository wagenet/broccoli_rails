task "assets:precompile" do
  exec "broccoli build public/assets/client"
end
