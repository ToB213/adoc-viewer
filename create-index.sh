#!/bin/sh

# ディレクトリを指定 (デフォルトは /usr/share/nginx/html/docs)
DIR="${1:-/usr/share/nginx/html/docs}"

# index.html を作成
cat << EOF > "${DIR}/index.html"
<!DOCTYPE html>
<html>
<head>
    <title>ドキュメント一覧</title>
</head>
<body>
    <h1>ドキュメント一覧</h1>
    <ul>
EOF

# HTMLファイルをリストアップしてリンクを生成
find "${DIR}" -maxdepth 1 -name "*.html" -not -name "index.html" | while read file; do
  filename=$(basename "$file")
  echo "    <li><a href=\"${filename}\">${filename}</a></li>" >> "${DIR}/index.html"
done

# index.html を閉じる
cat << EOF >> "${DIR}/index.html"
    </ul>
</body>
</html>
EOF

echo "index.html が ${DIR} に生成されました。"
