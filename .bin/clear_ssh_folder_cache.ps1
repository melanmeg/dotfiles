# VSCode SSH フォルダ の キャッシュを保存しているDBを削除
$file = "C:\path\to\your\file.txt"

# ファイルが存在するかを確認してから削除
if (Test-Path $file) {
    Remove-Item $file
    Write-Output "$file を削除しました。"
} else {
    Write-Output "$file が存在しません。"
}
