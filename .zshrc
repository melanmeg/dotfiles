# ================================
#  load settings
# ================================

for file in ~/.my/shell_base/base.zsh; do
  source "$file"
done

for file in ~/.my/aliases/*; do
  source "$file"
done
