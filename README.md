# Reviewsa
<img src="https://user-images.githubusercontent.com/70557787/192438298-8fe3a089-96ca-4bed-a420-8a7ef6d3d25b.png">

## 概要
個人開発。<br>
大学受験の参考書について、現役大学生によるレビューを閲覧することができるサイト。<br>
制作期間：制作中（2022/9～）<br>

サイトURL：https://reviewsa-exam.herokuapp.com/<br>
**※サイトを閲覧したいだけの場合は、トップページを下にスクロールして「ログインせずに利用する」をクリックしてください。**
<hr>

## 制作の動機
参考書のレビューは、Amazonや楽天市場などのECサイトで閲覧することができる。<br>
しかし、それらのレビューを読んで得られる情報は、参考書それ自体が「良いか悪いか」であり、以下のような情報はほとんど得られない。

- どのくらいの学力の人が使うのに適しているか
- どのような使い方をしていたか
- どんな人におすすめしたいか
- レビューを書いた人の出身高校の偏差値
- レビューを書いた人の通っていた塾
- レビューを書いた人の受験科目
- レビューを書いた人の部活動の忙しさ etc...

したがって、その参考書が「自分に合っているか」や、その参考書を「どう使うべきか」について知ることが難しい。<br>

上記の問題について、参考書の詳細なレビューがまとまっているサイトがあれば、受験生が参考書を「適切に選び、適切に使う」ことができるようになるのではないかと考えたため、制作するに至った。
<hr><br>

## 技術スタック
- Ruby on Rails 7.0.3.1
- Bootstrap 5
- Rubocop 1.36.0
- Heroku 7.63.0
- GitHub Actions
<hr>

## 機能
### 非ログイン者
- レビューの閲覧機能
- レビューの投稿者のプロフィール閲覧機能

### ログイン者（受験生）
- レビューの閲覧機能
- レビューの投稿者のプロフィール閲覧機能
- 参考書のお気に入り追加・削除機能
- レビューのお気に入り追加・削除機能

### ログイン者（大学生）
- レビューの閲覧機能
- レビューの投稿者のプロフィール閲覧機能
- レビューの投稿・編集・削除機能

### その他
- ログイン機能（受験生・大学生）
- 参考書の検索機能（&検索）
- ページネーション機能
- URLの直打ち防止機能（レビューの編集）
- 入力フォームのエラーメッセージ機能 etc...
<hr><br>

## こだわった点
### ログイン機能を分けた
大学生は「レビューを投稿できる」、受験生は「参考書・レビューをお気に入り追加できる」という、それぞれに特有の機能を実装したかったため、ログイン機能を大学生と受験生に分けた。

### ログイン状態の記載
「大学生」「受験生」「非ログイン者」という3つの状態があるため、現在の状態がどれなのか分かるように、ヘッダーにログイン状態が常に表示されるようにした。

### URLの直打ち防止を徹底した
URLを直打ちすることで、<br>

- 別の大学生が投稿したレビューを編集できてしまう
- 同じ参考書のレビューを2つ以上書くことができてしまう
- 別の受験生のマイリストを閲覧できてしまう etc...

といったことが起きるため、ログイン情報を用いた判定でアクセス権を制御し、情報の信頼性を担保した。<br>

なお、URLを直打ちするとホーム画面にリダイレクトされるように設定した。

### フッターの位置
フッターが常にスクリーンの最下部に表示されるように、画面をスクロールしても位置が変わらないようにした。

### スマホ対応
レビューを投稿する大学生はPCを使う可能性がある一方で、受験生は基本的にスマホで利用すると考えられるため、レスポンシブデザインを意識した。

### 可読性・処理速度
可読性・処理速度を高めるため、以下を行った。
- 共通部分のテンプレート化
- 短いif文は1行にする
- 短いif-else文は三項演算子を使う
- eager_loadを用いたN+1問題の解消

### CI/CD
GitHub Actionsを用いて、以下を自動化した。
- Rubocopの実行
- Herokuへのデプロイ
<hr><br>

## 今後追加したい機能
- レビューのソート機能（星〇以上 etc...）
- アカウント作成時のメールアドレス認証機能
- ドメインを用いた、大学発行のメールアドレスのバリデーション機能
- アカウント作成時に大学名、高校名をプルダウンではなく検索できる機能
- アカウント作成時に大学名を選択すると、学部・学科が選択できるようになる機能
<hr><br>

## スクリーンショット
### レビューの投稿画面
<img src="https://user-images.githubusercontent.com/70557787/192693275-72d3886d-7a54-4d42-8dfe-996686d5f3c1.png">
<img src="https://user-images.githubusercontent.com/70557787/192693366-2f498d75-e127-4ed7-9f54-69cb298e35d9.png">
<br>

### レビューの投稿者（大学生）のプロフィール画面
<img src="https://user-images.githubusercontent.com/70557787/192445726-6b564c75-4897-46f2-8c5b-911c155fae89.png">
<img src="https://user-images.githubusercontent.com/70557787/192445886-74094eaf-937f-419a-90ad-c31e73b2ca32.png">
※「編集」「削除」ボタンは、レビューを投稿した大学生本人にしか表示されません。
